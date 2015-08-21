//
//  ViewController.swift
//  BlurrySideBar
//
//  Created by Eric Heitmuller on 8/20/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideBarDelegate{
    
    
    var sideBar: SideBar!

    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["first item", "second item", "third item"])
        
        sideBar.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sideBarDidSelectButtonAtIndex(index: Int) {
        if(index == 0){
            mainImageView.backgroundColor = UIColor.redColor()
            mainImageView.image = nil;
        } else if (index == 1){
            mainImageView.backgroundColor = UIColor.clearColor()
            mainImageView.image = UIImage(named: "vincentImage");
        } else if(index == 2){
            
        }
    }

}

