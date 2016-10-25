//
//  VC2.swift
//  LeftToRightButtons
//
//  Created by Eric Heitmuller on 6/20/16.
//  Copyright © 2016 Eric Heitmuller. All rights reserved.
//

import Foundation
import UIKit

class VC2 : UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	var count = 0
	
	@IBAction func addToStack(sender: AnyObject) {
		let button = UIButton()
		button.titleLabel!.text = "Number:\(count)"
		button.backgroundColor = UIColor.redColor()
		button.widthAnchor.constraintEqualToConstant(self.view.frame.width).active = true
		button.heightAnchor.constraintEqualToConstant(20.0).active = true
		count += 1
		collectionView.reloadData()
	}
	
}


extension VC2 : UICollectionViewDataSource{
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
		
		cell.backgroundColor = UIColor.redColor()
		return cell
	}
}