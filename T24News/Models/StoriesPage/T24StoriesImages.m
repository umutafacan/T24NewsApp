//
//  T24StoriesImages.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesImages.h"


NSString *const kT24StoriesImagesBox = @"box";
NSString *const kT24StoriesImagesList = @"list";
NSString *const kT24StoriesImagesGrid = @"grid";
NSString *const kT24StoriesImagesPage = @"page";


@interface T24StoriesImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesImages

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
            self.box = [self objectOrNilForKey:kT24StoriesImagesBox fromDictionary:dict];
            self.list = [self objectOrNilForKey:kT24StoriesImagesList fromDictionary:dict];
            self.grid = [self objectOrNilForKey:kT24StoriesImagesGrid fromDictionary:dict];
            self.page = [self objectOrNilForKey:kT24StoriesImagesPage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.box forKey:kT24StoriesImagesBox];
    [mutableDict setValue:self.list forKey:kT24StoriesImagesList];
    [mutableDict setValue:self.grid forKey:kT24StoriesImagesGrid];
    [mutableDict setValue:self.page forKey:kT24StoriesImagesPage];

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

    self.box = [aDecoder decodeObjectForKey:kT24StoriesImagesBox];
    self.list = [aDecoder decodeObjectForKey:kT24StoriesImagesList];
    self.grid = [aDecoder decodeObjectForKey:kT24StoriesImagesGrid];
    self.page = [aDecoder decodeObjectForKey:kT24StoriesImagesPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_box forKey:kT24StoriesImagesBox];
    [aCoder encodeObject:_list forKey:kT24StoriesImagesList];
    [aCoder encodeObject:_grid forKey:kT24StoriesImagesGrid];
    [aCoder encodeObject:_page forKey:kT24StoriesImagesPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesImages *copy = [[T24StoriesImages alloc] init];
    
    if (copy) {

        copy.box = [self.box copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.grid = [self.grid copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
    }
    
    return copy;
}


@end
