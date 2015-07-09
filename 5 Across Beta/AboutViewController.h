//
//  AboutViewController.h
//  5 Across Beta
//
//  Created by Kyle Raney on 5/26/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *pitchesButton;

- (IBAction)pitchesButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *pitchesIcon;
@property (weak, nonatomic) IBOutlet UILabel *pitchesLabel;
@property (weak, nonatomic) IBOutlet UILabel *pitchesLabelDescr;


@property (weak, nonatomic) IBOutlet UIButton *minuteButton;
- (IBAction)minuteButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabelDescr;
@property (weak, nonatomic) IBOutlet UIImageView *minuteIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *minuteLabelTopContstraint;

@end
