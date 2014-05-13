//
//  BusinessCardViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/3/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "BusinessCardViewController.h"
#import "BusinessCardMailViewController.h"
#import "ContactHelper.h"
#import "GAITracker.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

@interface BusinessCardViewController ()<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UILabel *bussinessCardName;
@property (weak, nonatomic) IBOutlet UILabel *buisnessCardRole;
@property BOOL isFranklinFace;
@property (strong, nonatomic) id<GAITracker> tracker;

@end

@implementation BusinessCardViewController

-(void)viewDidLoad {
    self.tracker = [[GAI sharedInstance] defaultTracker];
   
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (IBAction)emailLabelTapped:(UITapGestureRecognizer *)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"card_mail" action:@"mailButtonPress" label:@"Mail" value:nil] build]];
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController createBusinessCardMail:self];
    [self presentViewController:bcMailVC animated:YES completion:nil];
}
- (IBAction)phoneLabelTApped:(id)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"card_phone" action:@"phoneButtonPress" label:@"Phone" value:nil] build]];
    [ContactHelper dialBusinessPhone];
}

- (IBAction)faceImageTapped:(UITapGestureRecognizer *)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"face_image" action:@"faceImagePressed" label:@"Face" value:nil] build]];

    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.faceImageView cache:YES];
        if (self.isFranklinFace) {
            self.faceImageView.image = [UIImage imageNamed:@"facephotocard"];
            self.isFranklinFace = NO;
            self.bussinessCardName.text = @"William KLUSS";
            self.buisnessCardRole.text = @"Software Developer";
        } else {
            self.faceImageView.image = [UIImage imageNamed:@"franklinface"];
            self.isFranklinFace = YES;
            self.buisnessCardRole.text = @"Professional Puppy";
            self.bussinessCardName.text = @"Franklin KLUSS";
            [self.bussinessCardName updateConstraints];
            
        }

    } completion:^(BOOL finished) {
    }];
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown);
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        [self.navigationController popViewControllerAnimated:NO];
    }
}

#pragma Mail Delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
