# YSExtendTextView
YSExtendTextView是一款可以根据内容高度自动调整高度的输入框控件。主要应用场景：UITableViewCell里做输入框使用。
用法示例：
```
// contentView模拟UITableViewCell的contentView
UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [self.view addSubview:contentView];
    contentView.backgroundColor = [UIColor lightGrayColor];
    
    YSExtendTextView *textView = [YSExtendTextView new];
    textView.frame = CGRectMake(15, 5, 170, 90);
    textView.extendDirection = YSTextViewExtendDirectionDownside;// 输入框延伸方向（默认是从中间向两边）
    textView.placeholder = @"请输入文字～";
    [contentView addSubview:textView];
```

