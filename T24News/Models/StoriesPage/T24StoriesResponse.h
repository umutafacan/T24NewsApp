//
//  T24StoriesResponse.h
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class T24StoriesPaging;

@interface T24StoriesResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL result;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) T24StoriesPaging *paging;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
