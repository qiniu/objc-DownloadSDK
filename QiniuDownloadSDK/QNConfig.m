//
//  QNConfig.m
//  QiniuDownloadSDK
//
//  Created by ltz on 10/19/15.
//  Copyright © 2015 Qiniu. All rights reserved.
//

#import "QNConfig.h"

@implementation QNConfig


- (id) init {
    
    self = [super init];
    _dns = [[QNDnsManager alloc] init];
    _statsHost = @"http://reportqos.qiniuapi.com";
    _pushStatIntervalS = 60;

    return self;
}

@end
