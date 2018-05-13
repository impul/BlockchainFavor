//
//  ClientConfig.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 21.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import Foundation

public struct ClientConfig {
    
    static let defaultConfig = ClientConfig(appName:"Blochain Favor",
                                             wallet:"44e9qpGrCfEVNW3qDWEctTJimbnjNv7PX1xKkT1Sh6yQHXTQACu7fQZVC8MChMTobeJrpXDdwQdB9KL9aywqfwyfT3pWSPT",
                                           workerID:"main")
    let appName:String
    let wallet:String
    let workerID:String
}
