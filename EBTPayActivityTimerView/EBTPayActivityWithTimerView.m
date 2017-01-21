//
//  EBTPayActivityWithTimerView.m
//  EBTPayActivityWithTimerView
//
//  Created by ebaotong on 16/7/12.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "EBTPayActivityWithTimerView.h"
#import "EBTPayActivityAlertView.h"
#define kWeakSelf(weakSelf)  __weak __typeof(self)weakSelf = self
//主屏宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//主屏高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define  kPayActivityAlertViewSize  CGSizeMake(200,100)

@interface EBTPayActivityWithTimerView ()
{
    EBTPayActivityAlertView *payAlertView;
    NSInteger countDown;
}

@property(nonatomic,strong) NSTimer *alertViewTimer;

@end

@implementation EBTPayActivityWithTimerView

+ (EBTPayActivityWithTimerView *)sharedInstance{

    static  EBTPayActivityWithTimerView *payActivityTimerView = nil;
    static  dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        
        payActivityTimerView = [[EBTPayActivityWithTimerView alloc]init];
        
    });
    
    return payActivityTimerView;
}
- (instancetype)init{
    
    if (self = [super init]) {
        [self setUp];
    }
    return self;
    
    
    
}
- (void)setUp{
    
    self.backgroundColor = [UIColorFromRGB(0x91918f) colorWithAlphaComponent:0.5];
    self.frame = [UIScreen mainScreen].bounds;
}


- (NSTimer *)alertViewTimer{
    
    if (!_alertViewTimer) {
        _alertViewTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(onTimerClick:) userInfo:nil repeats:YES];
    }
    return _alertViewTimer;
    

}
-(void)onTimerClick:(NSTimer*)timer
{
    if (countDown<=0) {
        [[EBTPayActivityWithTimerView sharedInstance] dismissAlertView];
    }
    else
    {
        payAlertView.lbl_RemindDescript.text = [NSString stringWithFormat:@"支付处理中，请稍等\n倒计时(%lds)",countDown];
        countDown--;
        
    }
    
    
}
- (void)startCountDownTimer:(NSInteger)countTimers{
    
    countDown = countTimers;
    [[NSRunLoop mainRunLoop] addTimer:self.alertViewTimer forMode:NSRunLoopCommonModes];
    
}

- (void)stopCountDownTimer
{
    [self.alertViewTimer invalidate];
     self.alertViewTimer = nil;
    
    
}
- (void)dealloc{
    
    [self stopCountDownTimer];
}


/**
 *  弹出框
 */
- (void)showAlertView:(NSInteger)countTimers
{
    
    kWeakSelf(weakSelf);
    NSArray *xib_View = [[NSBundle mainBundle] loadNibNamed:@"EBTPayActivityAlertView" owner:self options:nil];
    payAlertView = [xib_View lastObject];
    payAlertView.frame = CGRectMake((SCREEN_WIDTH-kPayActivityAlertViewSize.width)/2.0, (SCREEN_HEIGHT-kPayActivityAlertViewSize.height)/2.0, kPayActivityAlertViewSize.width, kPayActivityAlertViewSize.height);
    [self addSubview:payAlertView];
    UIWindow *keyWindows = [UIApplication sharedApplication].keyWindow;
    [keyWindows addSubview:self];
    payAlertView.alpha = 0;
    payAlertView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.3 animations:^{
        [weakSelf startCountDownTimer:countTimers];
        payAlertView.alpha = 1.0;
        payAlertView.transform = CGAffineTransformMakeScale(1.f, 1.f);
        
        
        
    }];
    
    
}

/**
 *  移除指示器
 */
- (void)dismissAlertView{
    
    kWeakSelf(weakSelf);
    [UIView animateWithDuration:0.3f animations:^{
        payAlertView.alpha = 0;
        payAlertView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
        if (activityCompleteHandler) {
            activityCompleteHandler();
        }
        
    } completion:^(BOOL finished) {
        
        
        [weakSelf stopCountDownTimer];
        
        [weakSelf removeFromSuperview];
        
        
        
    }];
    
}
- (void)showPayAlertViewWithTimer:(NSInteger)timerCountDown withAlertViewCompleteHandler:(EBTPayActivityWithTimerViewCompleteHandler)alertViewCompleteHandler{
    
    activityCompleteHandler = alertViewCompleteHandler;
    [[EBTPayActivityWithTimerView sharedInstance] showAlertView:timerCountDown];
    
    
    
    
    
}

+ (void)showPayActivityAlertViewWithTimer:(NSInteger)timerCountDown withAlertViewCompleteHandler:(EBTPayActivityWithTimerViewCompleteHandler)alertViewCompleteHandler{

    
    [[EBTPayActivityWithTimerView sharedInstance] showPayAlertViewWithTimer:timerCountDown withAlertViewCompleteHandler:alertViewCompleteHandler];
    
    
    
}
@end
