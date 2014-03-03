//
//  WorkProfile.h
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/17/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkProfile : NSObject

@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *startDate;
@property (strong, nonatomic) NSString *endDate;
@property (strong, nonatomic) NSString *jobTitle;
@property (strong, nonatomic) NSString *companyLogo;

@property (strong, nonatomic) NSString *jobDescription;
@property (strong, nonatomic) NSArray *accomplishments;

-(WorkProfile *)initFromDictonary:(NSDictionary *)dictionary;

@end
