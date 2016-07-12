//
//  T24StoriesPaging.h
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface T24StoriesPaging : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double current;
@property (nonatomic, assign) double items;
@property (nonatomic, assign) double limit;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
