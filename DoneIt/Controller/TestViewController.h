//
//  TestViewController.h
//  DoneIt
//
//  Created by eungJin on 5/20/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DoneItsDataModel.h"
#import "DoneIt.h"

@interface TestViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

- (IBAction)doneItBtn:(id)sender;
- (IBAction)startBtnTouched:(id)sender;

@end