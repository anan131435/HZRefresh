//
//  UIScrollView+HZRefreshHeader.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "UIScrollView+HZRefreshHeader.h"
#import <objc/runtime.h>

@implementation UIScrollView (HZRefreshHeader)
- (void)setRefreshHeader:(HZRefreshBaseHeader *)refreshHeader{
    if (refreshHeader != self.refreshHeader) {
        [self.refreshHeader removeFromSuperview];
        [self insertSubview:refreshHeader atIndex:0];
        objc_setAssociatedObject(self, @"header", refreshHeader, OBJC_ASSOCIATION_RETAIN);
    }
}
- (HZRefreshBaseHeader *)refreshHeader{
    return objc_getAssociatedObject(self, @"header");
}
@end
