//
//  ParseBlog.m
//  5 Across Beta
//
//  Created by Kyle Raney on 6/4/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "ParseBlog.h"

@implementation ParseBlog

-(void)loadBlogInfo {
    // Set Up
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    parsedItems = [[NSMutableArray alloc] init];
    _itemsToDisplay = [NSArray array];
    
    NSURL *feedURL = [NSURL URLWithString:@"http://5across.org/feed/"];
    blogParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    blogParser.delegate = self;
    blogParser.feedParseType = ParseTypeFull; // Parse feed info and all items
    blogParser.connectionType = ConnectionTypeAsynchronously;
    [blogParser parse];
    
    int postCount = itemsToDisplay.count;
    
    NSLog(@"count: %d", postCount);
    
}


@end
