//
//  BusinessCardMailViewController.h
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/10/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import <MessageUI/MessageUI.h>

@interface BusinessCardMailViewController : MFMailComposeViewController

+(BusinessCardMailViewController *)createBusinessCardMail:(id)delegate;

@end
