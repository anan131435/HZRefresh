//
//  HZRefreshBaseHeader.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshBaseHeader.h"
#import "UIView+Extension.h"
#import "UIScrollView+HZExtension.h"

@implementation HZRefreshBaseHeader
+ (instancetype)headerRefreshingWithBlock:(HZRefreshingBlock)refreshingHandler{
    //self 即为第一次收到消息的对象，HZRefresh很好的利用了OC的继承特性来实现代码分层易扩展
    HZRefreshBaseHeader *header = [[self alloc] init];
    header.refreshingHandler = refreshingHandler;
    return header;
}
- (void)prepare{
    [super prepare];
    //设置基类高度
    self.hz_h = 50.f;
}
- (void)placeSubViews{
    [super placeSubViews];
    self.hz_Y = - self.hz_h - self.originalInset.top;
}
- (void)scrollViewDidChange:(NSDictionary *)changes{
    [super scrollViewDidChange:changes];
    CGFloat offsetY = self.scrollView.hz_offsetY;
    CGFloat boundryOffsetY = self.hz_h  + self.originalInset.top;
    //向下拉offsetY 是负的
    CGFloat pullingPercent = -offsetY / boundryOffsetY;
    //控制header的悬停
    if (self.state == HZRefreshStateRefrshing) {
        self.alpha = 1.f;
        CGFloat finalInsetTop = -offsetY > boundryOffsetY ? boundryOffsetY : -offsetY;
        self.scrollView.hz_insetT = finalInsetTop;
    }
    if (self.scrollView.dragging) {//正在拖拉
        if (self.state == HZRefreshStateNormal && -offsetY > boundryOffsetY) {
            self.state = HZRefreshStatePulling;
        }else if (self.state == HZRefreshStatePulling && -offsetY < boundryOffsetY){
            self.state = HZRefreshStateNormal;
        }
    }else{//松开了
        if (self.state == HZRefreshStatePulling) {
            self.state = HZRefreshStateRefrshing;
        }else{
            self.alpha = pullingPercent;
        }
    }
}
- (void)setState:(HZRefreshState)state{
    [super setState:state];
    if (state == HZRefreshStateRefrshing) {
        [UIView animateWithDuration:0.4f animations:^{
            self.scrollView.hz_insetT = self.hz_h + self.originalInset.top;
            self.scrollView.hz_offsetY = - self.hz_h - self.originalInset.top;
        }];
        [self beginRefresh];
    }else if (state == HZRefreshStateNormal){
        [UIView animateWithDuration:0.4f animations:^{
            self.scrollView.contentInset = self.originalInset;
        }];
    }
}

@end
