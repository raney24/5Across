//
//  AboutViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 5/26/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

@synthesize PitchesButton;

int buttonPressedSwitch = 0;

- (IBAction)PitchesButtonPressed:(UIButton *)sender {
    
    UIImage *btnImage1 = [UIImage imageNamed:@"5-pitches.png"];
    UIImage *btnImage2 = [UIImage imageNamed:@"5-minutes.png"];
    
    if ((buttonPressedSwitch % 2) ==  0) {
        [PitchesButton setImage:btnImage2 forState:UIControlStateNormal];
        buttonPressedSwitch++;        
    } else {
        [PitchesButton setImage:btnImage1 forState:UIControlStateNormal];
        buttonPressedSwitch++;
    }
    
}

- (IBAction)PitchesButtonPressed2:(id)sender {
    
    
}
@end
