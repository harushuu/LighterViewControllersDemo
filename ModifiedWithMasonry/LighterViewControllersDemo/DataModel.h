//
//  DataModel.h
//  SetCard
//
//  Created by shuu on 16/2/23.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RankModel;

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *rankArray;

- (void)saveNewRank:(RankModel *)rankModel;

- (void)saveRankWithArray:(NSMutableArray *)array;

@end
