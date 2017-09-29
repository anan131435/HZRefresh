//
//  HZRefreshBaseView.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshBaseView.h"
#import "UIView+Extension.h"
#import "UIScrollView+HZExtension.h"

@implementation HZRefreshBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        self.state = HZRefreshStateNormal;
    }
    return self;
}
- (void)prepare{};
- (void)layoutSubviews{
    [super layoutSubviews];
    [self placeSubViews];
}
- (void)placeSubViews{
    
}
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview && [newSuperview isKindOfClass:[UIScrollView class]]) {
        //防止重复添加监听者
        [self.superview removeObserver:self forKeyPath:@"contentOffset"];
        self.scrollView = (UIScrollView *)newSuperview;
        self.originalInset = self.scrollView.contentInset;
        self.hz_X = 0;
        self.hz_w = self.scrollView.hz_w;
        [newSuperview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewDidChange:change];
    }
}
- (void)scrollViewDidChange:(NSDictionary *)changes{};
- (void)beginRefresh{
    if (self.refreshingHandler) {
        self.refreshingHandler();
    }
}
- (void)endRefresh{
    //把上次刷新时间存储
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"lastUpdateDate"];
    self.state = HZRefreshStateNormal;
}
- (void)setState:(HZRefreshState)state{
    if (_state != state) {
        _state = state;
    }
    
}
@end
