//
//  IFixitBadge.h
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface IFixitBadge : NSObject
{
    NSInteger   badgeId;
    NSString*   name;
    NSString*   type;
    NSString*   category;
    NSString*   description;
    NSInteger   numUsers;
}

@property (assign)  NSInteger   badgeId;
@property (copy)    NSString*   name;
@property (copy)    NSString*   type;
@property (copy)    NSString*   category;
@property (copy)    NSString*   description;
@property (assign)  NSInteger   numUsers;

- (id)initWithDictionary:(NSDictionary*)dictionary;

@end
