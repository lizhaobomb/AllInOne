//
//  LZLoginViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/15.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "LZLoginViewController.h"
#import "SDAutoLayout.h"
#import "AVUser.h"
@interface LZLoginViewController ()

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *pwdField;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.userNameField];
    [self.view addSubview:self.pwdField];
    [self.view addSubview:self.loginButton];
    [self setupConstraint];
    AVUser *currentUser = [AVUser currentUser];
    NSLog(@"👌%@",currentUser);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupConstraint {
    self.userNameField.sd_layout.topSpaceToView(self.view, 20).leftSpaceToView(self.view, 20).rightSpaceToView(self.view, 20).heightIs(35);
    self.pwdField.sd_layout.topSpaceToView(self.userNameField,15).leftEqualToView(self.userNameField).rightEqualToView(self.userNameField).heightIs(35);
    self.loginButton.sd_layout.bottomSpaceToView(self.view, 20).leftEqualToView(self.pwdField).rightEqualToView(self.pwdField).heightIs(50);
}

#pragma mark - click method
- (void)login:(UIButton *)sender {
    AVUser *user = [AVUser new];
    user.username = self.userNameField.text;
    user.password = self.pwdField.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"注册成功");
        } else {
            NSLog(@"🐴注册失败-->%@",error.localizedDescription);
        }
    }];
}

#pragma mark - Getters
- (UITextField *)userNameField {
    if (!_userNameField) {
        _userNameField = [[UITextField alloc] initWithFrame:CGRectZero];
        _userNameField.placeholder = @"请输入用户名";
        _userNameField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _userNameField;
}

- (UITextField *)pwdField {
    if (!_pwdField) {
        _pwdField = [[UITextField alloc] initWithFrame:CGRectZero];
        _pwdField.placeholder = @"请输入密码";
        _pwdField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _pwdField;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end
