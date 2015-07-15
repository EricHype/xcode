//
//  abcDataViewController.m
//  Test
//
//  Created by Eric Heitmuller on 7/21/14.
//  Copyright (c) 2014 elite. All rights reserved.
//

#import "abcDataViewController.h"

@interface abcDataViewController ()

@end

@implementation abcDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
