//
//  TopNavViewController.m
//  DoneIt
//
//  Created by eungJin on 5/28/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "TopNavViewController.h"

@interface TopNavViewController ()

@end

@implementation TopNavViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[MenuRightViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

@end
