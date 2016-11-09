//
//  ViewController.m
//  YSExtendTextViewDemo
//
//  Created by zys on 2016/11/7.
//  Copyright © 2016年 张永帅. All rights reserved.
//

#import "ViewController.h"
#import "YSExtendTextView.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"InputCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        // create textView
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        YSExtendTextView *textView = [YSExtendTextView new];
        textView.frame = CGRectMake(15.f, 5.f, screenWidth-30.f, 66.f-10.f);
        //textView.extendDirection = YSTextViewExtendFromTop;
        textView.placeholder = @"请输入文字～";
        [cell.contentView addSubview:textView];
    }
    return cell;
}

@end
