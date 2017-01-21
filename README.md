# 支付时候弹出倒计时活动指示器对话框,自定义倒计时时间且支持回调。


#使用pod指令把类库添加到项目中:
```
   pod  'EBTPayActivityTimerView'
```







#调用代码:

 [EBTPayActivityWithTimerView showPayActivityAlertViewWithTimer:10 withAlertViewCompleteHandler:^{
        
        NSLog(@"支付活动指示器弹框即将移除");
    }];

#效果演示图

![Image](https://github.com/KBvsMJ/EBTPayActivityWithTimerView/blob/master/demogif/demo.gif)
