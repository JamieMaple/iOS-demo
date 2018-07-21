//
//  SiderViewController.swift
//  Sider
//
//  Created by JamieMaple on 2018/7/22.
//  Copyright © 2018 JamieMaple. All rights reserved.
//

import UIKit

class SiderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    @IBAction func toGreen(_ sender: UIButton) {
        toView(to: "green")
    }
    
    @IBAction func toYellow(_ sender: UIButton) {
        toView(to: "yellow")
    }
    
    private func toView(to seguename: String) {
        let parent = self.parent as! IndexViewController
        let navController = parent.navController.topViewController!
        print(navController)
        print(seguename)
        navController.performSegue(withIdentifier: seguename, sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
