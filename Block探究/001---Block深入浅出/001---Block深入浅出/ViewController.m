//
//  ViewController.m
//  001---Block深入浅出
//
//  Created by Cooci on 2018/6/24.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"

typedef void(^KCBlock)(id data);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // block 函数 -
    // 类型 3种
    // <__NSGlobalBlock__: 0x1065fa088>
    // <__NSMallocBlock__: 0x600003305680>
    // <__NSStackBlock__: 0x7ffeec33f518>
    // 变动  block 捕获外界变量
    // 全局 - 访问外界变量 强引用 堆 - 栈
    int a = 10;
    void (^__weak block)(void) = ^{
        NSLog(@"Cooci - %d",a);
    };

    // block_copy
    NSLog(@"%@",block);
    
    // 内存平移的面试题
    // block 循环引用 - 循环引用的解决 __weak
    // block 捕获外界变量 - 底层原理
    // block copy dispose
    
    
}



@end
