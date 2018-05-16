//
//  BlockchainFavor.swift
//  CocoaAsyncSocket
//
//  Created by Pavlo Boiko on 5/918.
//

import Foundation
import NSData_FastHex

public protocol BlockchainFavorDelegate: class {
    func blockchainFavor(updatedStats stats: BlockchainFavorStats)
    func blockchainFavorStops()
}

public final class BlockchainFavor {
    
    // MARK: Public Properties
    
    public weak var delegate: BlockchainFavorDelegate?
    
    // MARK: Internal Properties
    
    let client: Client
    
    let jobSemaphore = DispatchSemaphore(value: 1)
    var job: Job?
    
    var threads: [Thread] = []
    
    let statsSemaphore = DispatchSemaphore(value: 1)
    var stats = BlockchainFavorStats()
    var isStoped:Bool = true
    
    public init(host: String = "pool.supportxmr.com", port: Int = 3333, destinationAddress: String, clientIdentifier: String = "\(arc4random())") {
        let url: URL = {
            var components = URLComponents()
            components.scheme = "stratum+tcp"
            components.user = destinationAddress
            components.password = clientIdentifier
            components.host = host
            components.port = port
            return components.url!
        }()
        client = Client(url: url)
        client.delegate = self
    }
    
    deinit {
        stop()
    }
    
    public func start(threadLimit: Int = ProcessInfo.processInfo.activeProcessorCount) throws {
        isStoped = false
        try client.connect()
        let threadCount = max(min(ProcessInfo.processInfo.activeProcessorCount, threadLimit), 1)
        for i in 0 ..< threadCount {
            let t = Thread(block: calculate)
            t.name = "Calculating Thread \(i+1)"
            t.qualityOfService = .background
            threads.append(t)
            t.start()
        }
    }
    
    public func stop() {
        isStoped = true
        threads.forEach { $0.cancel() }
        threads = []
        client.disconnect()
        delegate?.blockchainFavorStops()
    }
}

extension BlockchainFavor: ClientDelegate {
    func client(_ client: Client, receivedJob: Job) {
        jobSemaphore.wait()
        job = receivedJob
        jobSemaphore.signal()
    }
}

extension BlockchainFavor {
    
    fileprivate func calculate() {
        
        let hasher = HashContext()
        
        while !Thread.current.isCancelled {
            autoreleasepool {
                hash(with: hasher)
            }
        }
        
    }
    
    private func hash(with hasher: HashContext) {
        jobSemaphore.wait()
        guard let job = job else {
            jobSemaphore.signal()
            return
        }
        job.nonce += 1
        let blob = job.blob
        let currentNonce = job.nonce
        jobSemaphore.signal()
        let result = hasher.hashData(blob)
        
        statsSemaphore.wait()
        stats.hashes += 1
        let now = Date()
        if (now.timeIntervalSince(stats.lastDate) >= 0.1) {
            let s = self.stats
            DispatchQueue.main.async {
                if !self.isStoped {
                    self.delegate?.blockchainFavor(updatedStats: s)
                }
            }
            stats.lastDate = now
            stats.hashes = 0
        }
        statsSemaphore.signal()
        
        if job.evaluate(hash: result) {
            DispatchQueue.main.async {
                do {
                    try self.client.submitJob(id: job.id, jobID: job.jobID, result: result, nonce: currentNonce)
                }
                catch {}
            }
            statsSemaphore.wait()
            stats.submittedHashes += 1
            DispatchQueue.main.async {
                if !self.isStoped {
                    self.delegate?.blockchainFavor(updatedStats: self.stats)
                }
            }
            statsSemaphore.signal()
        }
    }
}

