//
//  VideoCollectionViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 6/4/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "VideoCollectionViewController.h"

@interface VideoCollectionViewController () {
    NSMutableArray *videoIdArray;
}
@end

@implementation VideoCollectionViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"http://5across.org/videos/?json=1";
    NSURL *urlRequest = [NSURL URLWithString:url];
    NSError *err = nil;
    
    NSString *html = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];
    
    NSMutableArray *videoURLArray = [self createArrayofVideoURLs:html];
    
    videoIdArray = [NSMutableArray new];
    NSString *videoId;
    NSUInteger videoURLArrayLength = [videoURLArray count];
    
    for (int i = 1; i < videoURLArrayLength; i++) {
        videoId = [self getVideoIdFromUrl:[videoURLArray objectAtIndex:i]];
        [videoIdArray addObject:videoId];
        
    }

//    for (id obj in videoIdArray) {
//        NSLog(@"id: %@", obj);
//    }
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return videoIdArray.count / 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    YTPlayerView *videoView = (YTPlayerView *)[cell viewWithTag:100];
    _playerView = videoView;
    
    
    [_playerView loadWithVideoId:[videoIdArray objectAtIndex:indexPath.row]];

    return cell;

}

-(NSString *)getVideoIdFromUrl:(NSString *)inputString {
    NSString *vidID;
    
    NSString *pattern = @"(?:(?:\.be\/|embed\/|v\/|\\?v=|\&v=|\/videos\/)|(?:[\\w+]+#\\w\/\\w(?:\/[\\w]+)?\/\\w\/))([\\w-_]+)";
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString: inputString
                                                    options: 0
                                                      range: NSMakeRange(0, [inputString length])];
    
    if ( match ) {
        NSRange videoIDRange             = [match rangeAtIndex:1];
        vidID = [inputString substringWithRange:videoIDRange];
        
    }
    
    return vidID;
}

-(NSMutableArray *)createArrayofVideoURLs:(NSString *)inputString {
    NSMutableArray *array = [NSMutableArray new];
    
    NSScanner *scanner = [NSScanner scannerWithString:inputString];
    
    NSString *beginningScan = @"a href=";
    NSString *endingScan = @" ";
    
    [scanner scanUpToString:endingScan intoString:nil]; // Scan all characters before #
    while(![scanner isAtEnd]) {
        NSString *substring = nil;
        [scanner scanString:beginningScan intoString:nil]; // Scan the # character
        if([scanner scanUpToString:endingScan intoString:&substring]) {
            // If the space immediately followed the #, this will be skipped
            [array addObject:substring];
        }
        [scanner scanUpToString:beginningScan intoString:nil]; // Scan all characters before next #
    }
    
    
    return array;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (IBAction)viewVideoArchivesPressed:(id)sender {
}
@end
