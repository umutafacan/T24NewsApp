//
//  T24StoriesPaging.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesPaging.h"


NSString *const kT24StoriesPagingPages = @"pages";
NSString *const kT24StoriesPagingCurrent = @"current";
NSString *const kT24StoriesPagingItems = @"items";
NSString *const kT24StoriesPagingLimit = @"limit";


@interface T24StoriesPaging ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesPaging

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
            self.pages = [[self objectOrNilForKey:kT24StoriesPagingPages fromDictionary:dict] doubleValue];
            self.current = [[self objectOrNilForKey:kT24StoriesPagingCurrent fromDictionary:dict] doubleValue];
            self.items = [[self objectOrNilForKey:kT24StoriesPagingItems fromDictionary:dict] doubleValue];
            self.limit = [[self objectOrNilForKey:kT24StoriesPagingLimit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kT24StoriesPagingPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.current] forKey:kT24StoriesPagingCurrent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.items] forKey:kT24StoriesPagingItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limit] forKey:kT24StoriesPagingLimit];

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

    self.pages = [aDecoder decodeDoubleForKey:kT24StoriesPagingPages];
    self.current = [aDecoder decodeDoubleForKey:kT24StoriesPagingCurrent];
    self.items = [aDecoder decodeDoubleForKey:kT24StoriesPagingItems];
    self.limit = [aDecoder decodeDoubleForKey:kT24StoriesPagingLimit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kT24StoriesPagingPages];
    [aCoder encodeDouble:_current forKey:kT24StoriesPagingCurrent];
    [aCoder encodeDouble:_items forKey:kT24StoriesPagingItems];
    [aCoder encodeDouble:_limit forKey:kT24StoriesPagingLimit];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesPaging *copy = [[T24StoriesPaging alloc] init];
    
    if (copy) {

        copy.pages = self.pages;
        copy.current = self.current;
        copy.items = self.items;
        copy.limit = self.limit;
    }
    
    return copy;
}


@end
