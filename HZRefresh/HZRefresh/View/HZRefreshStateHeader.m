//
//  HZRefreshStateHeader.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "HZRefreshStateHeader.h"
#import "UIView+Extension.h"
#import "UIScrollView+HZExtension.h"
#import "UILabel+HZRefreshLabel.h"
@interface HZRefreshStateHeader()
@property (nonatomic, strong) NSMutableDictionary  *stateDict;
@end

@implementation HZRefreshStateHeader
- (void)prepare{
    [super prepare];
    [self addSubview:self.stateLabel];
    [self addSubview:self.lastUpdateTimeLabel];
    [self setTitle:@"下拉即将刷新" state:HZRefreshStateNormal];
    [self setTitle:@"松开就会刷新" state:HZRefreshStatePulling];
    [self setTitle:@"正在刷新..." state:HZRefreshStateRefrshing];
}
- (void)placeSubViews{
    [super placeSubViews];
    self.stateLabel.frame = ({
        CGRect frame = self.bounds;
        frame.size.height = self.hz_h / 2;
        frame;
    });
    self.lastUpdateTimeLabel.frame = ({
        CGRect frame = self.bounds;
        frame.origin.y = self.hz_h / 2;
        frame.size.height = self.hz_h / 2;
        frame;
    });
}
- (void)setState:(HZRefreshState)state{
    [super setState:state];
    self.stateLabel.text = self.stateDict[@(state)];
    self.lastUpdateTimeLabel.text = [self lastUpdateTime];
}
- (NSString *)lastUpdateTime{
    NSDate *lastUpdateDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastUpdateDate"];
    
    if (!lastUpdateDate) {
        
        return @"暂无刷新纪录";
        
    } else {
        
        NSDate *today = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];  //9.x不准确
        NSCalendarUnit unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute;
        NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:today];
        NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:lastUpdateDate];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        if ([cmp1 day] == [cmp2 day]) {
            
            formatter.dateFormat = @" HH:mm";
            
        } else if ([cmp1 month] == [cmp2 month]) {
            
            formatter.dateFormat = @" dd HH:mm";
            
        } else if ([cmp1 year] == [cmp2 year]) {
            
            formatter.dateFormat = @"MM-dd HH:mm";
            
        } else {
            
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
            
        }
        
        return [formatter stringFromDate:lastUpdateDate];
        
        
    }
    
}
- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [UILabel refreshLabel];
    }
    return _stateLabel;
}
- (UILabel *)lastUpdateTimeLabel{
    if (!_lastUpdateTimeLabel) {
        _lastUpdateTimeLabel = [UILabel refreshLabel];
    }
    return _lastUpdateTimeLabel;
}
- (void)setTitle:(NSString *)title state:(HZRefreshState)state{
    self.stateDict[@(state)] = title;
}
- (NSMutableDictionary *)stateDict{
    if (!_stateDict) {
        _stateDict = [NSMutableDictionary new];
    }
    return _stateDict;
}
@end
