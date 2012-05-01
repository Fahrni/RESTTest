//
//  IFixItBadges.h
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "IFixitBadge.h"

@interface IFixItBadges : NSObject
{
    NSMutableArray* badges;
}

- (id)initWithData:(NSData*)data;

- (NSUInteger)count;
- (NSEnumerator*)objectEnumerator;
- (IFixitBadge*)badgeAtIndex:(NSUInteger)idx;

@end
