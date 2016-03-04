//
//  ContentView.m
//  LighterViewControllersDemo
//
//  Created by shuu on 16/3/4.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    
     
     NSString *str = @"什么也没有，点击任意返回";
     
     NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
     textStyle.alignment = NSTextAlignmentCenter;
     textStyle.lineBreakMode = NSLineBreakByWordWrapping;
     
     NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:15],
     NSForegroundColorAttributeName: [UIColor whiteColor],
     NSStrokeWidthAttributeName: @2,
     NSStrokeColorAttributeName: [UIColor redColor],
     NSParagraphStyleAttributeName: textStyle};
     
     CGSize size = [str boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
     
     CGRect textframe;
     textframe.size.width = size.width;
     textframe.size.height = size.height;
     textframe.origin.x = (self.bounds.size.width - textframe.size.width) * 0.5;
     textframe.origin.y = (self.bounds.size.height - textframe.size.height) * 0.5;
     
     [str drawInRect:textframe withAttributes:dict];

}


@end
