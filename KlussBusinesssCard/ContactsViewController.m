//
//  ContactsViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/1/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "ContactsViewController.h"
#import <LIALinkedInApplication.h>
#import <LIALinkedInAuthorizationViewController.h>
#import <LIALinkedInHttpClient.h>
#import "BusinessCardMailViewController.h"
#import "LinkedInMessageViewController.h"

@import MessageUI;

@interface ContactsViewController ()<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) LIALinkedInHttpClient *client;
@property (weak, nonatomic) NSDictionary *linkedUser;

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LIALinkedInApplication *application = [LIALinkedInApplication applicationWithRedirectURL:@"https://github.com/bklstheman" clientId:@"757zenj5pyzej5" clientSecret:@"26m1bADZD4JmxXIQ" state:@"DCEEFWF45453sdffef424" grantedAccess:@[@"r_emailaddress", @"r_contactinfo", @"r_network", @"w_messages"]];
    
    self.client = [LIALinkedInHttpClient clientForApplication:application presentingViewController:nil];
}

- (IBAction)emailButtonPressed:(UIButton *)sender {
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController createBusinessCardMail:self];
    [self presentViewController:bcMailVC animated:YES completion:nil];
}

- (IBAction)phoneButtonPressed:(UIButton *)sender {
    
    if ([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:210-446-9440"]]];
    } else {
        UIAlertView *showAlert = [[UIAlertView alloc]initWithTitle:@"Not an iPhone" message:@"Sorry but this feature only works on an iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [showAlert show];
    }
}
- (IBAction)linkedinButtonPressed:(UIButton *)sender {
        [self.client getAuthorizationCode:^(NSString *code) {
            [self.client getAccessToken:code success:^(NSDictionary *accessTokenData) {
                NSString *accessToken = accessTokenData[@"access_token"];
                //[self requestMeWithToken:accessToken];
                //Get the users info and send that to the linkedin messager
                LinkedInMessageViewController *linkedInMessageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"linkedInMessageView"];
                linkedInMessageVC.client = self.client;
                linkedInMessageVC.linkedInAccessCode = accessToken;
                [self.navigationController pushViewController:linkedInMessageVC animated:YES];
            } failure:^(NSError *error) {
                NSLog(@"Quering accessToken failed %@", error);
            }];
        } cancel:^{
            NSLog(@"Authorization was cancelled by user");
        } failure:^(NSError *error) {
            NSLog(@"Authorization failed %@", error);
        }];
}

- (void)requestMeWithToken:(NSString *)accessToken {

    [self.client GET:[NSString stringWithFormat:@"https://api.linkedin.com/v1/people/~?oauth2_access_token=%@&format=json", accessToken] parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *result) {
        self.linkedUser = result;
        NSLog(@"current user %@", result);
    }        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed to fetch current user %@", error);
    }];
}

#pragma Mail Delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
