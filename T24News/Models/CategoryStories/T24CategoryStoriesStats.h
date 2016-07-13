//
//  T24CategoryStoriesStats.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface T24CategoryStoriesStats : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double shares;
@property (nonatomic, assign) double likes;
@property (nonatomic, assign) double interactions;
@property (nonatomic, assign) double reads;
@property (nonatomic, assign) double pageviews;
@property (nonatomic, assign) double comments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
