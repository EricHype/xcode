//
//  BackTableViewController.swift
//  SlideoutMenu
//
//  Created by Eric Heitmuller on 8/21/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import Foundation

class BackTableViewController : UITableViewController{
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        
        tableArray = ["Hello", "Second", "World"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell;
    }
    
   
}