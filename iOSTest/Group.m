//
//  Group.m
//  iOSTest
//
//  Created by vasi on 8/18/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import "Group.h"
#import "Contact.h"

@implementation Group
- (id)initWithJSONObject:(id)JSONObject {
    self = [self init];
    if (self) {
        self.people=[NSMutableArray new];
        [self updateWithJSONObject:JSONObject];
    }
    return self;
}

- (void)updateWithJSONObject:(id)JSONObject
{
    
    _groupName = [JSONObject valueForKey:@"groupName"];
    NSLog(@"%@",_groupName);
    
    NSArray * arrayPeople=[JSONObject valueForKey:@"people"];
    for (id obj in arrayPeople) {
        Contact * contact=[[Contact alloc]initWithJSONObject:obj];
        [self.people addObject:contact];
    }
}

@end
