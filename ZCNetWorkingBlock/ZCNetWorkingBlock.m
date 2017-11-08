//
//  ZCNetWorkingBlock.m
//  ZCNetWorkingBlock
//
//  Created by 曾超 on 17/11/8.
//  Copyright © 2017年 曾超. All rights reserved.
//

#import "ZCNetWorkingBlock.h"

@interface ZCNetWorkingBlock()

@end

@implementation ZCNetWorkingBlock

+(instancetype)manager{
    
    return [[self alloc]init];
    
}

-(instancetype)init{
    self = [super init ];
    if (self) {
        AFNetworkReachabilityManager * man=[AFNetworkReachabilityManager manager];
        [man startMonitoring];
        [man setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"当前使用4G");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"不可以使用wifi");
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"可以使用wifi");
                case AFNetworkReachabilityStatusUnknown:
                    NSLog(@"网络位置");
                default:
                    break;
            }
        }];
    }
    return self;
}

-(void)requestWithURLString:(NSString *)URLString parameters:(id)parameters type:(HttpRequestType)type success:(void (^)(id))success file:(void (^)(NSError *))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
            
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if(success){
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
    }
}

@end
