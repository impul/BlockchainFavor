//
//  BlockchainFavor.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 21.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

public class BlockchainFavor {
    
    let blochainClient:BlockchainNetworkClient
    
    public init() {
        blochainClient = BlockchainNetworkClient(with: BFConfig.requestURL())
    }
    
    public func startCalculating() {
        
    }
    
    public func endCalculating() {
        
    }
}
