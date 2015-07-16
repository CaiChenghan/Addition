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
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    myImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myImageView];
    UIImage *image = [UIImage fuzzyImage:[UIImage imageNamed:@"1.jpg"]];
    myImageView.image = image;
    
    NSData *tpImageData = [UIImage compressMyImage:[UIImage imageNamed:@"2.jpg"]];
    NSLog(@"%ld",tpImageData.length/1000);
    
    //原始大小
    NSString *pathString = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"2.jpg"];
    NSData *imageData = [NSData dataWithContentsOfFile:pathString];
    NSLog(@"%ld",imageData.length/1000);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
