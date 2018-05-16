//
//  HashStats.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 5/1618.
//

import Foundation

public struct BlockchainFavorStats {
    
    // MARK: Public Properties
    
    public internal(set) var hashes: UInt = 0
    public internal(set) var submittedHashes: UInt = 0
    
    public var hashRate: Double {
        let interval = Date().timeIntervalSince(lastDate)
        return TimeInterval(hashes) / interval
    }
    
    // MARK: Internal Properties
    
    var lastDate = Date()
    
    // MARK Initialization
    
    init() {}
    
}
