//
//  ViewController.swift
//  YMobStatus
//
//  Created by numa08 on 2014/12/16.
//  Copyright (c) 2014年 numanuma08. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBAction func cliecked(sender: AnyObject) {
        let inputtedString = textField.text
        NSOperationQueue().addOperationWithBlock { () -> Void in
            let client = NNYMobClient.clientForName("W303H", withIPAddress: inputtedString)
            var error : NSError?
            let sessionId = client.requestSessionIDWithError(&error)
            client.sessionID = sessionId
            if let e = error {
                NSLog("error is \(e.userInfo![NSLocalizedDescriptionKey])")
                return
            }
            let signalStrength = client.requestSignalStrengthWithError(&error)
            if let e = error {
                NSLog("error is \(e.userInfo![NSLocalizedDescriptionKey])")
                return
            }
            NSLog("signal strength is \(signalStrength)")
        }
    }
    
}