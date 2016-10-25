//
//  VC3.swift
//  LeftToRightButtons
//
//  Created by Eric Heitmuller on 6/20/16.
//  Copyright © 2016 Eric Heitmuller. All rights reserved.
//

import Foundation
import UIKit

class VC3 : UIViewController{
	
	@IBOutlet weak var scrollview: UIScrollView!
	var count = 0
	
	@IBAction func addButton(sender: AnyObject) {
		let button = UIButton()
		
		
		let X_Offset : CGFloat = (90 * CGFloat(self.count))
		button.frame = CGRectMake(X_Offset, 0, 80, 20)
		button.setTitle("Number:\(count)", forState: .Normal)
		button.backgroundColor = count % 2 == 0 ? UIColor.redColor() : UIColor.blueColor()

		scrollview.addSubview(button)
		
		count += 1
		
		var contentRect = CGRectZero
		for view in scrollview.subviews {
			contentRect = CGRectUnion(contentRect, view.frame);
		}
		scrollview.contentSize = contentRect.size;
		
	}
	
}