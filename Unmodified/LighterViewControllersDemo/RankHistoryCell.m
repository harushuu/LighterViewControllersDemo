//
//  RankHistoryCell.m
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

typedef enum{
    SetGameModeTypeEasy = 1,
    SetGameModeTypeNormal,
    SetGameModeTypeHard,
    SetGameModeTypeEndless
} SetGameModeType;

#import "RankHistoryCell.h"
#import "RankModel.h"
#import "SetGameStarRateView.h"

@interface RankHistoryCell()

@property (nonatomic, weak) UIView *divide;


@end

@implementation RankHistoryCell


//- (UIView *)divide
//{
//    if (_divide == nil) {
//        UIView *divide = [[UIView alloc] init];
//        divide.backgroundColor = [UIColor blackColor];
//        divide.alpha = 0.2;
//        [self.contentView addSubview:divide];
//        _divide = divide;
//    }
//    
//    return _divide;
//}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    return [tableView dequeueReusableCellWithIdentifier:ID];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat divideH = 1;
    CGFloat divideW = self.frame.size.width;
    CGFloat divideY = self.frame.size.height - divideH;
    self.divide.frame = CGRectMake(0, divideY, divideW, divideH);
    
}

- (void)setRankModel:(RankModel *)rankModel
{
    _rankModel = rankModel;
    
    self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    self.backgroundColor = [UIColor clearColor];
    
    
    CGRect rankFrame;
    rankFrame.size.height = 40;
    rankFrame.size.width = self.bounds.size.width * 0.18;
    rankFrame.origin.x = self.bounds.size.width * 0.02;
    rankFrame.origin.y = 10;
    
    UILabel *rankNumber = [[UILabel alloc]init];
    rankNumber.frame = rankFrame;
    rankNumber.text = [NSString stringWithFormat:@"Rank %ld",self.row + 1];
    rankNumber.backgroundColor = [UIColor colorWithRed:238./255. green:228./255. blue:218./255. alpha:1];
    rankNumber.textAlignment = NSTextAlignmentCenter;
    rankNumber.layer.cornerRadius = 10;
    rankNumber.layer.masksToBounds = YES;
    rankNumber.font = [UIFont systemFontOfSize:15];
    [self addSubview:rankNumber];
    
    
    
    CGRect starFrame;
    starFrame.size.height = 40;
    starFrame.size.width = self.bounds.size.width * 0.55;
    starFrame.origin.x = self.bounds.size.width * 0.43;
    starFrame.origin.y = 10;
    
    SetGameStarRateView *star = [[SetGameStarRateView alloc]initWithFrame:starFrame numberOfStars:5];
    [star SetGameStarRateViewWithScroePercent:[rankModel.scorePercent floatValue]];
    star.layer.cornerRadius = 10;
    star.backgroundColor = [UIColor colorWithRed:238./255. green:228./255. blue:218./255. alpha:1];
    [self addSubview:star];
    
    
    
    
    CGRect HitFrame;
    HitFrame.size.height = 40;
    HitFrame.size.width = self.bounds.size.width * 0.18;
    HitFrame.origin.x = self.bounds.size.width * 0.22;
    HitFrame.origin.y = 10;
    
    UILabel *HitLabel = [[UILabel alloc]init];
    HitLabel.frame = HitFrame;
    HitLabel.text = [NSString stringWithFormat:@"%@ 连击",rankModel.hitCount];
    HitLabel.textAlignment = NSTextAlignmentCenter;
    HitLabel.layer.cornerRadius = 10;
    HitLabel.layer.masksToBounds = YES;
    HitLabel.font = [UIFont systemFontOfSize:15];
    HitLabel.backgroundColor = [UIColor colorWithRed:238./255. green:228./255. blue:218./255. alpha:1];
    [self addSubview:HitLabel];
    
    if ([self.rankModel.gameMode isEqualToString:@"SetGameModeTypeEndless"]) {
        star.hidden = YES;
        UILabel *endlessLabel = [[UILabel alloc]initWithFrame:starFrame];
        endlessLabel.text = @"无尽模式";
        endlessLabel.textAlignment = NSTextAlignmentCenter;
        endlessLabel.layer.cornerRadius = 10;
        endlessLabel.layer.masksToBounds = YES;
        endlessLabel.backgroundColor = [UIColor colorWithRed:238./255. green:228./255. blue:218./255. alpha:1];
        [self addSubview:endlessLabel];
    }
    
    
}






@end
