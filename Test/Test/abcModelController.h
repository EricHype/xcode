//
//  abcModelController.h
//  Test
//
//  Created by Eric Heitmuller on 7/21/14.
//  Copyright (c) 2014 elite. All rights reserved.
//

#import <UIKit/UIKit.h>

@class abcDataViewController;

@interface abcModelController : NSObject <UIPageViewControllerDataSource>

- (abcDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(abcDataViewController *)viewController;

@end
