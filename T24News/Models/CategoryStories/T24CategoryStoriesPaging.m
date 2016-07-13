//
//  T24CategoryStoriesPaging.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesPaging.h"


NSString *const kT24CategoryStoriesPagingPages = @"pages";
NSString *const kT24CategoryStoriesPagingCurrent = @"current";
NSString *const kT24CategoryStoriesPagingItems = @"items";
NSString *const kT24CategoryStoriesPagingLimit = @"limit";


@interface T24CategoryStoriesPaging ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesPaging

@synthesize pages = _pages;
@synthesize current = _current;
@synthesize items = _items;
@synthesize limit = _limit;


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
            self.pages = [[self objectOrNilForKey:kT24CategoryStoriesPagingPages fromDictionary:dict] doubleValue];
            self.current = [[self objectOrNilForKey:kT24CategoryStoriesPagingCurrent fromDictionary:dict] doubleValue];
            self.items = [[self objectOrNilForKey:kT24CategoryStoriesPagingItems fromDictionary:dict] doubleValue];
            self.limit = [[self objectOrNilForKey:kT24CategoryStoriesPagingLimit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kT24CategoryStoriesPagingPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.current] forKey:kT24CategoryStoriesPagingCurrent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.items] forKey:kT24CategoryStoriesPagingItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limit] forKey:kT24CategoryStoriesPagingLimit];

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

    self.pages = [aDecoder decodeDoubleForKey:kT24CategoryStoriesPagingPages];
    self.current = [aDecoder decodeDoubleForKey:kT24CategoryStoriesPagingCurrent];
    self.items = [aDecoder decodeDoubleForKey:kT24CategoryStoriesPagingItems];
    self.limit = [aDecoder decodeDoubleForKey:kT24CategoryStoriesPagingLimit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kT24CategoryStoriesPagingPages];
    [aCoder encodeDouble:_current forKey:kT24CategoryStoriesPagingCurrent];
    [aCoder encodeDouble:_items forKey:kT24CategoryStoriesPagingItems];
    [aCoder encodeDouble:_limit forKey:kT24CategoryStoriesPagingLimit];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesPaging *copy = [[T24CategoryStoriesPaging alloc] init];
    
    if (copy) {

        copy.pages = self.pages;
        copy.current = self.current;
        copy.items = self.items;
        copy.limit = self.limit;
    }
    
    return copy;
}


@end
