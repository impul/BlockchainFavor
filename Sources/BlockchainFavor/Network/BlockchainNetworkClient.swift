//
//  BlockchainNetworkClient.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 30.04.18.
//

import Foundation
import CocoaAsyncSocket

class BlockchainNetworkClient {
 
    let blockchainUrl:URL
    let socket:GCDAsyncSocket
    let socketDelegate = BlockchainSocketDelegate()
    
    init(with url:URL) {
        blockchainUrl = url
        socket = GCDAsyncSocket(delegate: socketDelegate, delegateQueue: .main)
    }
    
}
