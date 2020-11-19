//
//  LGPerson.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import "LGPerson.h"


@interface LGPerson ()
@property (nonatomic, copy) NSString *ext_name;
@property (nonatomic, assign) int ext_age;

- (void)ext_instanceMethod;

+ (void)ext_sayClassMethod;

@end

@implementation LGPerson

- (void)ext_instanceMethod
{
    NSLog(@"%s",__func__);
}

+ (void)ext_sayClassMethod
{
    NSLog(@"%s",__func__);
}

- (void)kc_instanceMethod3{
    NSLog(@"%s",__func__);
}

- (void)kc_instanceMethod1{
    NSLog(@"%s",__func__);
}

- (void)kc_instanceMethod2{
    NSLog(@"%s",__func__);
}


+ (void)kc_sayClassMethod{
    NSLog(@"%s",__func__);
}


@end
