//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by JamieMaple on 2018/7/22.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {

    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = .white
        title = "Demo"
        let mainView = UIView()
        view.addSubview(mainView)
        mainView.backgroundColor = .gray
        mainView.snp.makeConstraints {
            make in
            make.edges.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

