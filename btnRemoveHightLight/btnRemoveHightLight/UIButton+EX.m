//
//  UIButton+EX.m
//  分类 运行时实现自定义控件集合
//
//  Created by tang on 15/8/9.
//  Copyright (c) 2015年 company. All rights reserved.
//

#import "UIButton+EX.h"
#import <objc/runtime.h>

@implementation UIButton (EX)


//实现方法替换 交换实例方法 在image中有交换类方法
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class needClass=[self class];
        
        //取得将要替换的两个方法
        SEL originalSelect=@selector(setHighlighted:);
        SEL currentSelector=@selector(ry_setHightLight:);
        Method originalMethod=class_getInstanceMethod(needClass,originalSelect);
        Method currentMethod=class_getInstanceMethod(needClass ,currentSelector);
        
        BOOL success=class_addMethod(needClass, originalSelect, method_getImplementation(currentMethod), method_getTypeEncoding(currentMethod));
        
        if (success) {
            class_replaceMethod(needClass, currentSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else
        {
            method_exchangeImplementations(originalMethod, currentMethod);
        }
        
        
        
        
        
        
    });
    
}
//+(void)initialize
//{
//    
//}

//将要替换的方法
-(void)ry_setHightLight:(BOOL)highlighted
{
    if(!self.removeHightLight)
    {
        [self ry_setHightLight:highlighted];
    }
}


-(void)setRemoveHightLight:(BOOL)removeHightLight
{
    objc_setAssociatedObject(self, @"removeHightLight", @(removeHightLight), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)removeHightLight
{
    return [objc_getAssociatedObject(self, @"removeHightLight") boolValue];
}








@end
