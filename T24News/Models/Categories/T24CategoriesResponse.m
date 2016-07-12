//
//  T24CategoriesResponse.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoriesResponse.h"
#import "T24CategoriesData.h"


NSString *const kT24CategoriesResponseResult = @"result";
NSString *const kT24CategoriesResponseData = @"data";


@interface T24CategoriesResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoriesResponse

@synthesize result = _result;
@synthesize data = _data;


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
            self.result = [[self objectOrNilForKey:kT24CategoriesResponseResult fromDictionary:dict] boolValue];
    NSObject *receivedT24CategoriesData = [dict objectForKey:kT24CategoriesResponseData];
    NSMutableArray *parsedT24CategoriesData = [NSMutableArray array];
    if ([receivedT24CategoriesData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedT24CategoriesData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedT24CategoriesData addObject:[T24CategoriesData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedT24CategoriesData isKindOfClass:[NSDictionary class]]) {
       [parsedT24CategoriesData addObject:[T24CategoriesData modelObjectWithDictionary:(NSDictionary *)receivedT24CategoriesData]];
    }

    self.data = [NSArray arrayWithArray:parsedT24CategoriesData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kT24CategoriesResponseResult];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kT24CategoriesResponseData];

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

    self.result = [aDecoder decodeBoolForKey:kT24CategoriesResponseResult];
    self.data = [aDecoder decodeObjectForKey:kT24CategoriesResponseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kT24CategoriesResponseResult];
    [aCoder encodeObject:_data forKey:kT24CategoriesResponseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoriesResponse *copy = [[T24CategoriesResponse alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
