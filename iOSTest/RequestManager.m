//
//  RequestManager.m
//  iOSTest
//
//  Created by vasi on 8/15/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

static RequestManager *sharedInstance = nil;

+ (RequestManager *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}
#define HTTP_TIMEOUT 30

-(void)callService:(void(^)(RequestResponse *response))block
{
    
    NSMutableURLRequest *URLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://downloadapp.youwow.me/iPhone/iOSTest/contacts.json"]];

    [URLRequest setTimeoutInterval:HTTP_TIMEOUT];

    NSLog(@"Headers: %@", [URLRequest allHTTPHeaderFields]);
    
    [URLRequest setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:URLRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *r, NSData *_data, NSError *_error){
        NSHTTPURLResponse * _response = (NSHTTPURLResponse*)r;
        RequestResponse * response=[RequestResponse new];
        response.responseCode=_response.statusCode;
        if ([_data length]) {
            NSString *JSONString = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
            response.jsonResponse=JSONString;
            response.object=[NSJSONSerialization JSONObjectWithData:_data options:0 error:NULL];
            NSLog(@"%@",JSONString);
        }
        block(response);
    }];
}

@end
