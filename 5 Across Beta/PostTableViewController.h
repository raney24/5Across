//
//  PostTableViewController.h
//  5 Across Beta
//
//  Created by Kyle Raney on 4/17/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "SDFeedParser.h"
#import "NSString+HTML.h"

@interface PostTableViewController : UITableViewController {
//    MWFeedItem *item;
//    NSString *dateString, *summaryString;
}

@property (strong, nonatomic) MWFeedItem *item;
@property (strong, nonatomic) NSString *dateString, *summaryString;

@end
