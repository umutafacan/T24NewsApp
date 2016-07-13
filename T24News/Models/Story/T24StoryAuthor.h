//
//  T24StoryAuthor.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class T24StoryImages;

@interface T24StoryAuthor : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id name;
@property (nonatomic, assign) id alias;
@property (nonatomic, strong) T24StoryImages *images;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
