//
//  T24CategoryStoriesData.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class T24CategoryStoriesUrls, T24CategoryStoriesCategory, T24CategoryStoriesStats, T24CategoryStoriesImages;

@interface T24CategoryStoriesData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *excerpt;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) T24CategoryStoriesUrls *urls;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) T24CategoryStoriesCategory *category;
@property (nonatomic, strong) T24CategoryStoriesStats *stats;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) T24CategoryStoriesImages *images;
@property (nonatomic, strong) NSString *publishingDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
