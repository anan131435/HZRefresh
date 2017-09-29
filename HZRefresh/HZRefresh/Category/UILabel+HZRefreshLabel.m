//
//  UILabel+HZRefreshLabel.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "UILabel+HZRefreshLabel.h"

@implementation UILabel (HZRefreshLabel)
+ (instancetype)refreshLabel{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14.f];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blueColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
- (CGFloat)textWidth{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
}
@end
