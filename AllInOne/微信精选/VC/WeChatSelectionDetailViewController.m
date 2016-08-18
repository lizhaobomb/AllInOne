//
//  WeChatSelectionDetailViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/18.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "WeChatSelectionDetailViewController.h"
#import "SDAutoLayout.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface WeChatSelectionDetailViewController ()<NJKWebViewProgressDelegate, UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *web;
@property (nonatomic, strong) NJKWebViewProgress *progressProxy;
@property (nonatomic, strong) NJKWebViewProgressView *progressView;
@end

@implementation WeChatSelectionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViews];
    [self setupConstraints];
    [self loadUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    [self.progressView setProgress:progress animated:YES];
}


#pragma mark - private methods
- (void)loadUrl {
    NSURL *url = [NSURL URLWithString:self.url];
    [self.web loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)loadSubViews {
    [self.view addSubview:self.web];
    [self.navigationController.navigationBar addSubview:self.progressView];
}

- (void)setupConstraints {
    self.web.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

#pragma mark - getters
- (UIWebView *)web {
    if (!_web) {
        _web = [[UIWebView alloc] init];
        _web.delegate = self.progressProxy;
    }
    return _web;
}

- (NJKWebViewProgressView *)progressView {
    if (!_progressView) {
        
        CGFloat progressBarHeight = 2.f;
        CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
        CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
        _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
        
    }
    return _progressView;
}

- (NJKWebViewProgress *)progressProxy {
    if (!_progressProxy) {
        _progressProxy = [[NJKWebViewProgress alloc] init];
        _progressProxy.webViewProxyDelegate = self;
        _progressProxy.progressDelegate = self;
    }
    return _progressProxy;
}

@end
