//
//  ParseBlog.h
//  5 Across Beta
//
//  Created by Kyle Raney on 6/4/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "MWFeedParser.h"

@interface ParseBlog : MWFeedParser <MWFeedParserDelegate> {
    
    MWFeedParser *blogParser;
    NSMutableArray *parsedItems;
    
    NSArray *itemsToDisplay;
    NSDateFormatter *formatter;
}

@property(strong, nonatomic) NSArray *itemsToDisplay;

-(void)loadBlogInfo;

@end
