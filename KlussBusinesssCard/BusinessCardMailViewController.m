//
//  BusinessCardMailViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/10/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "BusinessCardMailViewController.h"

@interface BusinessCardMailViewController ()

@end

@implementation BusinessCardMailViewController

+(BusinessCardMailViewController *)createBusinessCardMail:(id)delegate {
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController new];
    
    bcMailVC.mailComposeDelegate = delegate;
    [bcMailVC setSubject:@"I would like to contact you!"];
    [bcMailVC setToRecipients:@[@"bklstheman2@gmail.com"]];
    return bcMailVC;
}

@end
