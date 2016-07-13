//
//  T24CategoryStoriesImages.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesImages.h"


NSString *const kT24CategoryStoriesImagesBox = @"box";
NSString *const kT24CategoryStoriesImagesList = @"list";
NSString *const kT24CategoryStoriesImagesGrid = @"grid";
NSString *const kT24CategoryStoriesImagesPage = @"page";


@interface T24CategoryStoriesImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesImages

@synthesize box = _box;
@synthesize list = _list;
@synthesize grid = _grid;
@synthesize page = _page;


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
            self.box = [self objectOrNilForKey:kT24CategoryStoriesImagesBox fromDictionary:dict];
            self.list = [self objectOrNilForKey:kT24CategoryStoriesImagesList fromDictionary:dict];
            self.grid = [self objectOrNilForKey:kT24CategoryStoriesImagesGrid fromDictionary:dict];
            self.page = [self objectOrNilForKey:kT24CategoryStoriesImagesPage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.box forKey:kT24CategoryStoriesImagesBox];
    [mutableDict setValue:self.list forKey:kT24CategoryStoriesImagesList];
    [mutableDict setValue:self.grid forKey:kT24CategoryStoriesImagesGrid];
    [mutableDict setValue:self.page forKey:kT24CategoryStoriesImagesPage];

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

    self.box = [aDecoder decodeObjectForKey:kT24CategoryStoriesImagesBox];
    self.list = [aDecoder decodeObjectForKey:kT24CategoryStoriesImagesList];
    self.grid = [aDecoder decodeObjectForKey:kT24CategoryStoriesImagesGrid];
    self.page = [aDecoder decodeObjectForKey:kT24CategoryStoriesImagesPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_box forKey:kT24CategoryStoriesImagesBox];
    [aCoder encodeObject:_list forKey:kT24CategoryStoriesImagesList];
    [aCoder encodeObject:_grid forKey:kT24CategoryStoriesImagesGrid];
    [aCoder encodeObject:_page forKey:kT24CategoryStoriesImagesPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesImages *copy = [[T24CategoryStoriesImages alloc] init];
    
    if (copy) {

        copy.box = [self.box copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.grid = [self.grid copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
    }
    
    return copy;
}


@end
