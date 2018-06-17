//
//  HashStats.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 5/1618.
//

import Foundation

public struct BlockchainFavorStats {
    
    // MARK: Public Properties
    
    public internal(set) var hashes: UInt = 0 {
        didSet {
            hashesCount+=1
        }
    }
    public internal(set) var submittedHashes: UInt = 0
    
    public var hashRate: Double {
        let interval = Date().timeIntervalSince(startDate)
        return TimeInterval(hashesCount) / interval
    }
    
    var hashesCount: UInt = 0
    var startDate:Date = Date()
    // MARK: Internal Properties
    
    var lastDate = Date()
    
    // MARK Initialization
    
    init() {}
    
    mutating func reset() {
        self.startDate = Date()
        self.hashesCount = 0
    }
    
}
