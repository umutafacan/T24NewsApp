//
//  T24StoryData.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class T24StoryAuthor, T24StoryUrls, T24StoryCategory, T24StoryImages, T24StoryStats;

@interface T24StoryData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) T24StoryAuthor *author;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) T24StoryUrls *urls;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) T24StoryCategory *category;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) T24StoryImages *images;
@property (nonatomic, strong) NSString *excerpt;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) T24StoryStats *stats;
@property (nonatomic, strong) NSString *publishingDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
