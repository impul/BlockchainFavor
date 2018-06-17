//
//  RPCObject.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 5/918.
//

import Foundation
import ObjectMapper

class RPCObject: Mappable {
    
    // MARK: Properties
    
    private var jsonrpc = "2.0"
    
    // MARK: Initialization
    
    init() {}
    required init?(map: Map) {}
    
    // MARK: Mapping
    
    func mapping(map: Map) {
        jsonrpc <- map["jsonrpc"]
    }
    
}
