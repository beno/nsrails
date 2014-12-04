//
//  NSRRequest+Multipart.m
//  Mealmatic
//
//  Created by Michel Benevento on 26-02-14.
//  Copyright (c) 2014 YAWA. All rights reserved.
//

#import "NSRRequest+Multipart.h"

@implementation NSRRequest (Multipart)

-(void)addAttachment:(NSData *)data fileName:(NSString *)fileName fieldName:(NSString *)fieldName mimeType:(NSString *)mimeType
{
    NSString *boundary = [@"=====:" stringByAppendingString:[[NSUUID UUID] UUIDString]];
    NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, boundary];
    [self setAdditionalHTTPHeaders:@{@"Content-Type": contentType}];

    NSMutableData *body = [NSMutableData new];

    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\nContent-Transfer-Encoding: binary\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    self.body = body;

}

@end
