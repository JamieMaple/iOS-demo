//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by JamieMaple on 2018/7/22.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
        setUpTabBar()
    }
    
    func setUp() {
        view.backgroundColor = .white
    }
    func setUpTabBar() {
        let homeVC = HomeViewController()
        let goodsVC = GoodsViewController()
        
        homeVC.tabBarItem.title = "Home"
        
        goodsVC.tabBarItem.title = "Goods"
        
        tabBar.barTintColor = .white
        homeVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red: 255/255, green: 108/255, blue: 138/255, alpha: 1.0)], for: .selected)
        goodsVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red: 255/255, green: 108/255, blue: 138/255, alpha: 1.0)], for: .selected)
        
        viewControllers = [homeVC, goodsVC]
    }

}

