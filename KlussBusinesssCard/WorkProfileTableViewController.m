//
//  WorkProfileTableViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/18/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "WorkProfileTableViewController.h"
#import "WorkProfile.h"
#import "WorkProfileCell.h"
#import "WorkProfileDetailViewController.h"

@interface WorkProfileTableViewController ()

@property NSMutableArray *workProfiles;

@end

@implementation WorkProfileTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JobDetails-Info" ofType:@"plist"];
    NSDictionary *firstPass = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSArray *experiences = firstPass[@"experiences"];
    self.workProfiles = [[NSMutableArray alloc]initWithCapacity:experiences.count];

    
    for (NSDictionary *workProfileInfo in experiences) {
        WorkProfile *workProfile = [[WorkProfile alloc]initFromDictonary:workProfileInfo];
        [self.workProfiles addObject:workProfile];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.workProfiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkProfile *workProfile = self.workProfiles[indexPath.row];
    static NSString *CellIdentifier = @"workCell";
    WorkProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    cell.companyNameLabel.text = workProfile.companyName;
    cell.companyLogoImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", workProfile.companyLogo]];
    cell.jobTitleLabel.text = workProfile.jobTitle;
    cell.jobTimelineLabel.text = [NSString stringWithFormat:@"%@-%@", workProfile.startDate, workProfile.endDate];
    
    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"workDetailSegue"]){
        WorkProfileDetailViewController *workProfileDetailsVC = (WorkProfileDetailViewController *)segue.destinationViewController;
        
        NSInteger currentSelectedRow = [self.tableView indexPathForSelectedRow].row;
        WorkProfile *workProfile = self.workProfiles[currentSelectedRow];
        workProfileDetailsVC.accomplishments = [NSMutableArray arrayWithArray:workProfile.accomplishments];
        workProfileDetailsVC.jobDescription = workProfile.jobDescription;
    }
}

@end
