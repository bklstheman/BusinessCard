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

- (IBAction)tableTopicImageTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"Table Topics image tapped");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/table-topics-free/id648137044?ls=1&mt=8"]];
}

- (IBAction)drinkXImageTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"Not Another Drink App Tapped");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://bitbucket.org/bklstheman/nada/src"]];
}

@end
