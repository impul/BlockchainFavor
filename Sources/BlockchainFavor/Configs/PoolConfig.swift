//
//  PoolConfig.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 22.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import Foundation

public struct PoolConfig {
    static let defaultConfig = PoolConfig(name: "SupportXMR",
                                       address: "pool.supportxmr.com",
                                          port: 5555)
    let name:String
    let address:String
    let port:Int
}
