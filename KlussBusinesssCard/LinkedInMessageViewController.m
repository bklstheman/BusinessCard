//
//  LinkedInMessageViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 4/23/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "LinkedInMessageViewController.h"
#import "AFHTTPRequestOperation.h"

@interface LinkedInMessageViewController ()
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@end

@implementation LinkedInMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.messageTextView becomeFirstResponder];
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sendButtonPressed:(UIBarButtonItem *)sender {
    NSMutableDictionary *arguments = [NSMutableDictionary new];
    
    NSDictionary *person = @{@"person" : @{@"_path": @"/people/email=bklstheman2@gmail.com",
                                           @"firstName": @"William",
                                           @"lastName": @"Kluss"}};
    
    NSArray *myAccountPath = @[person];
    NSDictionary *values = @{@"values": myAccountPath};
    arguments[@"recipients"] = values;
    arguments[@"subject"] = @"Invitation to connect";
    arguments[@"body"] = self.messageTextView.text;
    arguments[@"itemContent"] = @{@"invitationRequest": @{@"connectType": @"friend"}};
    
    [self.client.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *dataArgs = [NSJSONSerialization dataWithJSONObject:arguments options:NSJSONWritingPrettyPrinted error:nil];

    NSString *urlString = [NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~/mailbox?oauth2_access_token=%@", self.linkedInAccessCode];
    [self.client POST:urlString parameters:dataArgs success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.navigationController popViewControllerAnimated:YES];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.navigationController popViewControllerAnimated:YES];

    }];
}

@end
