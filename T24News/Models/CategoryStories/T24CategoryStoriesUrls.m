//
//  T24CategoryStoriesUrls.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesUrls.h"


NSString *const kT24CategoryStoriesUrlsWeb = @"web";


@interface T24CategoryStoriesUrls ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesUrls

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
            self.web = [self objectOrNilForKey:kT24CategoryStoriesUrlsWeb fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.web forKey:kT24CategoryStoriesUrlsWeb];

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

    self.web = [aDecoder decodeObjectForKey:kT24CategoryStoriesUrlsWeb];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_web forKey:kT24CategoryStoriesUrlsWeb];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesUrls *copy = [[T24CategoryStoriesUrls alloc] init];
    
    if (copy) {

        copy.web = [self.web copyWithZone:zone];
    }
    
    return copy;
}


@end
