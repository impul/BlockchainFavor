//
//  BFConfig.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 22.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import Foundation

class BFConfig {
    
    static var client:ClientConfig = .defaultConfig
    static var pool:PoolConfig = .defaultConfig
    
    @discardableResult
    public init(clientConfig:ClientConfig,poolConfig:PoolConfig = .defaultConfig) {
        BFConfig.client = clientConfig
        BFConfig.pool = poolConfig
    }
    
}
