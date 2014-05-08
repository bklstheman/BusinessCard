//
//  WorkProfileDetailViewController.h
//  KlussBusinesssCard
//
//  Created by William Kluss on 3/2/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KlussBusinessBaseViewController.h"

@interface WorkProfileDetailViewController : KlussBusinessBaseViewController

@property (strong, nonatomic) NSMutableArray *accomplishments;
@property (strong, nonatomic) NSString *jobDescription;

@end
