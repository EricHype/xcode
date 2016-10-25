//
//  ViewController.swift
//  LeftToRightButtons
//
//  Created by Eric Heitmuller on 6/20/16.
//  Copyright © 2016 Eric Heitmuller. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("ButtonsCell") as! ButtonsCell
		
		for i in 0..<10 {
			let button = UIButton()
			button.titleLabel!.text = "Number:\(i)"
			button.widthAnchor.constraintEqualToConstant(self.view.frame.width).active = true
			button.heightAnchor.constraintEqualToConstant(20.0).active = true
			cell.stackView.addArrangedSubview(button)
		}
		
		return cell
	}
}

