//
//  Contact.h
//  iOSTest
//
//  Created by vasi on 8/15/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
@property (nonatomic,copy ) NSString * firstName;
@property (nonatomic,copy ) NSString * lastName;
@property (nonatomic,copy ) NSString * statusIcon;
@property (nonatomic,copy ) NSString * statusMessage;
- (id)initWithJSONObject:(id)JSONObject ;

@end
