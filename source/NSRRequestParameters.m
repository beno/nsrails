//
//  NSRRequestParameters.m
//  NSRails
//
//  Created by Michel Benevento on 09-12-13.
//  Copyright (c) 2013 YAWA. All rights reserved.
//

#import "NSRRequestParameters.h"

@implementation NSString (UrlEncode)

- (NSString *)urlEncode
{
    return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end


@implementation NSRRequestParameters

-(id)initWithValues:(NSArray *)values forKeys:(NSArray *)keys
{
    if (self = [super init]) {
        [self setParameters:[NSDictionary dictionaryWithObjects:values forKeys:keys]];
    }
    return self;
}

-(NSDictionary *)requestDictionary
{
    NSMutableDictionary *encodedParams = [NSMutableDictionary dictionary];
    [self.parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *val, BOOL *stop) {
        [encodedParams setObject:val.urlEncode forKey:key];
    }];
    return encodedParams;
}

@end
