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
#import "BusinessCardMailViewController.m"

@import MessageUI;

@interface ContactsViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)emailButtonPressed:(UIButton *)sender {
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController createBusinessCardMail:self];
    [self presentViewController:bcMailVC animated:YES completion:nil];
    }
- (IBAction)phoneButtonPressed:(UIButton *)sender {
    
    if ([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:832-217-8539"]]];
    } else {
        UIAlertView *showAlert = [[UIAlertView alloc]initWithTitle:@"Not an iPhone" message:@"Sorry but this feature only works on an iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [showAlert show];
    }
}
- (IBAction)linkedinButtonPressed:(UIButton *)sender {
    //Need to open linked in
    LIALinkedInHttpClient *linkedHTTPClient = [LIALinkedInHttpClient new];
    [linkedHTTPClient getAuthorizationCode:^(NSString *code) {
        [linkedHTTPClient getAccessToken:code success:^(NSDictionary *accessTokenData) {
            NSString *accessToken = [accessTokenData objectForKey:@"access_token"];
           // [self requestMeWithToken:accessToken];
        }                   failure:^(NSError *error) {
            NSLog(@"Quering accessToken failed %@", error);
        }];
    }                      cancel:^{
        NSLog(@"Authorization was cancelled by user");
    }                     failure:^(NSError *error) {
        NSLog(@"Authorization failed %@", error);
    }];
}


/*
 - (LIALinkedInHttpClient *)client {
 LIALinkedInApplication *application = [LIALinkedInApplication applicationWithRedirectURL:@"http://www.ancientprogramming.com/liaexample"
 clientId:LINKEDIN_CLIENT_ID
 clientSecret:LINKEDIN_CLIENT_SECRET
 state:@"DCEEFWF45453sdffef424"
 grantedAccess:@[@"r_fullprofile", @"r_network"]];
 return [LIALinkedInHttpClient clientForApplication:application presentingViewController:nil];
 }
 */

#pragma Mail Delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
