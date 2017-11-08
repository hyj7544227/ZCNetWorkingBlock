//
//  ViewController.m
//  ZCNetWorkingBlock
//
//  Created by 曾超 on 17/11/8.
//  Copyright © 2017年 曾超. All rights reserved.
//

#import "ViewController.h"
#import "ZCNetWorkingBlock.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZCNetWorkingBlock *block1 = [[ZCNetWorkingBlock alloc]init];
    [block1 requestWithURLString:@"" parameters:@"" type:0 success:^(id responseObj) {
        NSString *string = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableContainers error:nil];
    } file:^(NSError *error) {
        NSLog(@"lalala");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
