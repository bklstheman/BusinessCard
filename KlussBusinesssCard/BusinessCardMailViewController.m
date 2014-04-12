//
//  BusinessCardMailViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/10/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "BusinessCardMailViewController.h"

@implementation BusinessCardMailViewController

+(BusinessCardMailViewController *)createBusinessCardMail:(id)delegate {
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController new];
    
    bcMailVC.mailComposeDelegate = delegate;
    [bcMailVC setSubject:@"I would like to contact you!"];
    [bcMailVC setToRecipients:@[@"klussdevelopment@gmail.com"]];
    return bcMailVC;
}

@end
