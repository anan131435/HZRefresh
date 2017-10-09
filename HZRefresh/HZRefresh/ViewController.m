//
//  ViewController.m
//  HZRefresh
//
//  Created by 韩志峰 on 2017/9/28.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+HZRefreshHeader.h"
#import "HZRefreshNormalHeader.h"
#define KscreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView  *tabelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabelView];
    self.tabelView.refreshHeader = [HZRefreshNormalHeader headerRefreshingWithBlock:^{
        NSLog(@"i am freshing");
    }];
     self.tabelView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    self.tabelView.estimatedRowHeight = 0;
//    self.tabelView.estimatedSectionHeaderHeight = 0;
//    self.tabelView.estimatedSectionFooterHeight = 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 300;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tabelView.refreshHeader setState:HZRefreshStateNormal];
}

- (UITableView *)tabelView{
    if (!_tabelView) {
        _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 300) style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
    }
    return _tabelView;
}



@end
