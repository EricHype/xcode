//
//  ViewController.swift
//  battleship
//
//  Created by Eric Heitmuller on 4/22/16.
//  Copyright © 2016 Eric Heitmuller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
		var position = Position(x: 0, y: 0)
		var here = position.minus(Position(x: 5, y: 5))
		
		print(here)
		
		var stuff = position.shift(position.circle(10), offset: Position(x: 5, y: 5))
		
		print(stuff)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

