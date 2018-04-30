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
    
    static func requestURL() throws -> URL {
        var components = URLComponents()
        components.scheme = "stratum+tcp"
        components.user = client.wallet
        components.password = client.workerID
        components.host = pool.address
        components.port = pool.port
        guard let url = components.url else {
            throw NSError(domain: "Can not create url request", code: 400, userInfo: nil)
        }
        return url
    }
}
