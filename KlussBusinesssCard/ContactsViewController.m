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
#import "GAITracker.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

@import MessageUI;
@import AddressBookUI;
@import AddressBook;

@interface ContactsViewController ()<MFMailComposeViewControllerDelegate, ABUnknownPersonViewControllerDelegate>

@property (strong, nonatomic) LIALinkedInHttpClient *client;
@property (weak, nonatomic) NSDictionary *linkedUser;
@property (strong, nonatomic) id<GAITracker> tracker;

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LIALinkedInApplication *application = [LIALinkedInApplication applicationWithRedirectURL:@"https://github.com/bklstheman" clientId:@"757zenj5pyzej5" clientSecret:@"26m1bADZD4JmxXIQ" state:@"DCEEFWF45453sdffef424" grantedAccess:@[@"r_emailaddress", @"r_contactinfo", @"r_network", @"w_messages"]];
    
    self.client = [LIALinkedInHttpClient clientForApplication:application presentingViewController:nil];
    
    self.tracker = [[GAI sharedInstance] defaultTracker];
}

- (IBAction)emailButtonPressed:(UIButton *)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"contact_mail" action:@"mailButtonPress" label:@"Mail" value:nil] build]];
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController createBusinessCardMail:self];
    [self presentViewController:bcMailVC animated:YES completion:nil];
}

- (IBAction)phoneButtonPressed:(UIButton *)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"contact_phone" action:@"phoneButtonPress" label:@"Phone" value:nil] build]];
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

- (IBAction)addWorkContactToPhone:(UIButton *)sender {
    ABRecordRef klussContact = ABPersonCreate();
    
    //Set first name
    ABRecordSetValue(klussContact, kABPersonFirstNameProperty, CFSTR("William"), nil);
    //Set last name
    ABRecordSetValue(klussContact, kABPersonLastNameProperty, CFSTR("Kluss"), nil);
    //Set email
    ABRecordSetValue(klussContact, kABPersonEmailProperty, CFSTR("klussdevelopment@gmail.com"), nil);
    //Set phone number
    ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(phoneNumberMultiValue, @"(210) 446-9440", kABPersonPhoneMainLabel, NULL);
    ABRecordSetValue(klussContact, kABPersonPhoneProperty, phoneNumberMultiValue, nil);
    CFRelease(phoneNumberMultiValue);
    
    //Set itunes URL for my work
    ABMutableMultiValueRef urlMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(urlMultiValue, @"https://itunes.apple.com/us/artist/william-kluss/id648137047",
                                 kABPersonHomePageLabel, NULL);
    ABRecordSetValue(klussContact, kABPersonURLProperty, urlMultiValue, nil);
    CFRelease(urlMultiValue);
    
    ABUnknownPersonViewController *unknownPersonVC = [[ABUnknownPersonViewController alloc] init];
    
    unknownPersonVC.displayedPerson = klussContact;
    unknownPersonVC.allowsAddingToAddressBook = YES;
    unknownPersonVC.unknownPersonViewDelegate = self;
    
    [self.navigationController pushViewController:unknownPersonVC animated:YES];
    
    CFRelease(klussContact);
}

-(void)unknownPersonViewController:(ABUnknownPersonViewController *)unknownCardViewController didResolveToPerson:(ABRecordRef)person {
    
}

/*
 // create person record
 
 ABRecordRef person = ABPersonCreate();
 
 // set name and other string values
 
 ABRecordSetValue(person, kABPersonOrganizationProperty, (__bridge CFStringRef) venueName, NULL);
 
 
 // let's show view controller
 
 ABUnknownPersonViewController *controller = [[ABUnknownPersonViewController alloc] init];
 
 controller.displayedPerson = person;
 controller.allowsAddingToAddressBook = YES;
 
 // current view must have a navigation controller
 
 [self.navigationController pushViewController:controller animated:YES];
 
 CFRelease(person);
 */

#pragma Mail Delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
