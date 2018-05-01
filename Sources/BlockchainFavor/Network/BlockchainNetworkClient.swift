//
//  BlockchainNetworkClient.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 30.04.18.
//

import Foundation
import CocoaAsyncSocket

class BlockchainNetworkClient:NSObject, GCDAsyncSocketDelegate {
 
    let blockchainUrl:URL
    var socket:GCDAsyncSocket!
    
    required init(with url:URL) {
        blockchainUrl = url
        super.init()
        socket = GCDAsyncSocket(delegate: self, delegateQueue: .main)
    }
    
    //MARK: - Controls
    
    func connectToNetwork() throws {
        guard socket.isDisconnected else { return }
        try socket.connect(toHost: blockchainUrl.host ?? "", onPort: UInt16(blockchainUrl.port ?? 5555))
    }
    
    func disconnect() {
        guard socket.isConnected else { return }
        socket.disconnect()
    }
    
    //MARK: - GCDAsyncSocketDelegate
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        
    }
}

