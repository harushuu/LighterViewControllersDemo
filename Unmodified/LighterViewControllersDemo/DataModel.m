//
//  DataModel.m
//  SetCard
//
//  Created by shuu on 16/2/23.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "DataModel.h"
#import "RankModel.h"

#import <UIKit/UIKit.h>

@implementation DataModel

- (instancetype)init
{
    if((self = [super init])){
        
        [self rankArray];
        
    }
    return self;
    
    
}

- (NSMutableArray *)rankArray
{
    if (!_rankArray) {
        _rankArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archiverPath]];
        if (_rankArray == nil) {
            _rankArray = [NSMutableArray array];
        }
    }
//    NSLog(@"load %ld",_rankArray.count);
    return _rankArray;
}

- (NSString *)archiverPath
{
//    return [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"setGame.plist"];
    
    return [[NSBundle mainBundle] pathForResource:@"setGame" ofType:@"plist"];
}

- (void)saveGameData
{
    if (self.rankArray) {
        for (RankModel *model in self.rankArray) {
            CGFloat hitCount = [model.hitCount floatValue];
            CGFloat scorePercent = [model.scorePercent floatValue];
            if (!hitCount || !scorePercent) {
                [self.rankArray removeObject:model];
            }
        }
    }
//    NSLog(@"saveGameData- %ld",self.rankArray.count);
    [NSKeyedArchiver archiveRootObject:self.rankArray toFile:[self archiverPath]];

}

- (void)saveNewRank:(RankModel *)rankModel
{
    [self.rankArray addObject:rankModel];
    [self saveGameData];
    
}

- (void)saveRankWithArray:(NSMutableArray *)array
{
    self.rankArray = array;
    [self saveGameData];
    
    
}

@end
