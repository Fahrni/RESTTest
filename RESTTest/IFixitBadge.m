//
//  IFixitBadge.m
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import "IFixitBadge.h"

@implementation IFixitBadge

@synthesize badgeId;
@synthesize name;
@synthesize type;
@synthesize category;
@synthesize description;
@synthesize numUsers;

- (id)initWithDictionary:(NSDictionary*)dictionary;
{
    if ((self = [super init]))
    {
        badgeId     = [[dictionary objectForKey:@"badgeid"] integerValue];
        name        = [dictionary objectForKey:@"name"];
        type        = [dictionary objectForKey:@"type"];
        category    = [dictionary objectForKey:@"category"];
        description = [dictionary objectForKey:@"description"];
        numUsers    = [[dictionary objectForKey:@"num_users"] integerValue];
    }
    
    return self;
}

@end
