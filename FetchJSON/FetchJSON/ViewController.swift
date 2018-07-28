//
//  ViewController.swift
//  FetchJSON
//
//  Created by Jamie Maple on 2018/7/28.
//  Copyright © 2018 Jamie Maple. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "waiting"
        return label
    }()
    var status = 0 {
        didSet {
            switch status {
            case 1:
                statusLabel.text = "Loading"
            case 2:
                statusLabel.text = "finished"
            default:
                statusLabel.text = "waiting"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .orange
        setUp()
    }
    
    private func setUp() {
        let label = UILabel()
        label.text = "fetch data!"
        self.view.addSubview(label)
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        label.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleFetch))
        label.addGestureRecognizer(tapGestureRecognizer)
        
        // status label
        self.view.addSubview(statusLabel)
        statusLabel.frame = CGRect(x: 100, y: 200, width: 100, height: 20)
    }
    
    @objc func handleFetch() {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response)
            self.status = 2
        }
        self.status = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

