//
//  SideProjectViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/5/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "SideProjectViewController.h"

@interface SideProjectViewController ()

@end

@implementation SideProjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//TODO:Need to test this on a device.
- (IBAction)tableTopicImageTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"Table Topics image tapped");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/table-topics-free/id648137044?ls=1&mt=8"]];
}

@end
