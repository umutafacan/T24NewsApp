//
//  T24StoriesData.h
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class T24StoriesUrls, T24StoriesCategory, T24StoriesStats, T24StoriesImages;

@interface T24StoriesData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *excerpt;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) T24StoriesUrls *urls;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) T24StoriesCategory *category;
@property (nonatomic, strong) T24StoriesStats *stats;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) T24StoriesImages *images;
@property (nonatomic, strong) NSString *publishingDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
