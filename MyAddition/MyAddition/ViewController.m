//
//  ViewController.m
//  MyAddition
//
//  Created by 蔡成汉 on 15/5/7.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "ViewController.h"
#import "AdditionFrameworks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //170开始的虚拟运营商手机号
    NSString *st = @"17021096235";
    BOOL isPhoneNum = [NSString mobileIsLegal:st];
    if (isPhoneNum == YES)
    {
        //手机号
        NSLog(@"为手机号");
    }
    else
    {
        //非手机号
        NSLog(@"非手机号");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
