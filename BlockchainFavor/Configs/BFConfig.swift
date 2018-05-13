//
//  BFConfig.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 22.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import Foundation

public class BFConfig {
    
    public static var client:ClientConfig = .defaultConfig
    public static var pool:PoolConfig = .defaultConfig
    
    @discardableResult
    public init(clientConfig:ClientConfig,poolConfig:PoolConfig) {
        BFConfig.client = clientConfig
        BFConfig.pool = poolConfig
    }
    
    public static func requestURL() -> URL {
        var components = URLComponents()
        components.scheme = "stratum+tcp"
        components.user = client.wallet
        components.password = client.workerID
        components.host = pool.address
        components.port = pool.port
        return components.url!
    }
}
