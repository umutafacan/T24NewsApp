//
//  T24StoriesStats.m
//
//  Created by   on 7/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoriesStats.h"


NSString *const kT24StoriesStatsShares = @"shares";
NSString *const kT24StoriesStatsLikes = @"likes";
NSString *const kT24StoriesStatsInteractions = @"interactions";
NSString *const kT24StoriesStatsReads = @"reads";
NSString *const kT24StoriesStatsPageviews = @"pageviews";
NSString *const kT24StoriesStatsComments = @"comments";


@interface T24StoriesStats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoriesStats

@synthesize shares = _shares;
@synthesize likes = _likes;
@synthesize interactions = _interactions;
@synthesize reads = _reads;
@synthesize pageviews = _pageviews;
@synthesize comments = _comments;


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
            self.shares = [[self objectOrNilForKey:kT24StoriesStatsShares fromDictionary:dict] doubleValue];
            self.likes = [[self objectOrNilForKey:kT24StoriesStatsLikes fromDictionary:dict] doubleValue];
            self.interactions = [[self objectOrNilForKey:kT24StoriesStatsInteractions fromDictionary:dict] doubleValue];
            self.reads = [[self objectOrNilForKey:kT24StoriesStatsReads fromDictionary:dict] doubleValue];
            self.pageviews = [[self objectOrNilForKey:kT24StoriesStatsPageviews fromDictionary:dict] doubleValue];
            self.comments = [[self objectOrNilForKey:kT24StoriesStatsComments fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kT24StoriesStatsShares];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kT24StoriesStatsLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interactions] forKey:kT24StoriesStatsInteractions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reads] forKey:kT24StoriesStatsReads];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageviews] forKey:kT24StoriesStatsPageviews];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kT24StoriesStatsComments];

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

    self.shares = [aDecoder decodeDoubleForKey:kT24StoriesStatsShares];
    self.likes = [aDecoder decodeDoubleForKey:kT24StoriesStatsLikes];
    self.interactions = [aDecoder decodeDoubleForKey:kT24StoriesStatsInteractions];
    self.reads = [aDecoder decodeDoubleForKey:kT24StoriesStatsReads];
    self.pageviews = [aDecoder decodeDoubleForKey:kT24StoriesStatsPageviews];
    self.comments = [aDecoder decodeDoubleForKey:kT24StoriesStatsComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_shares forKey:kT24StoriesStatsShares];
    [aCoder encodeDouble:_likes forKey:kT24StoriesStatsLikes];
    [aCoder encodeDouble:_interactions forKey:kT24StoriesStatsInteractions];
    [aCoder encodeDouble:_reads forKey:kT24StoriesStatsReads];
    [aCoder encodeDouble:_pageviews forKey:kT24StoriesStatsPageviews];
    [aCoder encodeDouble:_comments forKey:kT24StoriesStatsComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoriesStats *copy = [[T24StoriesStats alloc] init];
    
    if (copy) {

        copy.shares = self.shares;
        copy.likes = self.likes;
        copy.interactions = self.interactions;
        copy.reads = self.reads;
        copy.pageviews = self.pageviews;
        copy.comments = self.comments;
    }
    
    return copy;
}


@end
