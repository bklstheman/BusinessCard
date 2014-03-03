//
//  WorkProfile.m
//  KlussBusinesssCard
//
//  Created by William Kluss on 2/17/14.
//  Copyright (c) 2014 William Kluss. All rights reserved.
//

#import "WorkProfile.h"

@implementation WorkProfile

-(WorkProfile *)initFromDictonary:(NSDictionary *)dictionary {
    WorkProfile *workProfile = WorkProfile.new;
    
    workProfile.companyName = dictionary[@"companyName"];
    workProfile.startDate = dictionary[@"startDate"];
    workProfile.endDate = dictionary[@"endDate"];
    workProfile.jobTitle = dictionary[@"jobTitle"];
    workProfile.companyLogo = dictionary[@"companyLogo"];
    workProfile.jobDescription = dictionary[@"jobDescription"];
    workProfile.accomplishments = dictionary[@"accomplishments"];
    
    return workProfile;
}
@end
