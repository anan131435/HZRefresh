//
//  UIScrollView+HZExtension.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "UIScrollView+HZExtension.h"

@implementation UIScrollView (HZExtension)
- (void)setHz_insetB:(CGFloat)hz_insetB{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = hz_insetB;
    self.contentInset = inset;
}
- (CGFloat)hz_insetB{
    return self.contentInset.bottom;
}
- (void)setHz_insetL:(CGFloat)hz_insetL{
    UIEdgeInsets inset = self.contentInset;
    inset.left = hz_insetL;
    self.contentInset = inset;
}
- (CGFloat)hz_insetL{
    return self.contentInset.left;
}
- (void)setHz_insetR:(CGFloat)hz_insetR{
    UIEdgeInsets inset = self.contentInset;
    inset.right = hz_insetR;
    self.contentInset = inset;
}
- (CGFloat)hz_insetR{
    return self.contentInset.right;
}
- (void)setHz_insetT:(CGFloat)hz_insetT{
    UIEdgeInsets inset = self.contentInset;
    inset.top = hz_insetT;
    self.contentInset = inset;
}
- (CGFloat)hz_insetT{
    return self.contentInset.top;
}
- (void)setHz_offsetX:(CGFloat)hz_offsetX{
    CGPoint offset = self.contentOffset;
    offset.x = hz_offsetX;
    self.contentOffset = offset;
}
- (CGFloat)hz_offsetX{
    return self.contentOffset.x;
}
- (void)setHz_offsetY:(CGFloat)hz_offsetY{
    CGPoint offset = self.contentOffset;
    offset.y = hz_offsetY;
    self.contentOffset = offset;
}
- (CGFloat)hz_offsetY{
    return self.contentOffset.y;
}
- (void)setHz_contentH:(CGFloat)hz_contentH{
    CGSize size = self.contentSize;
    size.height = hz_contentH;
    self.contentSize = size;
}
- (CGFloat)hz_contentH{
    return self.contentSize.height;
}
- (void)setHz_contentW:(CGFloat)hz_contentW{
    CGSize size = self.contentSize;
    size.width = hz_contentW;
    self.contentSize = size;
}
- (CGFloat)hz_contentW{
    return self.contentSize.width;
}

@end
