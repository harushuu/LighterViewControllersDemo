//
//  RankHeaderView.m
//  SetCard
//
//  Created by shuu on 16/2/23.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "RankHeaderView.h"

@implementation RankHeaderView

- (instancetype)initHeaderView
{
    if (self = [super init]) {
        self = [[RankHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        
        self.headerButton = [[UIButton alloc]initWithFrame:self.bounds];
        [self addSubview:self.headerButton];
        [self.headerButton addTarget:self action:@selector(clickHeaderButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self.headerButton setTitle:@"向左滑动删除记录，向右滑动返回主菜单" forState:UIControlStateNormal];
        [self.headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}



- (void)clickHeaderButton
{
    
//    NSLog(@"%s", __func__);
    
    if ([self.delegate respondsToSelector:@selector(rankHeaderViewClick:)]) {
        [self.delegate rankHeaderViewClick:self.headerButton];
    }
}

@end
