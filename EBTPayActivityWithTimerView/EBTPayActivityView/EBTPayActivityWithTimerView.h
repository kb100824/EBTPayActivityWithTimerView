//
//  EBTPayActivityWithTimerView.h
//  EBTPayActivityWithTimerView
//
//  Created by ebaotong on 16/7/12.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

 typedef void(^EBTPayActivityWithTimerViewCompleteHandler)();

@interface EBTPayActivityWithTimerView : UIView
{
    EBTPayActivityWithTimerViewCompleteHandler  activityCompleteHandler;
}
/**
 *  显示倒计时支付活动指示器
 *
 *  @param timerCountDown           倒计时时间
 *  @param alertViewCompleteHandler 参数回调
 */
+ (void)showPayActivityAlertViewWithTimer:(NSInteger)timerCountDown withAlertViewCompleteHandler:(EBTPayActivityWithTimerViewCompleteHandler)alertViewCompleteHandler;

@end
