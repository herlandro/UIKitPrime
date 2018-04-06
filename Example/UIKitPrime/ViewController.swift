//
//  ViewController.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 05/04/2018.
//  Copyright (c) 2018 Herlandro Hermogenes. All rights reserved.
//

import UIKit
import UIKitPrime

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let log = Logger()
        log.printLog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

