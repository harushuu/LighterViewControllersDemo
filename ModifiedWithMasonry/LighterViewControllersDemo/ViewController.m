//
//  ViewController.m
//  LighterViewControllersDemo
//
//  Created by shuu on 16/3/4.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addSubViews
{
    ContentView *content = [[ContentView alloc]initWithFrame:self.view.bounds];
    content.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:content];
    
    UIEdgeInsets topLeft = UIEdgeInsetsMake(50, 50, self.view.bounds.size.height * 0.7, self.view.bounds.size.width * 0.7);
    UIView *topLeftView = [[UIView alloc]init];
    topLeftView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:topLeftView];
    [topLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(topLeft);
    }];
    [self addContentLabelWithContent:@"TopLeftView" inView:topLeftView];

    UIView *topMiddleView = [[UIView alloc]init];
    topMiddleView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:topMiddleView];
    [topMiddleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topLeftView.mas_centerY);
        make.left.equalTo(topLeftView.mas_right).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(topLeftView);
    }];
    [self addContentLabelWithContent:@"TopMiddleView" inView:topMiddleView];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topMiddleView);
        make.bottom.equalTo(self.view).with.offset(-10);
        make.size.equalTo(topMiddleView);
    }];
    [self addContentLabelWithContent:@"BottomView" inView:bottomView];
}

- (void)addContentLabelWithContent:(NSString *)content inView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]init];
    label.text = content;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}


@end
