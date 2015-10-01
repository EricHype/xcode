//
//  ViewController.swift
//  SlideoutMenu
//
//  Created by Eric Heitmuller on 8/21/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openBarButton: UIBarButtonItem!
    
    @IBOutlet weak var label: UILabel!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openBarButton.target = self.revealViewController()
        
        openBarButton.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        if(varView == 0){
            label.text = "Strings"
        } else{
            label.text = "Others"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

