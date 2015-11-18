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
    
    UIImageView *tpImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    tpImageView.backgroundColor = [UIColor clearColor];
    tpImageView.image = [UIImage imageNamed:@"1.jpg"];
    tpImageView.clipsToBounds = YES;
    tpImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:tpImageView];
    
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 250, 100, 100)];
    myImageView1.backgroundColor = [UIColor getImageColor:[UIImage imageNamed:@"1.jpg"]];
    [self.view addSubview:myImageView1];
    
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(150, 250, 100, 100)];
    myImageView2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
    [self.view addSubview:myImageView2];
}

-(void)UIApplicationWillEnterForegroundNotification:(NSNotification *)fication
{
    
}

-(void)dealloc
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
