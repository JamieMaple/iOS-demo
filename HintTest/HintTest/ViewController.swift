//
//  ViewController.swift
//  HintTest
//
//  Created by Jamie Maple on 2018/7/28.
//  Copyright © 2018 Jamie Maple. All rights reserved.
//

import UIKit

class View: UIView {
    var title: String = "view"
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(self.title)
        return super.hitTest(point, with: event)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .green
        // parent-1
        let parent1 = View(frame: CGRect(x: 30, y: 0, width: 400, height: 300))
        parent1.backgroundColor = .yellow
        parent1.title = "parent-1"
        self.view.addSubview(parent1)
        let parent1Sub = View(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        parent1.addSubview(parent1Sub)
        parent1Sub.backgroundColor = .purple
        parent1Sub.title = "parent-1-sub"
        
        // parent-2
        let parent2 = View(frame: CGRect(x: 30, y: 350, width: 400, height: 300))
        parent2.title = "parent-2"
        parent2.backgroundColor = .orange
        self.view.addSubview(parent2)
        let parent2Sub = View(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        parent2.addSubview(parent2Sub)
        parent2Sub.backgroundColor = .gray
        parent2Sub.title = "parent-2-sub"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

