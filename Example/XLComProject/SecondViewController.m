//
//  SecondViewController.m
//  XLComProject
//
//  Created by GDXL2012 on 2019/11/22.
//  Copyright © 2019 GDXL2012. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *dataTime = @"14";
    NSDate *date1 = [NSDate date];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
//    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    [formatter1 setDateFormat:@"YYYY-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
    [formatter1 setTimeZone:timeZone];
    //当前时间
    NSString *DateTime1 = [formatter1 stringFromDate:date1];
    NSDate *tempDate = [formatter1 dateFromString:DateTime1];//将字符串转换为时间对象
    NSTimeInterval tmp =[tempDate timeIntervalSince1970]*1000;
    long long timestamp = tmp - (long long)([dataTime intValue] - 1)*24*60*60*1000;
    //当前时间减消息时间 大于约定的存储时间 则不入库
    NSDate *date2 = [NSDate date];
    NSTimeInterval tmp2 =[date2 timeIntervalSince1970]*1000;
    if (timestamp >= tmp2){
        //return;
    }
}


@end
