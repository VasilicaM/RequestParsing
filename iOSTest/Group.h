//
//  Group.h
//  iOSTest
//
//  Created by vasi on 8/18/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic,copy) NSString * groupName;
@property (nonatomic,strong) NSMutableArray * people;
- (id)initWithJSONObject:(id)JSONObject ;

@end
