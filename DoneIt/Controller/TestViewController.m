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

}

@end

@implementation TestViewController
@synthesize startBtn=_startBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //search if we need a starBtn or not
    NSManagedObjectContext *context = [[DoneItsDataModel sharedDataModel] mainContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[DoneIt entityName] inManagedObjectContext:context];
    [request setEntity:entity];
    NSPredicate *searchFilter = [NSPredicate predicateWithFormat:@"end = nil"];
    [request setPredicate:searchFilter];
    NSArray *results = [context executeFetchRequest:request error:nil];
   // [self loadDoneItData];
    
    if (results.lastObject == nil) {
        self.startBtn.enabled = YES;
    }
    else {
        self.startBtn.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma methods

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

- (IBAction)doneItBtn:(id)sender {
    NSManagedObjectContext *context = [[DoneItsDataModel sharedDataModel] mainContext];
    if (context) {
        NSLog(@"Context is ready!");
        
        DoneIt *doneit = [DoneIt insertInManagedObjectContext:context];
        NSDate *localDate = [NSDate date];
        doneit.content = self.inputTextField.text;
        doneit.end = localDate;
        
        [context save:nil];
    } else {
        NSLog(@"Context was nil :(");
    }
}

- (IBAction)startBtnTouched:(id)sender {
    NSManagedObjectContext *context = [[DoneItsDataModel sharedDataModel] mainContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[DoneIt entityName] inManagedObjectContext:context];
   NSSortDescriptor *sortByTime = [NSSortDescriptor sortDescriptorWithKey:@"end" ascending:YES];
    [request setEntity:entity];
    [request setResultType:NSDictionaryResultType];
    [request setReturnsDistinctResults:YES];
    //[request setPropertiesToFetch:@[@"end"]];
    [request setSortDescriptors:[NSArray arrayWithObject:sortByTime]];
    
   // NSArray *results = [context executeFetchRequest:request error:nil];
  //  NSLog(@"button touched: %@", [results.lastObject valueForKey:@"content"]);
    DoneIt *doneit = [[context executeFetchRequest:request error:nil]objectAtIndex:0];
    NSLog(@"button touched: %@", [doneit valueForKey:@"start"]);

    [doneit setValue:@"eungjin" forKey:@"content"];
    //[[results lastObject] start] = [NSDate date];
    [context save:nil];
}

@end
