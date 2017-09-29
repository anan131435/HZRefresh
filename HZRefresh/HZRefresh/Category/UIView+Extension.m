//
//  UIView+Extension.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setHz_h:(CGFloat)hz_h{
    CGRect frame = self.frame;
    frame.size.height = hz_h;
    self.frame = frame;
}
- (CGFloat)hz_h{
    return self.frame.size.height;
}
- (void)setHz_w:(CGFloat)hz_w{
    CGRect frame = self.frame;
    frame.size.width = hz_w;
    self.frame = frame;
}
- (CGFloat)hz_w{
    return self.frame.size.width;
}
- (void)setHz_size:(CGSize)hz_size{
    CGRect frame = self.frame;
    frame.size = hz_size;
    self.frame = frame;
}
- (CGSize)hz_size{
    return self.frame.size;
}
- (void)setHz_origin:(CGPoint)hz_origin{
    CGRect frame = self.frame;
    frame.origin = hz_origin;
    self.frame = frame;
}
- (CGPoint)hz_origin{
    return self.frame.origin;
}
- (void)setHz_X:(CGFloat)hz_X{
    CGRect frame = self.frame;
    frame.origin.x = hz_X;
    self.frame =  frame;
}
- (CGFloat)hz_X{
    return self.frame.origin.x;
}
- (void)setHz_Y:(CGFloat)hz_Y{
    CGRect frame = self.frame;
    frame.origin.y = hz_Y;
    self.frame = frame;
}
- (CGFloat)hz_Y{
    return self.frame.origin.y;
}





@end
