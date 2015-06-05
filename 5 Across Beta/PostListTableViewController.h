//
//  PostListTableViewController.h
//  
//
//  Created by Kyle Raney on 5/26/15.
//
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "SDFeedParser.h"
#import "NSString+HTML.h"

@interface PostListTableViewController : UITableViewController <MWFeedParserDelegate> {
    
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
    
    NSArray *itemsToDisplay;
    NSDateFormatter *formatter;
}

@property(strong, nonatomic) NSArray *itemsToDisplay;

@end
