//
//  RankHistoryTableView.m
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "RankHistoryTableView.h"
#import "ViewController.h"
#import "RankArrayDataSource.h"
#import "RankHeaderView.h"

@interface RankHistoryTableView ()
@property (nonatomic, strong) RankArrayDataSource *dataSource;

@end

@implementation RankHistoryTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSwipeControls];
    [self setTableViewInfo];
}

- (void)setTableViewInfo
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.dataSource = [[RankArrayDataSource alloc]init];
    self.tableView.dataSource = self.dataSource;
    self.tableView.rowHeight = 54;
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ranknormal"]];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RankHeaderView *headerView = [[RankHeaderView alloc]initHeaderView];
    return headerView;
}

- (void)setupSwipeControls
{
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(popRankView)];
    rightSwipe.numberOfTouchesRequired = 1;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];

}

- (void)popRankView
{
    ViewController *vc = [[ViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
