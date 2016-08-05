//
//  PopularTravellingViewController.m
//  AllInOne
//
//  Created by lizhao on 16/8/4.
//  Copyright © 2016年 lizhao. All rights reserved.
//

#import "PopularTravellingViewController.h"
#import "SDAutoLayout.h"
#import "PopularTravelAPI.h"
#import "ZLSwipeableView.h"
#import "CardView.h"
@interface PopularTravellingViewController () <CTAPIManagerCallBackDelegate,CTAPIManagerParamSource,ZLSwipeableViewDelegate,ZLSwipeableViewDataSource>
@property (nonatomic, strong) PopularTravelAPI *popularTravelAPI;
@property (nonatomic, strong) ZLSwipeableView *swipeView;
@end

@implementation PopularTravellingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.swipeView];
    self.swipeView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(40, 20, 40, 20));
    [self.popularTravelAPI loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.swipeView loadViewsIfNeeded];
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager {

}

- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager {

}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
//    if (self.colorIndex<self.colors.count) {
//        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
//        view.cardColor = [self colorForName:self.colors[self.colorIndex]];
//        self.colorIndex++;
//        return view;
//    }
//    return nil;
    CardView *view = [[CardView alloc] initWithFrame:_swipeView.bounds];
    view.cardColor = [UIColor cyanColor];
    return view;
}


#pragma makr - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager {
    return @{@"query":@"",@"page":@"1"};
}

#pragma mark - getters
- (PopularTravelAPI *)popularTravelAPI {
    if (!_popularTravelAPI) {
        _popularTravelAPI = [[PopularTravelAPI alloc] init];
        _popularTravelAPI.delegate = self;
        _popularTravelAPI.paramSource = self;
    }
    return _popularTravelAPI;
}

- (ZLSwipeableView *)swipeView {
    if (!_swipeView) {
        _swipeView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
        _swipeView.backgroundColor = [UIColor redColor];
        _swipeView.delegate = self;
        _swipeView.dataSource = self;
    }
    return _swipeView;
}

@end
