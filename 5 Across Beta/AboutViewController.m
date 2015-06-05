//
//  AboutViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 5/26/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "AboutViewController.h"


@implementation AboutViewController

int buttonPressedSwitch = 0;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _pitchesButton.layer.cornerRadius = 10;//_pitchesButton.frame.size.width / 2;
    _pitchesButton.clipsToBounds = YES;
    
    _pitchesButton.layer.borderWidth = 3.0f;
    _pitchesButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)pitchesButtonPressed:(UIButton *)sender {
    
    NSString *pitchesDetailText = @"5 passionate teams present their business concepts";

    
    NSString *pitchesTitleText = @"5 Pitches";
    
    if ((buttonPressedSwitch % 2) ==  0) {
        
        [_pitchesButton setImage:NULL forState:UIControlStateNormal];
        [_pitchesButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 10.0f, 10.0f, 0.0f)];
        _pitchesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [_pitchesButton setTitle:pitchesDetailText forState:UIControlStateNormal];
        buttonPressedSwitch++;
    } else {
        [_pitchesButton setTitle:@"Hell2o" forState:UIControlStateNormal];
        buttonPressedSwitch++;
    }
    
}
- (IBAction)minuteButtonPressed:(UIButton *)sender {
    NSString *minuteDetailText = @"Each team gets up to 5 minutes to communicate their vision";
    UIImage *minuteIcon = [UIImage imageNamed:@"minute-icon.png"];

    

    
    if ((buttonPressedSwitch % 2) ==  0) {
        

        _minuteLabel.text = minuteDetailText;
        [_minuteLabel setNumberOfLines:0];
        [_minuteLabel sizeToFit];
        //[_minuteLabel removeConstraint: _minuteLabelTopContstraint];
        
        _minuteLabel.frame = CGRectMake(_minuteLabel.frame.origin.x+25, _minuteLabel.frame.origin.y, 120.0f, 120.0f);
        _minuteIcon.hidden = YES;
        buttonPressedSwitch++;
    } else {
        _minuteLabel.text = @"Hello";
        //_minuteIcon.image = minuteIcon;
        _minuteIcon.hidden = NO;
        buttonPressedSwitch++;
    }
}
@end
