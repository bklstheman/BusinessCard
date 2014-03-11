//
//  ContactHelper.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/10/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "ContactHelper.h"

@implementation ContactHelper

+(void)dialBusinessPhone {
    
    NSURL *phoneURL = [NSURL URLWithString:@"telprompt:%@2104469440"];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneURL]) {
        [[UIApplication sharedApplication]openURL:phoneURL];
    }
}
@end
