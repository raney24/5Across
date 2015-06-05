//
//  PostListTableViewController.m
//  
//
//  Created by Kyle Raney on 5/26/15.
//
//

#import "PostListTableViewController.h"
#import "NSString+HTML.h"
#import "MWFeedParser.h"
#import "PostTableViewController.h"

@implementation PostListTableViewController 

@synthesize itemsToDisplay;

#pragma - init

-(void) viewDidLoad {
    [super viewDidLoad];
    
    //put below status bar
    //self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    //self.tableView.contentInset = UIEdgeInsetsMake(0, -16, 0, 0);
    
    // Setup
    self.title = @"Loading...";
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    parsedItems = [[NSMutableArray alloc] init];
    self.itemsToDisplay = [NSArray array];
    
    // Refresh button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                           target:self
                                                                                           action:@selector(refresh)];
    
    NSURL *feedURL = [NSURL URLWithString:@"http://5across.org/feed/"];
    feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeFull; // Parse feed info and all items
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];
}

-(void)refresh {
    self.title = @"Refreshing...";
    [parsedItems removeAllObjects];
    [feedParser stopParsing];
    [feedParser parse];
    self.tableView.userInteractionEnabled = NO;
    self.tableView.alpha = 0.3;
}

- (void)updateTableWithParsedItems {
    self.itemsToDisplay = [parsedItems sortedArrayUsingDescriptors:
                           [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"date"
                                                                                ascending:NO]]];
    self.tableView.userInteractionEnabled = YES;
    self.tableView.alpha = 1;
    [self.tableView reloadData];
}

#pragma Feed Parser

- (void)feedParserDidStart:(MWFeedParser *)parser {
//    NSLog(@"Started Parsing: %@", parser.url);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
//    NSLog(@"Parsed Feed Info: “%@”", info.title);
    self.title = info.title;
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
//    NSLog(@"Parsed Feed Item: “%@”", item.title);
    if (item) [parsedItems addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {
//    NSLog(@"Finished Parsing%@", (parser.stopped ? @" (Stopped)" : @""));
    [self updateTableWithParsedItems];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
//    NSLog(@"Finished Parsing With Error: %@", error);
    if (parsedItems.count == 0) {
        self.title = @"Failed"; // Show failed message in title
    } else {
        // Failed but some items parsed, so show and inform of error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Parsing Incomplete"
                                                        message:@"There was an error during the parsing of this feed. Not all of the feed items could parsed."
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
    }
    [self updateTableWithParsedItems];
}

#pragma Table View data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return itemsToDisplay.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"postCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
 
    
    
    // Configure the cell.
    MWFeedItem *item = [itemsToDisplay objectAtIndex:indexPath.row];
    
    if (item) {
        
        NSString *htmlContent = item.content;
        NSString *imgSrc;
        
        NSRange rangeOfString = NSMakeRange(0, [htmlContent length]);
        NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:@"(<img.*?src=\")(.*?)(\".*?>)" options:0 error:nil];
        
        if ([htmlContent length] > 0) {
            NSTextCheckingResult *match = [regex firstMatchInString:htmlContent options:0 range:rangeOfString];
            
            if (match != NULL ) {
                NSString *imgUrl = [htmlContent substringWithRange:[match rangeAtIndex:2]];
                //NSLog(@"url: %@", imgUrl);
                
                //NSLog(@"match %@", match);
                if ([[imgUrl lowercaseString] rangeOfString:@"feedburner"].location == NSNotFound) {
                    imgSrc = imgUrl;
                }
            }
        }
        // Process
        NSString *itemTitle = item.title ? [item.title stringByConvertingHTMLToPlainText] : @"[No Title]";
        NSString *itemSummary = item.summary ? [item.summary stringByConvertingHTMLToPlainText] : @"[No Summary]";
        
        // Set
        
        
        UIImageView *postImage;
        postImage = (UIImageView *)[cell viewWithTag:9];
        [postImage setImage:[UIImage imageWithData:
                             [NSData dataWithContentsOfURL:
                             [NSURL URLWithString:imgSrc]]]];
        
        if (imgSrc == NULL) {
            [postImage setImage:[UIImage imageNamed:@"dollar-icon.png"]];
        }
        
        UILabel *postTitle;
        postTitle = (UILabel *)[cell viewWithTag:10];
        postTitle.text = item.title;
        
        UILabel *postDate;
        postDate = (UILabel *)[cell viewWithTag:11];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"MMM d, yyyy";
        
        postDate.text = [format stringFromDate:item.date];
        
    }
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"postView" sender:NULL];
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MWFeedItem *item = [itemsToDisplay objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    
    PostTableViewController *nextVC = segue.destinationViewController;
    
    nextVC.item = item;

}



- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

@end

