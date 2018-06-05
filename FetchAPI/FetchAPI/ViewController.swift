//
//  ViewController.swift
//  FetchAPI
//
//  Created by Jamie on 2018/6/5.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var tableArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        parseJSON()
    }
    
    func parseJSON() {
        let url = URL(string: "https://api.myjson.com/bins/vi56v")
        
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, err) in
            guard err == nil else {
                print("returned error")
                return
            }
            
            guard let content = data else {
                print("no data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: .mutableContainers)) as? [String: Any] else {
                print("Not containning JSON")
                return
            }
            
            if let array = json["companies"] as? [String] {
                self.tableArray = array
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        task.resume()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = self.tableArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
}


