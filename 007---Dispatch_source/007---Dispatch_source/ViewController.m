//
//  ViewController.m
//  007---Dispatch_source
//
//  Created by Cooci on 2018/8/28.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic, strong) dispatch_source_t source;
@property (nonatomic, strong) dispatch_queue_t queue;

@property (nonatomic, assign) NSUInteger totalComplete;
@property (nonatomic) BOOL isRunning;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.totalComplete = 0;
    
    
}


- (IBAction)didClickStartOrPauseAction:(id)sender {
   
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
