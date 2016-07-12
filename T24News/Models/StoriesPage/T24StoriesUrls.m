//
//  T24StoriesUrls.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesUrls.h"


NSString *const kT24StoriesUrlsWeb = @"web";


@interface T24StoriesUrls ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesUrls

@synthesize web = _web;


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
            self.web = [self objectOrNilForKey:kT24StoriesUrlsWeb fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.web forKey:kT24StoriesUrlsWeb];

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

    self.web = [aDecoder decodeObjectForKey:kT24StoriesUrlsWeb];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_web forKey:kT24StoriesUrlsWeb];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesUrls *copy = [[T24StoriesUrls alloc] init];
    
    if (copy) {

        copy.web = [self.web copyWithZone:zone];
    }
    
    return copy;
}


@end
