//
//  TestViewController.m
//  DoneIt
//
//  Created by eungJin on 5/20/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController () {
    NSFetchedResultsController *_fetchedResultsController;
    NSManagedObjectContext *context;
}

@end

@implementation TestViewController
@synthesize startBtn=_startBtn;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //search if we need a starBtn or not
   context = [[DoneItsDataModel sharedDataModel] mainContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[DoneIt entityName] inManagedObjectContext:context];
    [request setEntity:entity];
    NSPredicate *searchFilter = [NSPredicate predicateWithFormat:@"end = nil"];
    [request setPredicate:searchFilter];
    NSArray *results = [context executeFetchRequest:request error:nil];
   // [self loadDoneItData];
    
    if (results.lastObject == nil) {
        self.startBtn.enabled = YES;
        self.startBtn.hidden = NO;
        self.doneitBtn.enabled = NO;
        self.doneitBtn.hidden = YES;
        self.inputTextField.hidden =YES;
    }
    else {
        self.startBtn.enabled = NO;
        self.startBtn.hidden = YES;
        self.doneitBtn.enabled = YES;
        self.doneitBtn.hidden = NO;
        self.inputTextField.hidden = NO;
    }
    
    //iad
    [[LARSAdController sharedManager] addAdContainerToViewInViewController:self];

    //dismiss keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma methods
-(void)dismissKeyboard {
    [[self inputTextField] resignFirstResponder];
}

- (void)loadDoneItData {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[DoneIt entityName]];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObjects:@"end", nil]];
    [fetchRequest setFetchBatchSize:1];
    NSSortDescriptor *sortByEndTime = [NSSortDescriptor sortDescriptorWithKey:@"end" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByEndTime]];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                    managedObjectContext:[[DoneItsDataModel sharedDataModel] mainContext]
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    [_fetchedResultsController performFetch:nil];
}

#pragma btn

- (IBAction)revealRightMenu:(id)sender {
    [self.view endEditing:YES];
    [self.slidingViewController anchorTopViewTo:ECLeft];

}

- (IBAction)revealMenu:(id)sender {
    [self.view endEditing:YES];
    [self.slidingViewController anchorTopViewTo:ECRight];

}
//text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
- (IBAction)doneItBtn:(id)sender {
    if (![[self.inputTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] ) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:[DoneIt entityName] inManagedObjectContext:context];
        NSSortDescriptor *sortByTime = [NSSortDescriptor sortDescriptorWithKey:@"start" ascending:NO];
        [request setEntity:entity];
        [request setReturnsDistinctResults:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sortByTime]];
        
        NSDate *_rightNow = [NSDate date];
        DoneIt *doneit = [[context executeFetchRequest:request error:nil]objectAtIndex:0];
        doneit.end = _rightNow;
        doneit.content = self.inputTextField.text;
//set day month and year of data recoreded time
//I didn't use calendar for easy search...]
        //testing date
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        //set day month year from end date
        components = [calendar components:(NSDayCalendarUnit | NSMonthCalendarUnit |NSYearCalendarUnit) fromDate:_rightNow];
        doneit.day = [NSNumber numberWithInt:[components day]];
        doneit.month = [NSNumber numberWithInt:[components month]];
        doneit.year = [NSNumber numberWithInt:[components year]];
        
        
// doneit for new contents
        DoneIt *nextDoneit = [DoneIt insertInManagedObjectContext:context];
        nextDoneit.start = [NSDate date];
        
        
        
        
        [context save:nil];
        [self.view endEditing:YES];

    }
    else{
        NSLog(@"display a hud");
    }

}

- (IBAction)startBtnTouched:(id)sender {
    
    NSLog(@"Context is ready!");
    
    DoneIt *doneit = [DoneIt insertInManagedObjectContext:context];
    doneit.start = [NSDate date];
    [context save:nil];
    
    self.startBtn.enabled = NO;
    self.startBtn.hidden = YES;
    self.doneitBtn.enabled = YES;
    self.doneitBtn.hidden = NO;
    self.inputTextField.hidden = NO;
}

//after push and came back remove keyboard and the text inside of inputextfield
- (void)viewWillDisappear:(BOOL)animated {
    self.inputTextField.text =@"";
    [self resignFirstResponder];
}
@end
