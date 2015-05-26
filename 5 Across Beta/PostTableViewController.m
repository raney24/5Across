//
//  PostTableViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 4/17/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "PostTableViewController.h"
#import "NSString+HTML.h"


typedef enum { SectionHeader, SectionDetail } Sections;
typedef enum { SectionHeaderTitle, SectionHeaderDate, SectionHeaderURL, SectionHeaderAuthor } HeaderRows;
typedef enum { SectionDetailSummary } DetailRows;

@implementation PostTableViewController

@synthesize item, dateString, summaryString;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    
    // Date
    if (item.date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
        self.dateString = [formatter stringFromDate:item.date];
    }
    
    if (item.summary) {
        self.summaryString = [item.summary stringByConvertingHTMLToPlainText];
    } else {
        self.summaryString = @"No Summary";
    }
    
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 1;
    
    switch (section) {
        case 0: return 4;
        default: return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSLog(@"%@", item.title);
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    if (item) {
        NSString *itemTitle = item.title ? [item.title stringByConvertingHTMLToPlainText] : @"No title";
        cell.textLabel.text = item.title;
        
    
        // Display
        switch (indexPath.section) {
            case SectionHeader: {
                
                // Header
                switch (indexPath.row) {
                    case SectionHeaderTitle:
                        cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
                        cell.textLabel.text = itemTitle;
                        break;
                    case SectionHeaderDate:
                        cell.textLabel.text = dateString ? dateString : @"[No Date]";
                        break;
                    case SectionHeaderURL:
                        cell.textLabel.text = item.link ? item.link : @"[No Link]";
                        cell.textLabel.textColor = [UIColor blueColor];
                        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
                        break;
                    case SectionHeaderAuthor:
                        cell.textLabel.text = item.author ? item.author : @"[No Author]";
                        break;
                }
                break;
                
            }
        }
    }
    return cell;
//    if (indexPath.section == 0) {
//        AstronomicalObject *spaceObject = [self.outerSpaceBodies objectAtIndex:indexPath.row];
//        
//        cell.textLabel.text = spaceObject.astronomicalInformation[PLANET_NAME];
//        cell.textLabel.textColor = [UIColor whiteColor];
//        
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"Also known as %@", spaceObject.astronomicalInformation[PLANET_NICKNAME]];
//        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.75 alpha:1.0];
//        
//        cell.imageView.image = spaceObject.image;
//        
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == SectionHeader) {
        
        return 34;
        
    } else {
        
        NSString *summary = @"No Summary";
        if (summaryString) {
            summary = summaryString;
        }
        CGSize s = [summary sizeWithFont:[UIFont systemFontOfSize:15]
                        constrainedToSize:CGSizeMake(self.view.bounds.size.width - 40, MAXFLOAT)
                           lineBreakMode:UILineBreakModeWordWrap]; //for cell padding
        return s.height + 16; //Add padding
    }
    
    
}

#pragma Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == SectionHeader && indexPath.row == SectionHeaderURL) { //Open URL
        if (item.link) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:item.link]];
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES]; // Deselect
}



@end
