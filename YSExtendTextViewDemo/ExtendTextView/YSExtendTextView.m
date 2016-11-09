//
//  YSExtendTextView.m
//  YSExtendTextViewDemo
//
//  Created by zys on 2016/11/3.
//  Copyright © 2016年 张永帅. All rights reserved.
//

#import "YSExtendTextView.h"

#define kTextViewFont [UIFont systemFontOfSize:14]

@interface YSExtendTextView () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, assign) BOOL isExtending;// 是否正在延伸

@end

@implementation YSExtendTextView
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (CGRectEqualToRect(self.frame, CGRectZero)) {
        self.frame = newSuperview.bounds;
    }
    [self configureTextViewFrame];
}

- (void)dealloc {
    [self removeObservers];
}

#pragma mark - configure
- (void)configure {
    self.isExtending = YES;
    self.extendDirection = YSTextViewExtendFromCenter;
    self.backgroundColor = [UIColor clearColor];
    [self addObservers];
}

#pragma mark - kvo
- (void)addObservers {
    [self.textView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeObservers {
    [self.textView removeObserver:self forKeyPath:@"contentSize"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        [self configureTextViewFrame];
    }
}

#pragma mark - configureTextViewFrame
- (void)configureTextViewFrame {
    if (self.textView.contentSize.height < self.bounds.size.height) {
        CGRect rect = self.bounds;
        switch (self.extendDirection) {
            case YSTextViewExtendFromCenter:
                rect.origin.y = (rect.size.height - self.textView.contentSize.height) / 2.f;
                break;
            case YSTextViewExtendFromTop:
                rect.origin.y = 0;
                break;
            case YSTextViewExtendFromBottom:
                rect.origin.y = rect.size.height - self.textView.contentSize.height;
                break;
        }
        rect.size.height = self.textView.contentSize.height;
        self.textView.frame = rect;
    } else {
        self.textView.frame = self.bounds;
        self.isExtending = NO;
    }
    CGRect textBounds = self.textView.bounds;
    textBounds.origin.x += 5.f;
    self.placeholderLabel.frame = textBounds;
}

#pragma getters
- (UITextView *)textView {
    if (!_textView) {
        _textView = [UITextView new];
        [self addSubview:_textView];
        _textView.delegate = self;
        _textView.font = kTextViewFont;
        _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textView.layer.borderWidth = 1.f;
        _textView.layer.cornerRadius = 4.f;
    }
    return _textView;
}

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [UILabel new];
        [self.textView addSubview:_placeholderLabel];
        _placeholderLabel.font = kTextViewFont;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
    }
    return _placeholderLabel;
}

#pragma mark - setters
- (void)setPlaceholder:(NSString *)placeholder {
    if (placeholder && placeholder.length > 0) {
        _placeholder = [placeholder copy];
        self.placeholderLabel.text = placeholder;
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length <= 0 && self.placeholder.length > 0) {
        self.placeholderLabel.text = self.placeholder;
    } else {
        self.placeholderLabel.text = @"";
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.isExtending) {
        // 防止换行时抖动
        scrollView.contentOffset = CGPointZero;
    }
}

@end
