//
//  HZRefreshNormalHeader.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshNormalHeader.h"
#import "UIView+Extension.h"
#import "UILabel+HZRefreshLabel.h"

@implementation HZRefreshNormalHeader

- (void)prepare{
    [super prepare];
//    self.backgroundColor = [UIColor blueColor];
    [self addSubview:self.arrowView];
    [self addSubview:self.indicatorView];
}
- (void)placeSubViews{
    [super placeSubViews];
    CGFloat finalTextWidth = self.stateLabel.textWidth > self.lastUpdateTimeLabel.textWidth ? self.stateLabel.textWidth : self.lastUpdateTimeLabel.textWidth;
    self.arrowView.hz_size = self.arrowView.image.size;
    self.arrowView.center = CGPointMake((self.hz_w - finalTextWidth) / 4, self.hz_h / 2);
    self.indicatorView.hz_size = self.arrowView.image.size;
    self.indicatorView.center =  CGPointMake((self.hz_w - finalTextWidth) / 4, self.hz_h / 2);
}
- (void)setState:(HZRefreshState)state{
    [super setState:state];
    if (state == HZRefreshStateNormal) {
        [UIView animateWithDuration:0.4f animations:^{
            self.indicatorView.alpha = 0.f;
            /*
             CGAffineTransform 用于设定UIView的transform 属性，控制视图的缩放 旋转和平移
             */
            _arrowView.transform = CGAffineTransformIdentity; //操作结束后对设置量进行还原
        } completion:^(BOOL finished) {
            self.indicatorView.alpha = 0.f;
            self.arrowView.alpha = 1.f;
        }];
    }else if (state == HZRefreshStatePulling){
        [UIView animateWithDuration:0.4f animations:^{
            self.arrowView.transform = CGAffineTransformMakeRotation(0.0001 - M_PI);
        }];
        
    }else if (state == HZRefreshStateRefrshing){
        self.arrowView.alpha = 0.f;
        self.indicatorView.alpha = 1.f;
        [self.indicatorView startAnimating];
    }
}
- (UIImageView *)arrowView{
    if (!_arrowView) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"arrow@2x" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _arrowView = [[UIImageView alloc] initWithImage:image];
    }
    return _arrowView;
}
- (UIActivityIndicatorView *)indicatorView{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] init];
    }
    return _indicatorView;
}
@end
