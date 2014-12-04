//
//  NSRRequestParameters.h
//  NSRails
//
//  Created by Michel Benevento on 09-12-13.
//  Copyright (c) 2013 YAWA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlEncode)

- (NSString *)urlEncode;
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

@end


@interface NSRRequestParameters : NSObject

@property (nonatomic, strong) NSDictionary *parameters;

-(id)initWithValues:(NSArray *)values forKeys:(NSArray *)keys;
-(NSDictionary *)requestDictionary;

@end
