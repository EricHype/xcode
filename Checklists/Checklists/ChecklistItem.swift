//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Eric Heitmuller on 7/16/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked;
    }
    
}