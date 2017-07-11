//
//  ViewController.swift
//  GroceryList
//
//  Created by Daniel Thompson on 7/10/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var jsonData = [
        "Produce": ["Celery", "Potato", "Rhubarb"],
        "Dairy": ["Milk", "Yoghurt"],
        "Bakery": ["Loaf"]
    ]
    
    struct GroceryCategory {
        var name: String
        var items: [String]
    }
    
    var dataArray = [GroceryCategory]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 30
        
//        var stagingStruct = GroceryCategory(name: "first piece", items: ["blah"])
        
        for (key, value) in jsonData {
            dataArray.append(GroceryCategory(name: key, items: value))
//            stagingStruct.name = key
//            stagingStruct.items = value
//            dataArray.append(stagingStruct)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        
        let label = UILabel(frame: CGRect(x: 0, y: 5, width: tableView.frame.size.width, height: 18))
        
        label.text = dataArray[section].name
        label.textAlignment = .center
        
        view.addSubview(label)
        
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataArray[ indexPath.section ].name )
        cell?.textLabel?.text = dataArray[indexPath.section].items[indexPath.row]
        return cell!
    }


}

