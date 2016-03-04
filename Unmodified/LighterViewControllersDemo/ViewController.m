//
//  ViewController.m
//  LighterViewControllersDemo
//
//  Created by shuu on 16/3/4.
//  Copyright © 2016年 shuu. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ContentView *content = [[ContentView alloc]initWithFrame:self.view.bounds];
    content.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:content];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
