//
//  T24StoryImages.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoryImages.h"


NSString *const kT24StoryImagesBox = @"box";
NSString *const kT24StoryImagesList = @"list";
NSString *const kT24StoryImagesGrid = @"grid";
NSString *const kT24StoryImagesPage = @"page";


@interface T24StoryImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoryImages

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
            self.box = [self objectOrNilForKey:kT24StoryImagesBox fromDictionary:dict];
            self.list = [self objectOrNilForKey:kT24StoryImagesList fromDictionary:dict];
            self.grid = [self objectOrNilForKey:kT24StoryImagesGrid fromDictionary:dict];
            self.page = [self objectOrNilForKey:kT24StoryImagesPage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.box forKey:kT24StoryImagesBox];
    [mutableDict setValue:self.list forKey:kT24StoryImagesList];
    [mutableDict setValue:self.grid forKey:kT24StoryImagesGrid];
    [mutableDict setValue:self.page forKey:kT24StoryImagesPage];

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

    self.box = [aDecoder decodeObjectForKey:kT24StoryImagesBox];
    self.list = [aDecoder decodeObjectForKey:kT24StoryImagesList];
    self.grid = [aDecoder decodeObjectForKey:kT24StoryImagesGrid];
    self.page = [aDecoder decodeObjectForKey:kT24StoryImagesPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_box forKey:kT24StoryImagesBox];
    [aCoder encodeObject:_list forKey:kT24StoryImagesList];
    [aCoder encodeObject:_grid forKey:kT24StoryImagesGrid];
    [aCoder encodeObject:_page forKey:kT24StoryImagesPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoryImages *copy = [[T24StoryImages alloc] init];
    
    if (copy) {

        copy.box = [self.box copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.grid = [self.grid copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
    }
    
    return copy;
}


@end
