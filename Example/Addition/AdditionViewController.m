//
//  AdditionViewController.m
//  Addition
//
//  Created by 蔡成汉 on 11/19/2015.
//  Copyright (c) 2015 蔡成汉. All rights reserved.
//

#import "AdditionViewController.h"
#import "AdditionFrameworks.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *tpImage = [UIImage imageWithColor:[UIColor greenColor]];
    UIImageView *tpImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    tpImageView.image = tpImage;
    [self.view addSubview:tpImageView];
    
    
    /**
     *  将需要操作的字典转换为可变字典
     */
    NSMutableDictionary *tpDic = [NSMutableDictionary dictionary];
    [tpDic setMyObject:@"123" forKey:@"123"];
    
    NSDictionary *myDic = [NSDictionary dictionary];
    
    /**
     *  字典克隆字典
     */
    [tpDic addEntriesFromDictionary:myDic];
    
    [tpDic setMyObject:@"456" forKey:@"456"];
    
    NSString *timeString = [NSDate getCurrentDate];
    NSLog(@"%@",timeString);
    
    NSString *tpString = [NSDate getCurrentTime];
    NSLog(@"%@",tpString);
    
    [NSDate getSepTime:[timeString integerValue] endTime:1467198000 complete:^(NSString *sepTime, NSString *hour, NSString *minute, NSString *second) {
        NSLog(@"获取完成:%@",sepTime);
    }];
//    [NSDate getSepTimeWithDay:[timeString integerValue] endTime:1467422400 complete:^(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second) {
//        NSLog(@"获取完成");
//    }];
    [NSDate getSepTimeWithDay:3 startTime:[timeString integerValue] endTime:1467422400 complete:^(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second) {
        NSLog(@"获取完成:%@",sepTime);
    }];
    
    NSString *string = @"http://www.baidu.com/";
    string = [string encodeURLString];
    NSLog(@"%@",string);
    string = [string decodeURLString];
    NSLog(@"%@",string);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
