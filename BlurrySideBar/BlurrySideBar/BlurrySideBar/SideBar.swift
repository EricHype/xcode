//
//  SideBar.swift
//  BlurrySideBar
//
//  Created by Eric Heitmuller on 8/21/15.
//  Copyright (c) 2015 Eric Heitmuller. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate{
    func sideBarDidSelectButtonAtIndex(index : Int)
    optional func sideBarWillClose()
    optional func sideBarWillOpen()
}


class SideBar: NSObject, SideBarTableViewControllerDelegate {

    let barWidth : CGFloat = 150.0
    let sideBarTableViewTopInset : CGFloat = 64.0
    let sideBarContainerView : UIView = UIView()
    let sideBarTableViewController = SideBarTableViewController()
    let originView : UIView!
    var animator : UIDynamicAnimator!
    var delegate : SideBarDelegate?
    var isSideBarOpen : Bool = false
    
    
    init(sourceView: UIView, menuItems: [String]){
        
        originView = sourceView
        sideBarTableViewController.tableData = menuItems
        
        super.init()
        
        setupSideBar()
        
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGestureRecognizer : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        showGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        originView.addGestureRecognizer(showGestureRecognizer)
        
        let hideGestureRecognizer = UISwipeGestureRecognizer(target: self, action : Selector("handleSwipe:"))
        hideGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        originView.addGestureRecognizer(hideGestureRecognizer)
        
    }
    
    func setupSideBar(){
        sideBarContainerView.frame = CGRectMake(-barWidth - 1, originView.frame.origin.y
            , barWidth, originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.clearColor()
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        blurView.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurView)
        
        sideBarTableViewController.delegate = self;
        sideBarTableViewController.tableView.frame = sideBarContainerView.bounds
        sideBarTableViewController.tableView.clipsToBounds = false;
        sideBarTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        sideBarTableViewController.tableView.backgroundColor = UIColor.clearColor()
        sideBarTableViewController.tableView.scrollsToTop = false;
        sideBarTableViewController.tableView.contentInset = UIEdgeInsetsMake(sideBarTableViewTopInset, 0, 0, 0)
        
        sideBarTableViewController.tableView.reloadData()
        sideBarContainerView.addSubview(sideBarTableViewController.tableView)
    }
    
    func handleSwipe(sender : UISwipeGestureRecognizer){
        if(sender.direction == UISwipeGestureRecognizerDirection.Left){
            showSideBar(false);
        } else {
            showSideBar(true);
            delegate?.sideBarWillOpen?()
        }
    }
    
    func showSideBar(shouldOpen : Bool){
        animator.removeAllBehaviors()
        isSideBarOpen = shouldOpen;
        
        let gravity : CGFloat = shouldOpen ? 0.5 : -0.5
        let magnitude: CGFloat = (shouldOpen) ? 20 : -20
        let boundaryX: CGFloat = shouldOpen ? barWidth : -barWidth - 1
        
        let gravityBehavior : UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBehavior.gravityDirection = CGVectorMake(gravity, 0)
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundaryWithIdentifier("sideBarBoundary", fromPoint: CGPointMake(boundaryX, 20), toPoint: CGPointMake(boundaryX, originView.frame.size.height))
        
        animator.addBehavior(collisionBehavior)
        
        let pushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = magnitude
        
        animator.addBehavior(pushBehavior)
        
        let sideBarBehavior = UIDynamicItemBehavior(items: [sideBarContainerView])
        sideBarBehavior.elasticity = 0.3
        
        animator.addBehavior(sideBarBehavior)
    }
    
    func sideBarControlDidSelectRow(indexPath: NSIndexPath) {
        delegate?.sideBarDidSelectButtonAtIndex(indexPath.row)
    }
    
}
