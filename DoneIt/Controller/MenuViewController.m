//
//  MenuViewController.m
//  DoneIt
//
//  Created by eungJin on 5/24/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;       //this will be the key
@property (nonatomic, strong) NSDictionary *menuItemsNames;
@property (nonatomic, assign) CGFloat rightRevealAmout;

@end

@implementation MenuViewController
@synthesize menuItems;


#pragma mark - View Life Cycle

- (void)awakeFromNib
{
    self.menuItems = [NSArray arrayWithObjects:@"Done It", @"Today", @"All", nil];
    self.menuItemsNames =[NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:@"First", @"Today",@"All",nil] forKeys:menuItems];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;

}

#pragma TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"%@Top",[self.menuItemsNames objectForKey:[self.menuItems objectAtIndex:indexPath.row]]];
    
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}

@end

