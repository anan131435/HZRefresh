//
//  UIScrollView+HZExtension.h
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HZExtension)
//UIEdgeInsets
@property (nonatomic, assign) CGFloat hz_insetT;
@property (nonatomic, assign) CGFloat hz_insetB;
@property (nonatomic, assign) CGFloat hz_insetL;
@property (nonatomic, assign) CGFloat hz_insetR;
//ContentSize
@property (nonatomic, assign) CGFloat hz_contentW;
@property (nonatomic, assign) CGFloat hz_contentH;
//ContentOffset
@property (nonatomic, assign) CGFloat hz_offsetY;
@property (nonatomic, assign) CGFloat hz_offsetX;
@end
