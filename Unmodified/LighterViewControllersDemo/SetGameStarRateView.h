//
//  SetGameStarRateView.h
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SetGameStarRateView;
@protocol SetGameStarRateViewDelegate <NSObject>
@optional
- (CGFloat)SetGameStarRateViewscroePercentDidChange;
@end

@interface SetGameStarRateView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO


@property (nonatomic, weak) id<SetGameStarRateViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

- (void)SetGameStarRateViewWithScroePercent:(CGFloat)scroePercent;

@end
