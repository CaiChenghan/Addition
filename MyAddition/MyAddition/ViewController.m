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

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(UIApplicationWillEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *contentString = @"舜发于畎亩之中，傅说举于版筑之中，胶鬲举于鱼盐之中，管夷吾举于士，孙叔敖举于海，百里奚举于市。故天将降大任于斯人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身，行拂乱其所为，所以动心忍性，曾益其所不能。人恒过，然后能改；困于心，衡于虑，而后作；征于色，发于声，而后喻。入则无法家拂士，出则无敌国外患者，国恒亡。然后知生于忧患，而死于安乐也。";
    
    CGSize tpSize = [NSString getStringSize:[UIFont systemFontOfSize:18] size:CGSizeMake(200, 100) content:contentString];
    NSLog(@"%@",NSStringFromCGSize(tpSize));
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, tpSize.width , tpSize.height)];
    myLabel.backgroundColor = [UIColor greenColor];
    myLabel.textAlignment = NSTextAlignmentLeft;
    myLabel.font = [UIFont systemFontOfSize:18];
    myLabel.numberOfLines = 0;
    myLabel.text = contentString;
    [self.view addSubview:myLabel];
}

-(void)UIApplicationWillEnterForegroundNotification:(NSNotification *)fication
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
