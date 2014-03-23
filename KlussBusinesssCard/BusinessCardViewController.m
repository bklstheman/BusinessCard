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

@interface BusinessCardViewController ()<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UILabel *bussinessCardName;
@property (weak, nonatomic) IBOutlet UILabel *buisnessCardRole;
@property BOOL isFranklinFace;
@end

@implementation BusinessCardViewController

- (IBAction)emailLabelTapped:(UITapGestureRecognizer *)sender {
    BusinessCardMailViewController *bcMailVC = [BusinessCardMailViewController createBusinessCardMail:self];
    [self presentViewController:bcMailVC animated:YES completion:nil];
}
- (IBAction)phoneLabelTApped:(id)sender {
    [ContactHelper dialBusinessPhone];
}

- (IBAction)faceImageTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"Face image tapped");

    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.faceImageView cache:YES];
        if (self.isFranklinFace) {
            self.faceImageView.image = [UIImage imageNamed:@"facephotocard"];
            self.isFranklinFace = NO;
            self.bussinessCardName.text = @"William Kluss";
            self.buisnessCardRole.text = @"Software Developer";
        } else {
            self.faceImageView.image = [UIImage imageNamed:@"franklinface"];
            self.isFranklinFace = YES;
            self.buisnessCardRole.text = @"Professional Puppy";
            self.bussinessCardName.text = @"Franklin Kluss";
            [self.bussinessCardName updateConstraints];
            
        }

    } completion:^(BOOL finished) {
    }];
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

#pragma Mail Delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
