//
//  MasterViewController.m
//  RESTTest
//
//  Created by Rob Fahrni on 4/30/12.
//  Copyright (c) 2012 Robert R. Fahrni. All rights reserved.
//
#import "MasterViewController.h"

@interface MasterViewController (Private)
- (void)getBadges;
- (void)performReloadData;
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title = @"iFixIt Badges";
    }
    return self;
}
							
- (void)didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad;
{
    [super viewDidLoad];
}

- (void)viewDidUnload;
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
    
    // Badges? We don't need no stinking badges!
    [self getBadges];
}

- (void)viewWillDisappear:(BOOL)animated;
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated;
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView;
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView 
 numberOfRowsInSection:(NSInteger)section;
{
    return (nil == badges) ? 0 : [badges count];
}

// Customize the appearance of table view cells.
- (UITableViewCell*)tableView:(UITableView*)tableView 
        cellForRowAtIndexPath:(NSIndexPath*)indexPath;
{
    static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Get the badge information.
    IFixitBadge* badge = [badges badgeAtIndex:indexPath.row];
    
    // Configure the cell.
    cell.textLabel.text = (nil == badges) ? @"[Unknown]" : badge.name;
    return cell;
}


- (void)getBadges;
{
	NSURL*					url			= [NSURL URLWithString:@"http://www.ifixit.com/api/0.1/badges"];
	NSMutableURLRequest*	request		= [NSMutableURLRequest requestWithURL:url 
                                                            cachePolicy:NSURLRequestReloadIgnoringCacheData 
                                                        timeoutInterval:10];
	if (request)
	{
		[request setURL:url];
		connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	}
}

- (void)performReloadData;
{
    // reload data will force the table to be reconstructed.
    [self.tableView reloadData];
}


////////////////////////////////////////////////////////////////////////
//
// NSURLRequest delegate
//
- (void)connection:(NSURLConnection*)connection 
didReceiveResponse:(NSURLResponse*)response;
{
    receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection*)connection 
    didReceiveData:(NSData*)data;
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection*)connection
  didFailWithError:(NSError*)error;
{
    NSLog(@"WHOOPS! Something went wrong");
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                    message:error.description 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Close" 
                                          otherButtonTitles:nil];
	[alert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	NSString* s = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
	NSLog(@"Received data %@", s);
	
    badges = [[IFixItBadges alloc] initWithData:receivedData];
    
    [self.tableView reloadData];
}


@end
