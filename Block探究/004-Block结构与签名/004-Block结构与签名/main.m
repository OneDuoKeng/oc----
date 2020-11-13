//
//  main.m
//  004-Block结构与签名
//
//  Created by Cooci on 2019/7/3.
//  Copyright © 2019 Cooci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        // Block -> LG_Cooci
        // bref  结构体 拷贝 对象
        // bref  结构体 内存平移 -> lg_name
        __block NSString *lg_name = [NSString stringWithFormat:@"cooci"];
        void (^block1)(void) = ^{ // block_copy
            lg_name = @"LG_Cooci";
            NSLog(@"LG_Block - %@",lg_name);
            
            // block 内存
        };
        block1();

    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
