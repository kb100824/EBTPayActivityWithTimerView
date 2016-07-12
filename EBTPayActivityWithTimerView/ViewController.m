//
//  ViewController.m
//  EBTPayActivityWithTimerView
//
//  Created by ebaotong on 16/7/12.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTPayActivityWithTimerView.h"
@interface ViewController ()

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
- (IBAction)showAlertView:(UIButton *)sender {
    
    
    [EBTPayActivityWithTimerView showPayActivityAlertViewWithTimer:10 withAlertViewCompleteHandler:^{
        
        NSLog(@"teysty");
    }];
    
    
}

@end
