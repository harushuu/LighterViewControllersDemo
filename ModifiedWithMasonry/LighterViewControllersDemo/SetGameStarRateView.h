//
//  SetGameStarRateView.h
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetGameStarRateView : UIView

@property (nonatomic, assign) CGFloat scorePercent;
@property (nonatomic, assign) BOOL hasAnimation;
@property (nonatomic, assign) BOOL allowIncompleteStar;

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

- (void)SetGameStarRateViewWithScroePercent:(CGFloat)scroePercent;

@end
