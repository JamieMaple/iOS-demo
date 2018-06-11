//
//  ViewController.swift
//  TimeCounter
//
//  Created by Jamie on 2018/6/11.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter = 0.0 {
        didSet {
            counterLabel.text = String(format: "%.1f", counter)
        }
    }
    
    var timer: Timer?
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterLabel.text = "0.0"
    }
    
    // MARK: actions
    @IBAction func startCounter(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    @IBAction func pauseCounter(_ sender: UIButton) {
        if let timer = timer {
            timer.invalidate()
        }
        startButton.isEnabled = true
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        pauseCounter(sender)
        counter = 0
        startButton.isEnabled = true
    }
    
    // MARK: actions
    @objc func updateTime() {
        counter += 0.1
    }
    
}

