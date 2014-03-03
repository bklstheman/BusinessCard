//
//  WorkProfileDetailViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/2/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "WorkProfileDetailViewController.h"

@interface WorkProfileDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *profileDetailsTextView;

@end

@implementation WorkProfileDetailViewController

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
	// Do any additional setup after loading the view.
    NSMutableString *workProfileText = [NSMutableString new];
    for (NSString *profileDetails in self.accomplishments) {
        [workProfileText appendString:[NSString stringWithUTF8String:"\u2022 "]];
        [workProfileText appendString:profileDetails];
        [workProfileText appendString:@"\n"];
        [workProfileText appendString:@"\n"];
    }
    
    self.profileDetailsTextView.text = workProfileText;
}

@end
