//
//  ViewController.m
//  DesignerNews
//
//  Created by easonlee on 12/20/14.
//  Copyright (c) 2014 easonlee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)loginButtonDidPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *dialogView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonDidPress:(id)sender {
    // Animate login button
    [UIView animateWithDuration:0.1 animations:^{
        self.loginButton.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished){
        // step 2
        [UIView animateWithDuration:0.1 animations:^{
            self.loginButton.transform = CGAffineTransformMakeTranslation(-10, 0);
        } completion:^(BOOL finished){
            // step 3
            [UIView animateWithDuration:0.1 animations:^{
                self.loginButton.transform = CGAffineTransformMakeTranslation(0, 0);
            } completion:^(BOOL finished){
            }];
        }];
    }];
    
    // animateWithDuration with Damping
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        [self.dialogView setFrame:CGRectMake(self.dialogView.frame.origin.x, self.dialogView.frame.origin.y, self.dialogView.frame.size.width, 320)];
    }completion:^(BOOL finished) {}];
}
@end
