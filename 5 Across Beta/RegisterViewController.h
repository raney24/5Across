//
//  RegisterViewController.h
//  5 Across Beta
//
//  Created by Kyle Raney on 6/1/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "registerButton.h"

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet registerButton *registerButton;
- (IBAction)registerButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet registerButton *applyButton;
- (IBAction)applyButtonPressed:(id)sender;

@end
