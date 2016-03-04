//
//  RankModel.m
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "RankModel.h"

@implementation RankModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.scorePercent forKey:@"scorePercent"];
    [aCoder encodeObject:self.hitCount forKey:@"hitCount"];
    [aCoder encodeObject:self.gameMode forKey:@"gameMode"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.scorePercent = [aDecoder decodeObjectForKey:@"scorePercent"];
        self.hitCount = [aDecoder decodeObjectForKey:@"hitCount"];
        self.gameMode = [aDecoder decodeObjectForKey:@"gameMode"];
    }
    return self;
}

@end
