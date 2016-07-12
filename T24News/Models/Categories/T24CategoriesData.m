//
//  T24CategoriesData.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoriesData.h"


NSString *const kT24CategoriesDataId = @"id";
NSString *const kT24CategoriesDataName = @"name";
NSString *const kT24CategoriesDataAlias = @"alias";


@interface T24CategoriesData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoriesData

@synthesize dataIdentifier = _dataIdentifier;
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
            self.dataIdentifier = [self objectOrNilForKey:kT24CategoriesDataId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kT24CategoriesDataName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24CategoriesDataAlias fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kT24CategoriesDataId];
    [mutableDict setValue:self.name forKey:kT24CategoriesDataName];
    [mutableDict setValue:self.alias forKey:kT24CategoriesDataAlias];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kT24CategoriesDataId];
    self.name = [aDecoder decodeObjectForKey:kT24CategoriesDataName];
    self.alias = [aDecoder decodeObjectForKey:kT24CategoriesDataAlias];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kT24CategoriesDataId];
    [aCoder encodeObject:_name forKey:kT24CategoriesDataName];
    [aCoder encodeObject:_alias forKey:kT24CategoriesDataAlias];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoriesData *copy = [[T24CategoriesData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
    }
    
    return copy;
}


@end
