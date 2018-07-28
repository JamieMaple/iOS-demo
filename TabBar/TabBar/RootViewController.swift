//
//  ViewController.swift
//  TabBar
//
//  Created by Jamie Maple on 2018/7/28.
//  Copyright © 2018 Jamie Maple. All rights reserved.
//

import UIKit
import SnapKit

class Button: UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let radius = self.frame.width / 2
        let center = CGPoint(x: radius, y: radius)
        //        print(point, center)
        return pow(center.x - point.x, 2) + pow(center.y - point.y, 2) <= pow(radius, 2)
    }
}

protocol PlusButtonDelegate: NSObjectProtocol {
    func handlePlus()
}

class RootViewController: UITabBarController, PlusButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bar = RootTabBar()
        bar.plusButtonDelegate = self
        self.setValue(bar, forKey: "tabBar")

        setControllers()
    }
    
    private func setControllers() {
        var controllers: [UIViewController] = []
        let colors = [UIColor.orange, UIColor.blue, UIColor.green, UIColor.gray]
        for index in 0..<colors.count {
            let controller = UIViewController()
            controller.view.backgroundColor = colors[index]
            controller.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: index)
            controllers.append(controller)
        }
        for controller in controllers {
            self.addChildViewController(controller)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handlePlus() {
        print("hello")
    }

}

extension UIImage {
    
    static func filled(with color: UIColor) -> UIImage {
        let pixelScale = UIScreen.main.scale
        let pixelSize = 1 / pixelScale
        let fillSize = CGSize(width: pixelSize, height: pixelSize)
        let fillRect = CGRect(origin: CGPoint.zero, size: fillSize)
        UIGraphicsBeginImageContextWithOptions(fillRect.size, false, pixelScale)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext!.setFillColor(color.cgColor)
        graphicsContext!.fill(fillRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

class RootTabBar: UITabBar {
    weak var plusButtonDelegate: PlusButtonDelegate?
    let button = Button()
    let middleView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundImage = UIImage.filled(with: .white)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("no implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // relayout
        var index = 0
        var prevBarItem: UIView?
//        middleView.backgroundColor = .green
        self.addSubview(middleView)
        middleView.addSubview(button)
        button.addTarget(self, action: #selector(self.handlePlus), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.center.equalTo(middleView)
            make.height.width.equalTo(60)
        }
        button.setTitle("+", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        for barItem in self.subviews {
            if barItem.isKind(of: NSClassFromString("UITabBarButton")!) {
                if index == 2 {
                    // set prev
                    middleView.snp.makeConstraints { make in
                        make.leading.equalTo(prevBarItem!.snp.trailing)
                        make.top.equalTo(self.snp.top).offset(-20)
                        make.height.equalTo(60)
                        make.width.equalTo(self.snp.width).dividedBy(5.0)
                    }
                    prevBarItem = middleView
                }
                
                barItem.snp.makeConstraints { make in
                    if let prevBarItem = prevBarItem {
                        make.leading.equalTo(prevBarItem.snp.trailing)
                    } else {
                        make.leading.equalTo(self.snp.leading)
                    }
                    
                    make.top.equalTo(self.snp.top)
                    make.height.equalTo(self.snp.height)
                    make.width.equalTo(self.snp.width).dividedBy(5.0)
                }
                
                // set prev
                prevBarItem = barItem
                
                index += 1
            }
        }
        
        self.backgroundColor = .white
    }
    
    @objc func handlePlus() {
        self.plusButtonDelegate?.handlePlus()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        let onMiddleview = self.convert(point, to: self.middleView)
        if self.middleView.point(inside: onMiddleview, with: event) {
            return self.middleView.hitTest(onMiddleview, with: event)
        } else {
            return super.hitTest(point, with: event)
        }
    }
}

