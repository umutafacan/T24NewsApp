//
//  T24CategoryStoriesCategory.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesCategory.h"


NSString *const kT24CategoryStoriesCategoryId = @"id";
NSString *const kT24CategoryStoriesCategoryName = @"name";
NSString *const kT24CategoryStoriesCategoryAlias = @"alias";


@interface T24CategoryStoriesCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesCategory

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
            self.categoryIdentifier = [self objectOrNilForKey:kT24CategoryStoriesCategoryId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kT24CategoryStoriesCategoryName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24CategoryStoriesCategoryAlias fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryIdentifier forKey:kT24CategoryStoriesCategoryId];
    [mutableDict setValue:self.name forKey:kT24CategoryStoriesCategoryName];
    [mutableDict setValue:self.alias forKey:kT24CategoryStoriesCategoryAlias];

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

    self.categoryIdentifier = [aDecoder decodeObjectForKey:kT24CategoryStoriesCategoryId];
    self.name = [aDecoder decodeObjectForKey:kT24CategoryStoriesCategoryName];
    self.alias = [aDecoder decodeObjectForKey:kT24CategoryStoriesCategoryAlias];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryIdentifier forKey:kT24CategoryStoriesCategoryId];
    [aCoder encodeObject:_name forKey:kT24CategoryStoriesCategoryName];
    [aCoder encodeObject:_alias forKey:kT24CategoryStoriesCategoryAlias];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesCategory *copy = [[T24CategoryStoriesCategory alloc] init];
    
    if (copy) {

        copy.categoryIdentifier = [self.categoryIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
    }
    
    return copy;
}


@end
