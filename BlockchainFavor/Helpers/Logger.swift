//
//  Logger.swift
//  BlockchainFavor
//
//  Created by Pavlo Boiko on 15.06.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import Foundation

public enum LoggerEventType {
    case info
    case error
    case success
}

public protocol Logger:class {
    func didReciveEvent(type:LoggerEventType, message:String)
}
