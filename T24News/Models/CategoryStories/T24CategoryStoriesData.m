//
//  T24CategoryStoriesData.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesData.h"
#import "T24CategoryStoriesUrls.h"
#import "T24CategoryStoriesCategory.h"
#import "T24CategoryStoriesStats.h"
#import "T24CategoryStoriesImages.h"


NSString *const kT24CategoryStoriesDataExcerpt = @"excerpt";
NSString *const kT24CategoryStoriesDataAlias = @"alias";
NSString *const kT24CategoryStoriesDataUrls = @"urls";
NSString *const kT24CategoryStoriesDataId = @"id";
NSString *const kT24CategoryStoriesDataCategory = @"category";
NSString *const kT24CategoryStoriesDataStats = @"stats";
NSString *const kT24CategoryStoriesDataTitle = @"title";
NSString *const kT24CategoryStoriesDataImages = @"images";
NSString *const kT24CategoryStoriesDataPublishingDate = @"publishingDate";


@interface T24CategoryStoriesData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesData

@synthesize excerpt = _excerpt;
@synthesize alias = _alias;
@synthesize urls = _urls;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize category = _category;
@synthesize stats = _stats;
@synthesize title = _title;
@synthesize images = _images;
@synthesize publishingDate = _publishingDate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.excerpt = [self objectOrNilForKey:kT24CategoryStoriesDataExcerpt fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24CategoryStoriesDataAlias fromDictionary:dict];
            self.urls = [T24CategoryStoriesUrls modelObjectWithDictionary:[dict objectForKey:kT24CategoryStoriesDataUrls]];
            self.dataIdentifier = [self objectOrNilForKey:kT24CategoryStoriesDataId fromDictionary:dict];
            self.category = [T24CategoryStoriesCategory modelObjectWithDictionary:[dict objectForKey:kT24CategoryStoriesDataCategory]];
            self.stats = [T24CategoryStoriesStats modelObjectWithDictionary:[dict objectForKey:kT24CategoryStoriesDataStats]];
            self.title = [self objectOrNilForKey:kT24CategoryStoriesDataTitle fromDictionary:dict];
            self.images = [T24CategoryStoriesImages modelObjectWithDictionary:[dict objectForKey:kT24CategoryStoriesDataImages]];
            self.publishingDate = [self objectOrNilForKey:kT24CategoryStoriesDataPublishingDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.excerpt forKey:kT24CategoryStoriesDataExcerpt];
    [mutableDict setValue:self.alias forKey:kT24CategoryStoriesDataAlias];
    [mutableDict setValue:[self.urls dictionaryRepresentation] forKey:kT24CategoryStoriesDataUrls];
    [mutableDict setValue:self.dataIdentifier forKey:kT24CategoryStoriesDataId];
    [mutableDict setValue:[self.category dictionaryRepresentation] forKey:kT24CategoryStoriesDataCategory];
    [mutableDict setValue:[self.stats dictionaryRepresentation] forKey:kT24CategoryStoriesDataStats];
    [mutableDict setValue:self.title forKey:kT24CategoryStoriesDataTitle];
    [mutableDict setValue:[self.images dictionaryRepresentation] forKey:kT24CategoryStoriesDataImages];
    [mutableDict setValue:self.publishingDate forKey:kT24CategoryStoriesDataPublishingDate];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.excerpt = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataExcerpt];
    self.alias = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataAlias];
    self.urls = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataUrls];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataId];
    self.category = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataCategory];
    self.stats = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataStats];
    self.title = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataTitle];
    self.images = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataImages];
    self.publishingDate = [aDecoder decodeObjectForKey:kT24CategoryStoriesDataPublishingDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_excerpt forKey:kT24CategoryStoriesDataExcerpt];
    [aCoder encodeObject:_alias forKey:kT24CategoryStoriesDataAlias];
    [aCoder encodeObject:_urls forKey:kT24CategoryStoriesDataUrls];
    [aCoder encodeObject:_dataIdentifier forKey:kT24CategoryStoriesDataId];
    [aCoder encodeObject:_category forKey:kT24CategoryStoriesDataCategory];
    [aCoder encodeObject:_stats forKey:kT24CategoryStoriesDataStats];
    [aCoder encodeObject:_title forKey:kT24CategoryStoriesDataTitle];
    [aCoder encodeObject:_images forKey:kT24CategoryStoriesDataImages];
    [aCoder encodeObject:_publishingDate forKey:kT24CategoryStoriesDataPublishingDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesData *copy = [[T24CategoryStoriesData alloc] init];
    
    if (copy) {

        copy.excerpt = [self.excerpt copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.urls = [self.urls copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.stats = [self.stats copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.publishingDate = [self.publishingDate copyWithZone:zone];
    }
    
    return copy;
}


@end
