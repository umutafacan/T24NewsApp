//
//  T24StoriesData.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesData.h"
#import "T24StoriesUrls.h"
#import "T24StoriesCategory.h"
#import "T24StoriesStats.h"
#import "T24StoriesImages.h"


NSString *const kT24StoriesDataExcerpt = @"excerpt";
NSString *const kT24StoriesDataAlias = @"alias";
NSString *const kT24StoriesDataUrls = @"urls";
NSString *const kT24StoriesDataId = @"id";
NSString *const kT24StoriesDataCategory = @"category";
NSString *const kT24StoriesDataStats = @"stats";
NSString *const kT24StoriesDataTitle = @"title";
NSString *const kT24StoriesDataImages = @"images";
NSString *const kT24StoriesDataPublishingDate = @"publishingDate";


@interface T24StoriesData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesData

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
            self.excerpt = [self objectOrNilForKey:kT24StoriesDataExcerpt fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24StoriesDataAlias fromDictionary:dict];
            self.urls = [T24StoriesUrls modelObjectWithDictionary:[dict objectForKey:kT24StoriesDataUrls]];
            self.dataIdentifier = [self objectOrNilForKey:kT24StoriesDataId fromDictionary:dict];
            self.category = [T24StoriesCategory modelObjectWithDictionary:[dict objectForKey:kT24StoriesDataCategory]];
            self.stats = [T24StoriesStats modelObjectWithDictionary:[dict objectForKey:kT24StoriesDataStats]];
            self.title = [self objectOrNilForKey:kT24StoriesDataTitle fromDictionary:dict];
            self.images = [T24StoriesImages modelObjectWithDictionary:[dict objectForKey:kT24StoriesDataImages]];
            self.publishingDate = [self objectOrNilForKey:kT24StoriesDataPublishingDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.excerpt forKey:kT24StoriesDataExcerpt];
    [mutableDict setValue:self.alias forKey:kT24StoriesDataAlias];
    [mutableDict setValue:[self.urls dictionaryRepresentation] forKey:kT24StoriesDataUrls];
    [mutableDict setValue:self.dataIdentifier forKey:kT24StoriesDataId];
    [mutableDict setValue:[self.category dictionaryRepresentation] forKey:kT24StoriesDataCategory];
    [mutableDict setValue:[self.stats dictionaryRepresentation] forKey:kT24StoriesDataStats];
    [mutableDict setValue:self.title forKey:kT24StoriesDataTitle];
    [mutableDict setValue:[self.images dictionaryRepresentation] forKey:kT24StoriesDataImages];
    [mutableDict setValue:self.publishingDate forKey:kT24StoriesDataPublishingDate];

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

    self.excerpt = [aDecoder decodeObjectForKey:kT24StoriesDataExcerpt];
    self.alias = [aDecoder decodeObjectForKey:kT24StoriesDataAlias];
    self.urls = [aDecoder decodeObjectForKey:kT24StoriesDataUrls];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kT24StoriesDataId];
    self.category = [aDecoder decodeObjectForKey:kT24StoriesDataCategory];
    self.stats = [aDecoder decodeObjectForKey:kT24StoriesDataStats];
    self.title = [aDecoder decodeObjectForKey:kT24StoriesDataTitle];
    self.images = [aDecoder decodeObjectForKey:kT24StoriesDataImages];
    self.publishingDate = [aDecoder decodeObjectForKey:kT24StoriesDataPublishingDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_excerpt forKey:kT24StoriesDataExcerpt];
    [aCoder encodeObject:_alias forKey:kT24StoriesDataAlias];
    [aCoder encodeObject:_urls forKey:kT24StoriesDataUrls];
    [aCoder encodeObject:_dataIdentifier forKey:kT24StoriesDataId];
    [aCoder encodeObject:_category forKey:kT24StoriesDataCategory];
    [aCoder encodeObject:_stats forKey:kT24StoriesDataStats];
    [aCoder encodeObject:_title forKey:kT24StoriesDataTitle];
    [aCoder encodeObject:_images forKey:kT24StoriesDataImages];
    [aCoder encodeObject:_publishingDate forKey:kT24StoriesDataPublishingDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesData *copy = [[T24StoriesData alloc] init];
    
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
