//
//  SecondViewController.swift
//  SlideoutMenu
//
//  Created by Eric Heitmuller on 8/21/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
