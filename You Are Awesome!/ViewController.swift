//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Zach Wilner on 9/3/17.
//  Copyright © 2017 Wilner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    //This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("!!! The view controller loaded!")
    }

    

    @IBAction func messageButtonPressed(_ sender: UIButton) {
    print("*** Show Message Pressed")
        
    messageLabel.text = "You Are Awesome!"
        
    messageLabel.textColor = UIColor.red
    
    messageLabel.textAlignment = NSTextAlignment.left
    }
    
    @IBAction func anotherMessageButton(_ sender: UIButton) {
        print("*** Show Another Message Pressed")
        messageLabel.text = "You Are Great!"
        messageLabel.textColor = UIColor.blue
        messageLabel.textAlignment = NSTextAlignment.right

    }
}

