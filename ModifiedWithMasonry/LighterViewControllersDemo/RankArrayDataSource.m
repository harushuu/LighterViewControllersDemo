//
//  RankArrayDataSource.m
//  LighterViewControllersDemo
//
//  Created by shuu on 16/3/4.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "RankArrayDataSource.h"
#import "RankModel.h"
#import "RankHistoryCell.h"
#import "DataModel.h"


@interface RankArrayDataSource ()

@property (nonatomic, strong) NSMutableArray *rankArray;
@property (nonatomic, strong) DataModel *data;
@property (nonatomic, strong) RankModel *rankModel;

@end

@implementation RankArrayDataSource
@synthesize rankArray = _rankArray;

- (instancetype)init
{
    if (self = [super init]) {
        
        [self sortRankHistory];
    }
    return self;
}

- (DataModel *)data
{
    if (!_data) _data = [[DataModel alloc]init];
    return _data;
}

- (NSMutableArray *)rankArray
{
    if (!_rankArray) {
        _rankArray = self.data.rankArray;
        if (_rankArray == nil) {
            _rankArray = [NSMutableArray array];
        }
    }
    return _rankArray;
}

- (void)setRankArray:(NSMutableArray *)rankArray
{
    _rankArray = rankArray;
}



- (void)sortRankHistory
{
    [self.rankArray sortUsingComparator:^NSComparisonResult(RankModel *obj1, RankModel *obj2) {
        CGFloat obj1Rank = [obj1.scorePercent floatValue];
        CGFloat obj2Rank = [obj2.scorePercent floatValue];
        return obj1Rank < obj2Rank;
    }];
    [self.data saveRankWithArray:self.rankArray];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rankArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankHistoryCell *cell = [RankHistoryCell cellWithTableView:tableView];
    if (!cell) {
        cell = [[RankHistoryCell alloc]init];
    }
    RankModel *rankModel = self.rankArray[indexPath.row];
    cell.row = indexPath.row;
    cell.rankModel = rankModel;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.rankArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.data saveRankWithArray:self.rankArray];
    }
}

@end
