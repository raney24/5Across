//
//  registerButton.h
//  5 Across Beta
//
//  Created by Kyle Raney on 6/1/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerButton : UIButton

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor;

- (void)makeButtonShiny:(registerButton *)button withBackgroundColor:(UIColor*)backgroundColor;

//- (void)makeGlossy;
@end
