//
//  ZCNetWorkingBlock.h
//  ZCNetWorkingBlock
//
//  Created by 曾超 on 17/11/8.
//  Copyright © 2017年 曾超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSUInteger ,HttpRequestType){
    
    //get请求
    HttpRequestTypeGet = 0,
    
    //post请求
    HttpRequestTypePost 
};

@interface ZCNetWorkingBlock : NSObject

+(instancetype)manager;

-(void)requestWithURLString:(NSString *)URLString parameters:(id )parameters type:(HttpRequestType )type success:(void(^)(id responseObj))success file:(void(^)(NSError *error))failure;

@end
