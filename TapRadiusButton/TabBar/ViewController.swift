//
//  ViewController.swift
//  TabBar
//
//  Created by Jamie Maple on 2018/7/28.
//  Copyright © 2018 Jamie Maple. All rights reserved.
//

import UIKit

func isInCircle(center cirle: CGPoint, point: CGPoint, radius: CGFloat) -> Bool {
    let distanceDouble = pow(cirle.x - point.x, 2) + pow(cirle.y - point.y, 2)
    return distanceDouble <= pow(radius, 2)
}

class Button: UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let radius = self.frame.width / 2
        let center = CGPoint(x: radius, y: radius)
        return isInCircle(center: center, point: point, radius: radius)
    }
}

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBar.shadowImage = UIImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }
    
    private func setUp() {
        let button = Button(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        self.view.addSubview(button)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 100
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        button.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        print("tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

