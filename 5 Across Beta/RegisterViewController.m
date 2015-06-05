//
//  RegisterViewController.m
//  5 Across Beta
//
//  Created by Kyle Raney on 6/1/15.
//  Copyright (c) 2015 Kyle Raney. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_registerButton makeButtonShiny:_registerButton
                 withBackgroundColor:
                    [UIColor blueColor]];
    
    [_applyButton makeButtonShiny:_applyButton
                 withBackgroundColor:
                    [UIColor blueColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerButtonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.5across.org"]];
}
- (IBAction)applyButtonPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.5across.org/apply/"]];
}
@end




