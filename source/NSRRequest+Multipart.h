//
//  NSRRequest+Multipart.h
//  Mealmatic
//
//  Created by Michel Benevento on 26-02-14.
//  Copyright (c) 2014 YAWA. All rights reserved.
//

#import "NSRRequest.h"

@interface NSRRequest (Multipart)

-(void)addAttachment:(NSData *)data fileName:(NSString *)fileName fieldName:(NSString *)fieldName mimeType:(NSString *)mimeType;

@end
