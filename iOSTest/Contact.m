//
//  Contact.m
//  iOSTest
//
//  Created by vasi on 8/15/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import "Contact.h"

@implementation Contact
- (id)initWithJSONObject:(id)JSONObject {
    self = [self init];
    if (self) {
        [self updateWithJSONObject:JSONObject];
    }
    return self;
}

- (void)updateWithJSONObject:(id)JSONObject
{
    
    _firstName = [JSONObject valueForKey:@"firstName"];
    NSLog(@"%@",_firstName);
    _lastName = [JSONObject valueForKey:@"lastName"];
    _statusIcon = [JSONObject valueForKey:@"statusIcon"];
    _statusMessage = [JSONObject valueForKey:@"statusMessage"];
    
}


@end
