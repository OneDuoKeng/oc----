//
//  ViewController.m
//  003-NSLock分析
//
//  Created by Cooci on 2019/2/27.
//  Copyright © 2019 Cooci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *testArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self lg_crash];
    [self lg_testRecursive];
    // NSLock 多 非常简单
//    NSLock *lock = [[NSLock alloc] init];
//    [lock lock];
//    [lock unlock];

    // @protocol NSLocking
    // 对下层 pthread 封装 GCD
}

#pragma mark -- NSLock

- (void)lg_crash{
    for (int i = 0; i < 200; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            _testArray = [NSMutableArray array];
        });
    }
}


#pragma mark -- NSRecursiveLock

- (void)lg_testRecursive{

    NSRecursiveLock *recursiveLock = [[NSRecursiveLock alloc] init];
    NSLock *lock = [[NSLock alloc] init];
    // 睡觉等待
    // 嵌套 - 递归
    // 问题 lock 加载哪里 ???
    // @sys - recursiveLock
    // NSlock
    //

    for (int i= 0; i<100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            static void (^testMethod)(int);
            testMethod = ^(int value){
                [recursiveLock lock];
                if (value > 0) {
                  NSLog(@"current value = %d",value);
                  testMethod(value - 1);
                }
                [recursiveLock unlock];
            };
            testMethod(10);
        });
    }
    
    // 多线程 - 单一线程 2 递归  + 3 4 5
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        static void (^testMethod)(int);
//        testMethod = ^(int value){
//            [recursiveLock lock];
//            if (value > 0) {
//              NSLog(@"current value = %d",value);
//              testMethod(value - 1);
//            }
//            [recursiveLock unlock];
//        };
//        testMethod(10);
//    });

}



@end
