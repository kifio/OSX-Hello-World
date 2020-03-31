//
//  EggViewController.swift
//  HelloWorld_osx
//
//  Created by imurashov private on 31.03.20.
//  Copyright © 2020 imurashov. All rights reserved.
//

import Cocoa

class EggViewController: NSViewController {

    @IBOutlet weak var timeLabel: NSTextField!
    @IBOutlet weak var eggImage: NSImageView!

    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
    
    // MARK: - IBActions - menus

    @IBAction func startTimerMenuItemSelected(_ sender: Any) {
      startButtonClicked(sender)
    }

    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
      stopButtonClicked(sender)
    }

    @IBAction func resetTimerMenuItemSelected(_ sender: Any) {
      resetButtonClicked(sender)
    }
}
