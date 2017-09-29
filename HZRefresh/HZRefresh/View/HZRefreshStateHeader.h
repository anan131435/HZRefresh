//
//  HZRefreshStateHeader.h
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshBaseHeader.h"

@interface HZRefreshStateHeader : HZRefreshBaseHeader
@property (nonatomic, strong) UILabel  *stateLabel;
@property (nonatomic, strong) UILabel  *lastUpdateTimeLabel;
- (void)setTitle:(NSString *)title state:(HZRefreshState)state;
@end
