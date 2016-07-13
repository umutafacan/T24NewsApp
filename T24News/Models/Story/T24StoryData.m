//
//  T24StoryData.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoryData.h"
#import "T24StoryAuthor.h"
#import "T24StoryUrls.h"
#import "T24StoryCategory.h"
#import "T24StoryImages.h"
#import "T24StoryStats.h"


NSString *const kT24StoryDataAuthor = @"author";
NSString *const kT24StoryDataAlias = @"alias";
NSString *const kT24StoryDataUrls = @"urls";
NSString *const kT24StoryDataId = @"id";
NSString *const kT24StoryDataCategory = @"category";
NSString *const kT24StoryDataTitle = @"title";
NSString *const kT24StoryDataImages = @"images";
NSString *const kT24StoryDataExcerpt = @"excerpt";
NSString *const kT24StoryDataText = @"text";
NSString *const kT24StoryDataStats = @"stats";
NSString *const kT24StoryDataPublishingDate = @"publishingDate";


@interface T24StoryData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoryData

@synthesize author = _author;
@synthesize alias = _alias;
@synthesize urls = _urls;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize category = _category;
@synthesize title = _title;
@synthesize images = _images;
@synthesize excerpt = _excerpt;
@synthesize text = _text;
@synthesize stats = _stats;
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
            self.author = [T24StoryAuthor modelObjectWithDictionary:[dict objectForKey:kT24StoryDataAuthor]];
            self.alias = [self objectOrNilForKey:kT24StoryDataAlias fromDictionary:dict];
            self.urls = [T24StoryUrls modelObjectWithDictionary:[dict objectForKey:kT24StoryDataUrls]];
            self.dataIdentifier = [self objectOrNilForKey:kT24StoryDataId fromDictionary:dict];
            self.category = [T24StoryCategory modelObjectWithDictionary:[dict objectForKey:kT24StoryDataCategory]];
            self.title = [self objectOrNilForKey:kT24StoryDataTitle fromDictionary:dict];
            self.images = [T24StoryImages modelObjectWithDictionary:[dict objectForKey:kT24StoryDataImages]];
            self.excerpt = [self objectOrNilForKey:kT24StoryDataExcerpt fromDictionary:dict];
            self.text = [self objectOrNilForKey:kT24StoryDataText fromDictionary:dict];
            self.stats = [T24StoryStats modelObjectWithDictionary:[dict objectForKey:kT24StoryDataStats]];
            self.publishingDate = [self objectOrNilForKey:kT24StoryDataPublishingDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kT24StoryDataAuthor];
    [mutableDict setValue:self.alias forKey:kT24StoryDataAlias];
    [mutableDict setValue:[self.urls dictionaryRepresentation] forKey:kT24StoryDataUrls];
    [mutableDict setValue:self.dataIdentifier forKey:kT24StoryDataId];
    [mutableDict setValue:[self.category dictionaryRepresentation] forKey:kT24StoryDataCategory];
    [mutableDict setValue:self.title forKey:kT24StoryDataTitle];
    [mutableDict setValue:[self.images dictionaryRepresentation] forKey:kT24StoryDataImages];
    [mutableDict setValue:self.excerpt forKey:kT24StoryDataExcerpt];
    [mutableDict setValue:self.text forKey:kT24StoryDataText];
    [mutableDict setValue:[self.stats dictionaryRepresentation] forKey:kT24StoryDataStats];
    [mutableDict setValue:self.publishingDate forKey:kT24StoryDataPublishingDate];

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

    self.author = [aDecoder decodeObjectForKey:kT24StoryDataAuthor];
    self.alias = [aDecoder decodeObjectForKey:kT24StoryDataAlias];
    self.urls = [aDecoder decodeObjectForKey:kT24StoryDataUrls];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kT24StoryDataId];
    self.category = [aDecoder decodeObjectForKey:kT24StoryDataCategory];
    self.title = [aDecoder decodeObjectForKey:kT24StoryDataTitle];
    self.images = [aDecoder decodeObjectForKey:kT24StoryDataImages];
    self.excerpt = [aDecoder decodeObjectForKey:kT24StoryDataExcerpt];
    self.text = [aDecoder decodeObjectForKey:kT24StoryDataText];
    self.stats = [aDecoder decodeObjectForKey:kT24StoryDataStats];
    self.publishingDate = [aDecoder decodeObjectForKey:kT24StoryDataPublishingDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_author forKey:kT24StoryDataAuthor];
    [aCoder encodeObject:_alias forKey:kT24StoryDataAlias];
    [aCoder encodeObject:_urls forKey:kT24StoryDataUrls];
    [aCoder encodeObject:_dataIdentifier forKey:kT24StoryDataId];
    [aCoder encodeObject:_category forKey:kT24StoryDataCategory];
    [aCoder encodeObject:_title forKey:kT24StoryDataTitle];
    [aCoder encodeObject:_images forKey:kT24StoryDataImages];
    [aCoder encodeObject:_excerpt forKey:kT24StoryDataExcerpt];
    [aCoder encodeObject:_text forKey:kT24StoryDataText];
    [aCoder encodeObject:_stats forKey:kT24StoryDataStats];
    [aCoder encodeObject:_publishingDate forKey:kT24StoryDataPublishingDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoryData *copy = [[T24StoryData alloc] init];
    
    if (copy) {

        copy.author = [self.author copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.urls = [self.urls copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.excerpt = [self.excerpt copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.stats = [self.stats copyWithZone:zone];
        copy.publishingDate = [self.publishingDate copyWithZone:zone];
    }
    
    return copy;
}


@end
