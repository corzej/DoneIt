//
//  AllViewController.m
//  DoneIt
//
//  Created by eungJin on 6/3/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "AllViewController.h"

@interface AllViewController () <UISearchDisplayDelegate> {
    NSFetchedResultsController *_fetchedResultsController;
    int _numOfRow;
}

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;
//slider view
@property (nonatomic, assign) CGFloat peekLeftAmount;


@end

@implementation AllViewController
//slider view
@synthesize peekLeftAmount;

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDoneItData];
    [self setupSearchBar];
    self.searchResults = [NSMutableArray array];
    
//ECSlider View
    self.peekLeftAmount = 40.0f;
    [self.slidingViewController setAnchorLeftPeekAmount:self.peekLeftAmount];
    self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
}

#pragma mark - SearchBar

- (void) setupSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.tableView.tableHeaderView = self.searchBar;
    
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar
                                                              contentsController:self];
    self.searchController.searchResultsDataSource = self;
    self.searchController.searchResultsDelegate = self;
    self.searchController.delegate = self;
    
    CGPoint offset = CGPointMake(0, self.searchBar.frame.size.height);
    self.tableView.contentOffset = offset;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self fileterForTerm:searchString];
    return YES;
}

#pragma mark - Load Data
- (void)loadDoneItData {
    //if today table and if allday table
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[DoneIt entityName]];
    //testing date
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components = [calendar components:(NSDayCalendarUnit | NSMonthCalendarUnit |NSYearCalendarUnit) fromDate:[NSDate date]];
    
    
  //  NSLog(@"Awesome time: %@", [calendar dateFromComponents:components]);
   // NSLog(@"not Awesome : %@", [NSDate date]);
    
    //////set predicate
 //   NSPredicate *predicate = [NSPredicate predicateWithFormat:@"end >= %@",[calendar dateFromComponents:components]];
 //   [fetchRequest setPredicate:predicate];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObjects:@"content", @"end", @"start", @"timeout", nil]];
    [fetchRequest setFetchBatchSize:40];
    NSSortDescriptor *sortByEndTime = [NSSortDescriptor sortDescriptorWithKey:@"start" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByEndTime]];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                    managedObjectContext:[[DoneItsDataModel sharedDataModel] mainContext]
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    [_fetchedResultsController performFetch:nil];
}

- (void) fileterForTerm:(NSString *)term {
    [self.searchResults removeAllObjects];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    fetchRequest.entity = [DoneIt entityInManagedObjectContext:[[DoneItsDataModel sharedDataModel] mainContext]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"content CONTAINS[cd] %@ OR day CONTAINS[cd] %@ OR month CONTAINS[cd] %@ OR year CONTAINS[cd] %@",term, term, term, term];
    fetchRequest.predicate = predicate;
    
    NSError *error = nil;
    NSArray *results = [[[DoneItsDataModel sharedDataModel]mainContext] executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error it ne");
    }
    NSLog(@"results: %@",[results.lastObject valueForKey:@"content"]);
    NSLog(@"results: %d",[results count]);
    
    [self.searchResults addObjectsFromArray:results];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    _numOfRow = [sectionInfo numberOfObjects];
    if (tableView == self.tableView) {
        return _numOfRow;
    } else {
        return self.searchResults.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier;
    if (indexPath.row == _numOfRow  ) {
        CellIdentifier =@"workingCell";
    } else {
        CellIdentifier = @"Cell";
    }
    Custom1Cell *cell = (Custom1Cell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[Custom1Cell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    DoneIt *doneit = nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    if (tableView == self.tableView) {
        doneit = [_fetchedResultsController objectAtIndexPath:indexPath];
        if ([CellIdentifier isEqualToString: @"Cell"]) {
            cell.contentText.text = doneit.content;
            NSString *dateString = [dateFormatter stringFromDate:doneit.end];
            cell.timeText.text = dateString;
            NSTimeInterval startDiff = [doneit.start timeIntervalSinceNow];
            NSTimeInterval endDiff = [doneit.end timeIntervalSinceNow];
            double diff = endDiff - startDiff;
            int sec;
            int min=0;
            int hour=0;
            sec = (int)diff%60;
            min = (int)diff/60;
            if (min >=60) {
                hour = min/60;
                min = min%60;
            }
            
            NSString *diffText = [NSString stringWithFormat:@"%i:%i:%i", hour, min, sec];
            cell.timeInterval.text = diffText;
        } else {
            NSString *dateString = [dateFormatter stringFromDate:doneit.start];
            cell.timeText.text = dateString;
        }
    } else {
        doneit = [self.searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = doneit.content;
    }
    
    
    
    return cell;
}

#pragma mark - Table view delegate

- (UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[LARSAdController sharedManager] containerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [[LARSAdController sharedManager] containerView].frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
