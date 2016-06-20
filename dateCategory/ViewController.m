//
//  ViewController.m
//  dateCategory
//
//  Created by Sky on 16/6/20.
//  Copyright © 2016年 Sky. All rights reserved.
//

#import "ViewController.h"
#import "GCDate/NSDate+GCDate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   NSLog(@"%@",[NSDate getStartOfMonth:[NSDate date]]);  //本月第一天
   NSLog(@"%@",[NSDate dateStartOfWeek:[NSDate date]]);  //本周一
    
   NSLog(@"%@",[NSDate getDateString:[NSDate date]]);  //获取当前时间戳
   NSLog(@"是否同一天 %@",[NSDate isOneDay:[NSDate getDateInteger:[NSDate date]] t2:[NSDate getDateInteger:[NSDate date]]-100000]?@"YES":@"NO");  //获取当前时间戳
    
    //获取各种时间格式
    for (int x = 0; x <= 10; x ++) {
        NSLog(@"%@",[NSDate convertUnixTime:[NSDate getDateInteger:[NSDate date]] timeType:x]);
    }
    
    //获取时间差
    NSLog(@"%@",[NSDate ttimeUptoNowFrom:[NSDate getDateInteger:[NSDate date]]-4000]);
    NSLog(@"%@",[NSDate ttimeUptoNowFrom:[NSDate getDateInteger:[NSDate date]]-40000]);
    NSLog(@"%@",[NSDate ttimeUptoNowFrom:[NSDate getDateInteger:[NSDate date]]-400000]);
    NSLog(@"%@",[NSDate ttimeUptoNowFrom:[NSDate getDateInteger:[NSDate date]]-4000000]);
    NSLog(@"%@",[NSDate ttimeUptoNowFrom:[NSDate getDateInteger:[NSDate date]]-40000000]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
