# 支付时候弹出倒计时活动指示器对话框,自定义倒计时时间且支持回调。


#使用说明:
1---> 需要把文件夹名称为‘EBTPayActivityView’里面的所有文件添加到项目中。

2---> 添加后在引用一下,#import "EBTPayActivityWithTimerView.h"

3--->通过类方法直接调用

#调用代码:

 [EBTPayActivityWithTimerView showPayActivityAlertViewWithTimer:10 withAlertViewCompleteHandler:^{
        
        NSLog(@"支付活动指示器弹框即将移除");
    }];

#效果演示图

![Image](https://github.com/KBvsMJ/EBTPayActivityWithTimerView/blob/master/demogif/demo.gif)
