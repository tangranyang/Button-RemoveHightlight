//
//  ViewController.m
//  btnRemoveHightLight
//
//  Created by tang on 15/8/17.
//  Copyright (c) 2015年 company. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EX.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn= [UIButton new];
    btn.backgroundColor=[UIColor grayColor];
    [btn setTitle:@"没有高亮的按钮" forState:UIControlStateNormal];
    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
    
    
    btn.removeHightLight=YES;
    
    btn.frame=CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:btn];
    
    
    
    
    
}



@end
