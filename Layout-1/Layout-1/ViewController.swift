//
//  ViewController.swift
//  Layout-1
//
//  Created by JamieMaple on 2018/7/21.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let red = UIView()
    let blue = UIView()
    let green = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let container = UIView()
        view.addSubview(container)
        [red, blue, green].forEach { container.addSubview($0) }
        // set background color
        red.backgroundColor = .red
        blue.backgroundColor = .blue
        green.backgroundColor = .green
        // enable auto layout
        container.translatesAutoresizingMaskIntoConstraints = false
        red.translatesAutoresizingMaskIntoConstraints = false
        blue.translatesAutoresizingMaskIntoConstraints = false
        green.translatesAutoresizingMaskIntoConstraints = false
        // container
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        // red
        red.topAnchor.constraint(equalTo: container.topAnchor, constant: 16).isActive = true
        red.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16).isActive = true
        red.widthAnchor.constraint(equalToConstant: 100).isActive = true
        red.heightAnchor.constraint(equalToConstant: 100).isActive = true
        // green
        green.leftAnchor.constraint(equalTo: red.rightAnchor, constant: 16).isActive = true
        green.topAnchor.constraint(equalTo: container.topAnchor, constant: 16).isActive = true
        green.widthAnchor.constraint(equalToConstant: 100).isActive = true
        green.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // blue
        blue.topAnchor.constraint(equalTo: green.bottomAnchor, constant: 16).isActive = true
        blue.leftAnchor.constraint(equalTo: red.rightAnchor, constant: 16).isActive = true
        blue.bottomAnchor.constraint(equalTo: red.bottomAnchor).isActive = true
        blue.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

