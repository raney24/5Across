//
//  AboutViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 5/26/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "AboutViewController.h"


@implementation AboutViewController

int pitchSwitch = 0;
int minuteSwitch = 0;
int moneySwitch = 0;
int timeSwitch = 0;
int feeSwitch = 0;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _minuteLabelDescr.hidden = YES;
    _pitchesLabelDescr.hidden = YES;
    
    //_pitchesButton.layer.cornerRadius = 10;//_pitchesButton.frame.size.width / 2;
    //_pitchesButton.clipsToBounds = YES;
    
    //_pitchesButton.layer.borderWidth = 3.0f;
    //_pitchesButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)buttonPressed: (UILabel *)withLabel : (UIImageView *)withIcon : (UILabel *)withDes
{
    
    if ((minuteSwitch % 2) ==  0) {
        withDes.hidden = NO;
        withLabel.hidden = YES;
        withIcon.hidden = YES;
        minuteSwitch++;
    } else {
        withDes.hidden = YES;
        withIcon.hidden = NO;
        withLabel.hidden = NO;
        minuteSwitch++;
    }
    
}

- (IBAction)pitchesButtonPressed:(UIButton *)sender {
    [self buttonPressed:_pitchesLabel :_pitchesIcon :_pitchesLabelDescr];
    
}

- (IBAction)minuteButtonPressed:(UIButton *)sender {
    [self buttonPressed:_minuteLabel :_minuteIcon :_minuteLabelDescr];
}
@end
