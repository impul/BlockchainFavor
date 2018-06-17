//
//  ConsoleViewController.swift
//  Example
//
//  Created by Pavlo Boiko on 15.06.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import UIKit
import BlockchainFavor

class ConsoleViewController: UIViewController, Logger {
    
    //MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.blockchainFavor?.logger = self
    }
    
    //MARK: - Actions
    
    @IBAction func clearAction(_ sender: AnyObject) {
        textView.text = ""
    }
    
    //MARK: - Logger
    
    func didReciveEvent(type:LoggerEventType, message:String) {
        var logString:String
        switch type {
        case .error:
            logString = "♦️"
        case .success:
            logString = "🔷"
        case .info:
            logString = "🔶"
        }
        let timeStamp = Date().description
        logString.append(" [\(timeStamp.dropLast(6))] ")
        logString.append(message)
        logString.append("\n")
        OperationQueue.main.addOperation {
            self.textView.text.append(logString)
        }
    }
    
}
