//
//  ViewController.swift
//  Sider
//
//  Created by JamieMaple on 2018/7/21.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    var navController: UINavigationController! = nil
    var sider: UIViewController! = nil
    let slideMaxXPosition = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        navController = storyboard.instantiateViewController(withIdentifier: "navigation") as? UINavigationController
        sider = storyboard.instantiateViewController(withIdentifier: "sider")
        
        addChildViewController(navController)
        addChildViewController(sider)
        
        view.addSubview(sider.view)
        
        view.addSubview(navController.view)
        
        navController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        sider.view.frame = CGRect(x: 0, y: 0, width: 200, height: view.frame.height)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var panGestureBegan = CGPoint.zero
    var lastPanGesturePosition = CGPoint.zero
    
    @objc private func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        let recognizerTranslation = recognizer.translation(in: navController.view)
        
        let dx = recognizerTranslation.x
        
        switch recognizer.state {
        case .began:
            panGestureBegan = recognizerTranslation
            print("began", dx)
        case .changed:
            repaintView(dx: dx)
            print("moved", dx)
        case .ended:
            repaintView(dx: dx)
            lastPanGesturePosition = recognizerTranslation
            print("ended", dx)
        default:
            print("others", dx)
        }
    }
    
    private func repaintView(dx changedX: CGFloat) {
        navController.view.frame.origin.x = lastPanGesturePosition.x + panGestureBegan.x + changedX
    }

}

