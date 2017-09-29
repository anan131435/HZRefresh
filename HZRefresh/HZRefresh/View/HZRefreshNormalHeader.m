//
//  HZRefreshNormalHeader.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshNormalHeader.h"
#import "UIView+Extension.h"
@implementation HZRefreshNormalHeader

- (void)prepare{
    [super prepare];
    [self addSubview:self.arrowView];
    [self addSubview:self.indicatorView];
}
- (void)placeSubViews{
    [super placeSubViews];
    self.arrowView.hz_size = self.arrowView.image.size;
    
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
