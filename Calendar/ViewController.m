//
//  ViewController.m
//  Calendar
//
//  Created by CiHon-IOS2 on 16/9/20.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ViewController.h"
#import "CheckViewController.h"
@interface ViewController ()

@property(nonatomic,strong)UIButton *nextBtn;

@end

@implementation ViewController

-(UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.frame = CGRectMake(100, 100, 100, 30);
        [_nextBtn setTitle:@"click" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    [self.view addSubview:self.nextBtn];
    
    
    
}

-(void)next:(UIButton *)sender
{
    
    [self.navigationController pushViewController:[CheckViewController new] animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
