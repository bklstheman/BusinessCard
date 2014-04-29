//
//  LinkedInMessageViewController.h
//  KlussBusinesssCard
//
//  Created by William Kluss on 4/23/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LIALinkedInHttpClient.h>

@interface LinkedInMessageViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) NSString *linkedInAccessCode;
@property (strong, nonatomic) LIALinkedInHttpClient *client;

@end
