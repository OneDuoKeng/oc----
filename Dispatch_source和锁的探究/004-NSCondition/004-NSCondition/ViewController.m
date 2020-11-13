//
//  ViewController.m
//  004-NSCondition
//
//  Created by Cooci on 2019/2/27.
//  Copyright © 2019 Cooci. All rights reserved.
//

#import "ViewController.h"
#import "MyLock.h"

@interface ViewController ()
@property (nonatomic, assign) NSUInteger ticketCount;
@property (nonatomic, strong) NSCondition *testCondition;
@property (nonatomic, strong) MyLock *myLock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ticketCount = 0;
    self.myLock = [[MyLock alloc] init];
    [self lg_testConditonLock];
}

#pragma mark -- NSCondition

- (void)lg_testConditon{
    
    _testCondition = [[NSCondition alloc] init];
    //创建生产-消费者
    for (int i = 0; i < 50; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self lg_producer];
        });
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self lg_consumer];
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self lg_consumer];
        });
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self lg_producer];
        });
    }
}

- (void)lg_producer{
    [_testCondition lock]; // 操作的多线程影响
    self.ticketCount = self.ticketCount + 1;
    NSLog(@"生产一个 现有 count %zd",self.ticketCount);
    [_testCondition signal]; // 信号
    [_testCondition unlock];
}

- (void)lg_consumer{
 
     [_testCondition lock];  // 操作的多线程影响
    if (self.ticketCount == 0) {
        NSLog(@"等待 count %zd",self.ticketCount);
        [_testCondition wait];
    }
    //注意消费行为，要在等待条件判断之后
    self.ticketCount -= 1;
    NSLog(@"消费一个 还剩 count %zd ",self.ticketCount);
     [_testCondition unlock];
}

// swift NSlock
// 条件变量
// 条件锁 有什么关系
// 汇编 - arm64 底层
// 要明白 你想探索的是什么  NSConditionLock -> NSCondition 封装 -> pthread

#pragma mark -- NSConditionLock
- (void)lg_testConditonLock{
    // 信号量
    NSConditionLock *conditionLock = [[NSConditionLock alloc] initWithCondition:2];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
         [conditionLock lockWhenCondition:1]; // conditoion = 1 内部 Condition 匹配
        // -[NSConditionLock lockWhenCondition: beforeDate:]
        NSLog(@"线程 1");
         [conditionLock unlockWithCondition:0];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
       
        [conditionLock lockWhenCondition:2];
        sleep(0.1);
        NSLog(@"线程 2");
        // self.myLock.value = 1;
        [conditionLock unlockWithCondition:1]; // _value = 2 -> 1
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
       [conditionLock lock];
       NSLog(@"线程 3");
       [conditionLock unlock];
    });
}



@end
