//
//  RequestManager.h
//  iOSTest
//
//  Created by vasi on 8/15/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestResponse.h"


@interface RequestManager : NSObject
+ (RequestManager *)sharedInstance ;
-(void)callService:(void(^)(RequestResponse *response))block;

@end
