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
    YSTextViewExtendDirectionBothsides = 0,// 向两侧延伸
    YSTextViewExtendDirectionUpside,       // 向上延伸
    YSTextViewExtendDirectionDownside      // 向下延伸
};

@interface YSExtendTextView : UIView

@property (nonatomic, assign) YSTextViewExtendDirection extendDirection;
@property (nonatomic, copy) NSString *placeholder;

@end
