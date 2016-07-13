//
//  T24StoryCategory.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoryCategory.h"


NSString *const kT24StoryCategoryId = @"id";
NSString *const kT24StoryCategoryName = @"name";
NSString *const kT24StoryCategoryAlias = @"alias";


@interface T24StoryCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoryCategory

@synthesize categoryIdentifier = _categoryIdentifier;
@synthesize name = _name;
@synthesize alias = _alias;


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
            self.categoryIdentifier = [self objectOrNilForKey:kT24StoryCategoryId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kT24StoryCategoryName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24StoryCategoryAlias fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryIdentifier forKey:kT24StoryCategoryId];
    [mutableDict setValue:self.name forKey:kT24StoryCategoryName];
    [mutableDict setValue:self.alias forKey:kT24StoryCategoryAlias];

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

    self.categoryIdentifier = [aDecoder decodeObjectForKey:kT24StoryCategoryId];
    self.name = [aDecoder decodeObjectForKey:kT24StoryCategoryName];
    self.alias = [aDecoder decodeObjectForKey:kT24StoryCategoryAlias];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryIdentifier forKey:kT24StoryCategoryId];
    [aCoder encodeObject:_name forKey:kT24StoryCategoryName];
    [aCoder encodeObject:_alias forKey:kT24StoryCategoryAlias];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoryCategory *copy = [[T24StoryCategory alloc] init];
    
    if (copy) {

        copy.categoryIdentifier = [self.categoryIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
    }
    
    return copy;
}


@end
