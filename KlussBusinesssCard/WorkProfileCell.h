//
//  WorkProfileCell.h
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/18/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *companyLogoImage;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTimelineLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@end
