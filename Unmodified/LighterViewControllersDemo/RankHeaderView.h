//
//  RankHeaderView.h
//  SetCard
//
//  Created by shuu on 16/2/23.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RankHeaderView;

@protocol RankHeaderViewDelegate <NSObject>

- (void)rankHeaderViewClick:(UIButton *)button;

@end


@interface RankHeaderView : UIView
@property (nonatomic, strong) UIButton *headerButton;
@property (nonatomic, weak) id <RankHeaderViewDelegate> delegate;

- (instancetype)initHeaderView;



@end
