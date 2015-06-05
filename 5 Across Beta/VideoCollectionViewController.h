//
//  VideoCollectionViewController.h
//  5 Across Beta
//
//  Created by Kyle Raney on 6/4/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface VideoCollectionViewController : UICollectionViewController

-(NSMutableArray *)createArrayofVideoURLs:(NSString *)inputString;

-(NSString *)getVideoIdFromUrl:(NSString *)inputString;

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end