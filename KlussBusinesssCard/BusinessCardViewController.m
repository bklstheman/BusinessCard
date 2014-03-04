//
//  BusinessCardViewController.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/3/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "BusinessCardViewController.h"

@interface BusinessCardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@end

@implementation BusinessCardViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
