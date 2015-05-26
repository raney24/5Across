//
//  RootViewController.h
//  5 Across Beta
//
//  Created by Kyle Raney on 4/17/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "SDFeedParser.h"
#import "NSString+HTML.h"

@interface RootViewController : UITableViewController <MWFeedParserDelegate> {
    
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
    
    NSArray *itemsToDisplay;
    NSDateFormatter *formatter;
}

@property(strong, nonatomic) NSArray *itemsToDisplay;


@end
