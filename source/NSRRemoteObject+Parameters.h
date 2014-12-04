//
//  NSRRemoteObject+Parameters.h
//  NSRails
//
//  Created by Michel Benevento on 09-12-13.
//  Copyright (c) 2013 YAWA. All rights reserved.
//

#import "NSRRemoteObject.h"
#import "NSRRequest.h"
#import "NSRRequestParameters.h"

@interface NSRRemoteObject (Parameters)

+ (NSArray *) remoteObjectWithParameters:(NSRRequestParameters *)params error:(NSError **)error;
+ (NSArray *) remoteObjectWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params error:(NSError **)error;
+ (void) remoteObjectWithParameters:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock;
+ (void) remoteObjectWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock;

@end
