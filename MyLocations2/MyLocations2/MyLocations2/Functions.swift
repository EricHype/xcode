//
//  Functions.swift
//  MyLocations2
//
//  Created by Eric Heitmuller on 9/30/15.
//  Copyright © 2015 Eric Heitmuller. All rights reserved.
//

import Foundation
import Dispatch

func afterDelay(seconds: Double, closure: () -> ()) {
	let when = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
	dispatch_after(when, dispatch_get_main_queue(), closure)
}
