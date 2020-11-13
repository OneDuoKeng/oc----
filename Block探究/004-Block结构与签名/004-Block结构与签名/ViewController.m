//
//  ViewController.m
//  004-Block结构与签名
//
//  Created by Cooci on 2019/7/3.
//  Copyright © 2019 Cooci. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int a = 10;

    // 底层原理 对象 签名
    // global stack malloc
    // block调用
    
    void (^block1)(void) = ^{
        NSLog(@"LG_Block -");
    };
    block1();
}


@end
