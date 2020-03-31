//
//  ViewController.swift
//  HelloWorld_osx
//
//  Created by imurashov private on 31.03.20.
//  Copyright © 2020 imurashov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var label: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sayHelloClicked(_ sender: Any) {
        
        var name = textField.stringValue
        if name.isEmpty {
           name = "Melancholia"
        }
        
        let greeting = "Hello, \(name)!"
        label.stringValue = greeting
    }
}

