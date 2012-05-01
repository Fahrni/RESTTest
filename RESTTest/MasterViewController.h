//
//  MasterViewController.h
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "IFixitBadges.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    // 
    NSURLConnection*    connection;
    NSMutableData*      receivedData;
    
    // iFixIt data
    IFixItBadges*       badges;
}

@end
