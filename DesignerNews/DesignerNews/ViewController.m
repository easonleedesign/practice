//
//  ViewController.m
//  DesignerNews
//
//  Created by easonlee on 12/20/14.
//  Copyright (c) 2014 easonlee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
- (IBAction)loginButtonDidPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *dialogView;
@property (weak, nonatomic) IBOutlet UIImageView *emailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    // Do something when text field is focused.
    if ([textField isEqual:self.emailTextField]) {
        NSLog(@"email");
        [self.emailTextField setBackground:[UIImage imageNamed:@"input-outline-active"]];
        self.emailImageView.image = [UIImage imageNamed:@"icon-mail-active"];
        self.passwordImageView.image = [UIImage imageNamed:@"icon-password"];
        [self.passwordTextField setBackground:[UIImage imageNamed:@"input-outline"]];
        
    } else if ([textField isEqual:self.passwordTextField]) {
        NSLog(@"password");
        [self.passwordTextField setBackground:[UIImage imageNamed:@"input-outline-active"]];
        self.passwordImageView.image = [UIImage imageNamed:@"icon-password-active"];
        self.emailImageView.image = [UIImage imageNamed:@"icon-mail"];
        [self.emailTextField setBackground:[UIImage imageNamed:@"input-outline"]];
    }
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
