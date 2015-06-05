//
//  registerButton.m
//  5 Across Beta
//
//  Created by Kyle Raney on 6/1/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "registerButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation registerButton


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self makeButtonShiny:self withBackgroundColor:backgroundColor];
    }
    return self;
}

//- (void)makeGlossy
//{
//    CALayer *thisLayer = self.layer;
//    
//    // Add a border
//    thisLayer.cornerRadius = 8.0f;
//    thisLayer.masksToBounds = NO;
//    thisLayer.borderWidth = 2.0f;
//    thisLayer.borderColor = self.backgroundColor.CGColor;
//    
//    // Give it a shadow
//    if ([thisLayer respondsToSelector:@selector(shadowOpacity)]) // For compatibility, check if shadow is supported
//    {
//        thisLayer.shadowOpacity = 0.7;
//        thisLayer.shadowColor = [[UIColor blackColor] CGColor];
//        thisLayer.shadowOffset = CGSizeMake(0.0, 3.0);
//        
//        // TODO: Need to test these on iPad
//        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2)
//        {
//            thisLayer.rasterizationScale=2.0;
//        }
//        thisLayer.shouldRasterize = YES; // FYI: Shadows have a poor effect on performance
//    }
//    
//    // Add backgorund color layer and make original background clear
//    CALayer *backgroundLayer = [CALayer layer];
//    backgroundLayer.cornerRadius = 8.0f;
//    backgroundLayer.masksToBounds = YES;
//    backgroundLayer.frame = thisLayer.bounds;
//    backgroundLayer.backgroundColor=self.backgroundColor.CGColor;
//    [thisLayer insertSublayer:backgroundLayer atIndex:0];
//    
//    thisLayer.backgroundColor=[UIColor colorWithWhite:0.0f alpha:0.0f].CGColor;
//    
//    // Add gloss to the background layer
//    CAGradientLayer *glossLayer = [CAGradientLayer layer];
//    glossLayer.frame = thisLayer.bounds;
//    glossLayer.colors = [NSArray arrayWithObjects:
//                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
//                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
//                         (id)[UIColor colorWithWhite:0.75f alpha:0.0f].CGColor,
//                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
//                         nil];
//    glossLayer.locations = [NSArray arrayWithObjects:
//                            [NSNumber numberWithFloat:0.0f],
//                            [NSNumber numberWithFloat:0.5f],
//                            [NSNumber numberWithFloat:0.5f],
//                            [NSNumber numberWithFloat:1.0f],
//                            nil];
//    [backgroundLayer addSublayer:glossLayer];
//}

- (void)makeButtonShiny:(registerButton *)button withBackgroundColor:(UIColor*)backgroundColor
{
    // Get the button layer and give it rounded corners with a semi-transparant button
    CALayer *layer = button.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 2.0f;
    layer.borderColor = [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor;
    
    // Create a shiny layer that goes on top of the button
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = button.layer.bounds;
    // Set the gradient colors
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    // Set the relative positions of the gradien stops
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    
    // Add the layer to the button
    [button.layer addSublayer:shineLayer];
    
    [button setBackgroundColor:backgroundColor];
}


@end
