//
//  HZRefreshBaseHeader.h
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshBaseView.h"

@interface HZRefreshBaseHeader : HZRefreshBaseView
+ (instancetype)headerRefreshingWithBlock:(HZRefreshingBlock)refreshingHandler;
@end
