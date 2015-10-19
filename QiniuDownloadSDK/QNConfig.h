//
//  QNConfig.h
//  QiniuDownloadSDK
//
//  Created by ltz on 10/19/15.
//  Copyright © 2015 Qiniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HappyDNS.h"


@interface QNConfig : NSObject

- (id) init;

@property int pushStatIntervalS;
@property (nonatomic) NSString *statsHost;
@property (nonatomic) QNDnsManager *dns;

@end
