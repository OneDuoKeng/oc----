//
//  ViewController.m
//  006---GCD最大并发数
//
//  Created by Cooci on 2018/7/11.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    //任务1
    dispatch_async(queue, ^{
        NSLog(@"执行任务1");
        sleep(1);
        NSLog(@"任务1完成");
    });
    
    //任务2
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
        sleep(1);
        NSLog(@"任务2完成");
    });
    
    //任务3
    dispatch_async(queue, ^{
        NSLog(@"执行任务3");
        sleep(1);
        NSLog(@"任务3完成");
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
