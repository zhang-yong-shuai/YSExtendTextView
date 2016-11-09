//
//  YSExtendTextView.h
//  YSExtendTextViewDemo
//
//  Created by zys on 2016/11/3.
//  Copyright © 2016年 张永帅. All rights reserved.
//

/**
 *  自动换行的文本编辑框
 *  三种延伸方式：向下、向上、向两侧，默认向两侧
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YSTextViewExtendDirection) {
    YSTextViewExtendFromCenter = 0,// 从中间向上下延伸
    YSTextViewExtendFromTop,       // 从顶部向下延伸
    YSTextViewExtendFromBottom,    // 从底部向上延伸
    
};

@interface YSExtendTextView : UIView

@property (nonatomic, assign) YSTextViewExtendDirection extendDirection;
@property (nonatomic, copy) NSString *placeholder;

@end
