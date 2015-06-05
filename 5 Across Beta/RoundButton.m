//
//  RoundButton.m
//  5 Across Beta
//
//  Created by Kyle Raney on 5/28/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

- (void) drawRect:(CGRect) rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Image Declarations
    UIImage* micicon = [UIImage imageNamed: @"mic-icon.png"];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 150, 150)];
    [UIColor.grayColor setFill];
    [ovalPath fill];
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(21, 33, 108, 21);
    {
        NSString* textContent = @"5 Pitches";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: UIFont.labelFontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(60, 76, 30, 30)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawTiledImage(context, CGRectMake(60, -76, micicon.size.width, micicon.size.height), micicon.CGImage);
    CGContextRestoreGState(context);
}

@end
