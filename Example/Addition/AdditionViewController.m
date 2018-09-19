//
//  AdditionViewController.m
//  Addition
//
//  Created by 蔡成汉 on 11/19/2015.
//  Copyright (c) 2015 蔡成汉. All rights reserved.
//

#import "AdditionViewController.h"
#import "UIImage+Addition.h"
#import "UIView+Addition.h"
#import "NSDictionary+Addition.h"
#import "NSMutableDictionary+Addition.h"
#import "NSString+Addition.h"
#import "NSDate+Addition.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"开始");
    [UIImage fuzzyImage:[UIImage imageNamed:@"11002.jpeg"] size:CGSizeMake(320, 480) complete:^(UIImage *fuzzyImage) {
        NSLog(@"结束");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
