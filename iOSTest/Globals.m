//
//  Globals.m
//  iOSTest
//
//  Created by vasi on 8/18/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import "Globals.h"

@implementation Globals

@end
NSArray *ArrayFromJSONObject(id object) {
    return object == [NSNull null] ? nil : (NSArray *)object;
}
