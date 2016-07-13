//
//  T24CategoryStoriesPaging.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface T24CategoryStoriesPaging : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double current;
@property (nonatomic, assign) double items;
@property (nonatomic, assign) double limit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
