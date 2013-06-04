//
//  IntialSlidingViewController.m
//  DoneIt
//
//  Created by eungJin on 5/24/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "IntialSlidingViewController.h"

@interface IntialSlidingViewController ()

@end

@implementation IntialSlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIStoryboard *storyboard;
    //if you don do this NSInvalidArgumentException...... object cannot be nil error will occur
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    }
    
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"FirstTop"];

}

@end
