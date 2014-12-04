//
//  NSRRemoteObject+Parameters.m
//  NSRails
//
//  Created by Michel Benevento on 09-12-13.
//  Copyright (c) 2013 YAWA. All rights reserved.
//

#import "NSRRemoteObject+Parameters.h"

@implementation NSRRemoteObject (Parameters)

+ (void) remoteAllWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock
{
    NSRRequest *request = [NSRRequest requestToFetchAllObjectsOfClass:self viaObject:obj];
    [request setQueryParameters:params.requestDictionary];
    [request sendAsynchronous: ^(id result, NSError *error)
     {
         if (completionBlock)
             completionBlock([self objectsWithRemoteDictionaries:result],error);
     }];
}

+ (void) remoteAllWithParameters:(NSRRequestParameters *)params async:(NSRFetchAllCompletionBlock)completionBlock
{
    [self remoteAllWithParametersViaObject:nil params:params async:completionBlock];
}

+ (NSArray *) remoteAllWithParametersViaObject:(NSRRemoteObject *)obj params:(NSRRequestParameters *)params error:(NSError *__autoreleasing *)error
{
    NSRRequest *request = [NSRRequest requestToFetchAllObjectsOfClass:self viaObject:obj];
    [request setQueryParameters:params.requestDictionary];
    id json = [request sendSynchronous:error];
	return [self objectsWithRemoteDictionaries:json];
}

+ (NSArray *) remoteAllWithParameters:(NSRRequestParameters *)params error:(NSError *__autoreleasing *)error
{
    return [self remoteAllWithParametersViaObject:nil params:params error:error];
}

@end
