//
//  ViewController.m
//  YSExtendTextViewDemo
//
//  Created by zys on 2016/11/7.
//  Copyright © 2016年 张永帅. All rights reserved.
//

#import "ViewController.h"
#import "YSExtendTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [self.view addSubview:contentView];
    contentView.backgroundColor = [UIColor lightGrayColor];
    
    YSExtendTextView *textView = [YSExtendTextView new];
    textView.frame = CGRectMake(15, 5, 170, 90);
    textView.extendDirection = YSTextViewExtendFromTop;
    textView.placeholder = @"请输入文字～";
    [contentView addSubview:textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
