//
//  NSRRemoteObject+Parameters.m
//  NSRails
//
//  Created by Michel Benevento on 09-12-13.
//  Copyright (c) 2013 YAWA. All rights reserved.
//

#import "NSRRemoteObject+Parameters.h"

@implementation NSRRemoteObject (Parameters)

+ (void) remoteObjectWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock
{
    NSRRequest *request = [NSRRequest requestToFetchAllObjectsOfClass:self viaObject:obj];
    [request setQueryParameters:params.requestDictionary];
    [request sendAsynchronous: ^(id result, NSError *error)
     {
         if (completionBlock)
             completionBlock([self objectsWithRemoteDictionaries:result],error);
     }];
}

+ (void) remoteObjectWithParameters:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock
{
    [self remoteObjectWithParametersViaObject:nil params:params async:completionBlock];
}

+ (NSArray *) remoteObjectWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params error:(NSError *__autoreleasing *)error
{
    NSRRequest *request = [NSRRequest requestToFetchAllObjectsOfClass:self viaObject:obj];
    [request setQueryParameters:params.requestDictionary];
    id json = [request sendSynchronous:error];
	return [self objectsWithRemoteDictionaries:json];
}

+(NSArray *)remoteObjectWithParameters:(NSRRequestParameters *)params error:(NSError *__autoreleasing *)error
{
    return [self remoteObjectWithParametersViaObject:nil params:params error:error];
}

@end
