//
//  IFixItBadges.m
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import "IFixItBadges.h"
#import "IFixitBadge.h"

@implementation IFixItBadges

- (id)initWithData:(NSData*)data;
{
    if ((self = [super init]))
    {
        badges = [[NSMutableArray alloc] init];
        
        NSError*    error       = nil;
        NSArray*    resultData  = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:kNilOptions
                                                                    error:&error];
        if (resultData && nil == error && badges)
        {
            NSDictionary* badgesData    = nil;
            NSEnumerator* resultsEnum   = [resultData objectEnumerator];
            while (badgesData = [resultsEnum nextObject])
            {
                IFixitBadge* badge = [[IFixitBadge alloc] initWithDictionary:badgesData];
                [badges addObject:badge];
            }
        }
    }
    
    return self;
}

- (NSUInteger)count;
{
    return ((nil == badges) ? 0 : [badges count]);
}

- (NSEnumerator*)objectEnumerator;
{
    return [badges objectEnumerator];
}

- (IFixitBadge*)badgeAtIndex:(NSUInteger)idx;
{
    IFixitBadge* badge = nil;
    if (badges && 
        ([badges count]-1) >= idx)
    {
        badge = [badges objectAtIndex:idx];
    }
    
    return badge;
}

@end
