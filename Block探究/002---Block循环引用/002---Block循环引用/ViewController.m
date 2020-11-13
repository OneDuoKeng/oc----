//
//  ViewController.m
//  002---Block循环引用
//
//  Created by Cooci on 2018/6/24.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"

typedef void(^KCBlock)(ViewController *);
@interface ViewController ()
@property (nonatomic, copy) KCBlock block;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 循环引用
    self.name = @"lg_cooci";

    // self -> block -> vc = nil -> self
    // 弱引用表 是同一个指针地址
    // weakSelf 是否会对引用计数处理? 留给自己分析 1
    // 循环引用的解决方式
    // weak-strong-dance 强弱共舞
    // 中介者模式 自动 手动
    // block -> vc - block 三层block
    // proxy 预习
    // self -> block -> self - 通讯
    self.block = ^(ViewController *vc){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",vc.name);
        });
    };
    self.block(self);
    
    // block 

}

//- (void)blockDemo{
//    __weak typeof(self) weakSelf = self;
//    self.block = ^(void){
//        // 时间 - 精力
//        // self 的生命周期
//        __strong __typeof(weakSelf)strongSelf = weakSelf; // 可以释放 when
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",strongSelf.name);
//        });
//    };
//    self.block();
//
//    __block ViewController *vc = self;
//    self.block = ^(void){
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",vc.name);
//            vc = nil;
//        });
//    };
//    self.block();
//}

- (void)dealloc{
    NSLog(@"dealloc 来了");
}

@end
