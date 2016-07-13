//
//  T24CategoryStoriesResponse.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesResponse.h"
#import "T24CategoryStoriesData.h"
#import "T24CategoryStoriesPaging.h"


NSString *const kT24CategoryStoriesResponseResult = @"result";
NSString *const kT24CategoryStoriesResponseData = @"data";
NSString *const kT24CategoryStoriesResponsePaging = @"paging";


@interface T24CategoryStoriesResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesResponse

@synthesize result = _result;
@synthesize data = _data;
@synthesize paging = _paging;


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
            self.result = [[self objectOrNilForKey:kT24CategoryStoriesResponseResult fromDictionary:dict] boolValue];
    NSObject *receivedT24CategoryStoriesData = [dict objectForKey:kT24CategoryStoriesResponseData];
    NSMutableArray *parsedT24CategoryStoriesData = [NSMutableArray array];
    if ([receivedT24CategoryStoriesData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedT24CategoryStoriesData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedT24CategoryStoriesData addObject:[T24CategoryStoriesData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedT24CategoryStoriesData isKindOfClass:[NSDictionary class]]) {
       [parsedT24CategoryStoriesData addObject:[T24CategoryStoriesData modelObjectWithDictionary:(NSDictionary *)receivedT24CategoryStoriesData]];
    }

    self.data = [NSArray arrayWithArray:parsedT24CategoryStoriesData];
            self.paging = [T24CategoryStoriesPaging modelObjectWithDictionary:[dict objectForKey:kT24CategoryStoriesResponsePaging]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kT24CategoryStoriesResponseResult];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kT24CategoryStoriesResponseData];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kT24CategoryStoriesResponsePaging];

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

    self.result = [aDecoder decodeBoolForKey:kT24CategoryStoriesResponseResult];
    self.data = [aDecoder decodeObjectForKey:kT24CategoryStoriesResponseData];
    self.paging = [aDecoder decodeObjectForKey:kT24CategoryStoriesResponsePaging];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kT24CategoryStoriesResponseResult];
    [aCoder encodeObject:_data forKey:kT24CategoryStoriesResponseData];
    [aCoder encodeObject:_paging forKey:kT24CategoryStoriesResponsePaging];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesResponse *copy = [[T24CategoryStoriesResponse alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.data = [self.data copyWithZone:zone];
        copy.paging = [self.paging copyWithZone:zone];
    }
    
    return copy;
}


@end
