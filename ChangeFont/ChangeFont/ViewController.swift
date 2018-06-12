//
//  ViewController.swift
//  ChangeFont
//
//  Created by Jamie on 2018/6/11.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeButton.layer.cornerRadius = CGFloat(50)
    }

    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var changeButton: UIButton!
    
    @IBAction func changeFont(_ sender: UIButton) {
        textArea.font = UIFont(name: "Medium", size: 20)
    }
    
}

