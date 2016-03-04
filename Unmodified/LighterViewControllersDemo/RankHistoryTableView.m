//
//  RankHistoryTableView.m
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "RankHistoryTableView.h"
#import "RankModel.h"
#import "RankHistoryCell.h"
#import "DataModel.h"
#import "RankHeaderView.h"
#import "ViewController.h"

@interface RankHistoryTableView ()<RankHeaderViewDelegate>
@property (nonatomic, strong) RankModel *rankModel;
@property (nonatomic, strong) NSMutableArray *rankArray;
@property (nonatomic, strong) DataModel *data;
@property (nonatomic, strong) RankHeaderView *headerView;

@end

@implementation RankHistoryTableView

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
    [self rankNone];
    
//    NSLog(@"tableview rankArray-%ld",_rankArray.count);
    
    return _rankArray;
}



- (NSString *)archiverPath
{
    return [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"setGame.plist"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [self setupSwipeControls];
    
    [self sortRankHistory];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:238./255. green:228./255. blue:218./255. alpha:1];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)sortRankHistory
{
   
    [self.rankArray sortUsingComparator:^NSComparisonResult(RankModel *obj1, RankModel *obj2) {
        CGFloat obj1Rank = [obj1.scorePercent floatValue];
        CGFloat obj2Rank = [obj2.scorePercent floatValue];
        
//        NSLog(@"obj1Rank-obj2Rank-%f-%f",obj1Rank,obj2Rank);
        
        return obj1Rank < obj2Rank;
    }];
    
    [self.tableView reloadData];
    
    [self.data saveRankWithArray:self.rankArray];
    

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
//    [self performSegueWithIdentifier:@"RankView" sender:nil];
    ViewController *vc = [[ViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.rankArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.headerView = [[RankHeaderView alloc]initHeaderView];
    self.headerView.delegate = self;

    
    return self.headerView;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.rankArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.data saveRankWithArray:self.rankArray];
        
        [self rankNone];
        
    }
}

- (void)rankHeaderViewClick:(UIButton *)button
{
    [self popRankView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (void)rankNone
{
   
    if (!_rankArray.count) {
        
        self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ranknone"]];
    }else{
        self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ranknormal"]];
    }
}

@end
