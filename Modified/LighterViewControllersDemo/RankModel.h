//
//  RankModel.h
//  SetCard
//
//  Created by shuu on 16/2/22.
//  Copyright © 2016年 shuu. All rights reserved.
//



#import <Foundation/Foundation.h>


@interface RankModel : NSObject <NSCoding>
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *scorePercent;
@property (nonatomic, strong) NSString *hitCount;
@property (nonatomic, strong) NSString *gameMode;

@end
