//
//  T24StoriesCategory.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesCategory.h"


NSString *const kT24StoriesCategoryId = @"id";
NSString *const kT24StoriesCategoryName = @"name";
NSString *const kT24StoriesCategoryAlias = @"alias";


@interface T24StoriesCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesCategory

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
            self.categoryIdentifier = [self objectOrNilForKey:kT24StoriesCategoryId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kT24StoriesCategoryName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24StoriesCategoryAlias fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryIdentifier forKey:kT24StoriesCategoryId];
    [mutableDict setValue:self.name forKey:kT24StoriesCategoryName];
    [mutableDict setValue:self.alias forKey:kT24StoriesCategoryAlias];

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

    self.categoryIdentifier = [aDecoder decodeObjectForKey:kT24StoriesCategoryId];
    self.name = [aDecoder decodeObjectForKey:kT24StoriesCategoryName];
    self.alias = [aDecoder decodeObjectForKey:kT24StoriesCategoryAlias];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryIdentifier forKey:kT24StoriesCategoryId];
    [aCoder encodeObject:_name forKey:kT24StoriesCategoryName];
    [aCoder encodeObject:_alias forKey:kT24StoriesCategoryAlias];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesCategory *copy = [[T24StoriesCategory alloc] init];
    
    if (copy) {

        copy.categoryIdentifier = [self.categoryIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
    }
    
    return copy;
}


@end
