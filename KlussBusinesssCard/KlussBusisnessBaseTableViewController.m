//
//  KlussBusisnessBaseTableViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 5/7/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "KlussBusisnessBaseTableViewController.h"

@interface KlussBusisnessBaseTableViewController ()

@end

@implementation KlussBusisnessBaseTableViewController

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"businessCardLandscape"] animated:YES];
    }
}

@end
