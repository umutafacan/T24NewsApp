//
//  T24StoriesResponse.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesResponse.h"
#import "T24StoriesData.h"
#import "T24StoriesPaging.h"


NSString *const kT24StoriesResponseResult = @"result";
NSString *const kT24StoriesResponseData = @"data";
NSString *const kT24StoriesResponsePaging = @"paging";


@interface T24StoriesResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesResponse

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
            self.result = [[self objectOrNilForKey:kT24StoriesResponseResult fromDictionary:dict] boolValue];
    NSObject *receivedT24StoriesData = [dict objectForKey:kT24StoriesResponseData];
    NSMutableArray *parsedT24StoriesData = [NSMutableArray array];
    if ([receivedT24StoriesData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedT24StoriesData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedT24StoriesData addObject:[T24StoriesData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedT24StoriesData isKindOfClass:[NSDictionary class]]) {
       [parsedT24StoriesData addObject:[T24StoriesData modelObjectWithDictionary:(NSDictionary *)receivedT24StoriesData]];
    }

    self.data = [NSArray arrayWithArray:parsedT24StoriesData];
            self.paging = [T24StoriesPaging modelObjectWithDictionary:[dict objectForKey:kT24StoriesResponsePaging]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kT24StoriesResponseResult];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kT24StoriesResponseData];
    [mutableDict setValue:[self.paging dictionaryRepresentation] forKey:kT24StoriesResponsePaging];

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

    self.result = [aDecoder decodeBoolForKey:kT24StoriesResponseResult];
    self.data = [aDecoder decodeObjectForKey:kT24StoriesResponseData];
    self.paging = [aDecoder decodeObjectForKey:kT24StoriesResponsePaging];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kT24StoriesResponseResult];
    [aCoder encodeObject:_data forKey:kT24StoriesResponseData];
    [aCoder encodeObject:_paging forKey:kT24StoriesResponsePaging];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesResponse *copy = [[T24StoriesResponse alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.data = [self.data copyWithZone:zone];
        copy.paging = [self.paging copyWithZone:zone];
    }
    
    return copy;
}


@end
