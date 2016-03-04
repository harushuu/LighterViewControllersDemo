//
//  RankHistoryCell.h
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankModel;

@interface RankHistoryCell : UITableViewCell
@property (nonatomic, strong) RankModel *rankModel;
@property (nonatomic, assign) NSInteger row;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
