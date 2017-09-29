//
//  HZRefreshBaseView.h
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HZRefreshState) {
    HZRefreshStateNormal = 1, ///< 闲置状态
    HZRefreshStatePulling, ///<松开就会刷新
    HZRefreshStateRefrshing ///< 正在刷新状态
};

typedef void(^HZRefreshingBlock)(void);

@interface HZRefreshBaseView : UIView
@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) HZRefreshingBlock  refreshingHandler;
@property (nonatomic, assign) HZRefreshState state;
@property (nonatomic, assign) UIEdgeInsets originalInset;
//添加子视图 设置属性
- (void)prepare;
//设置视图frame
- (void)placeSubViews;
- (void)beginRefresh;
- (void)endRefresh;
//KVO 监听到scrollView滚动后调用
- (void)scrollViewDidChange:(NSDictionary *)changes;
@end
