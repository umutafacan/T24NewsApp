//
//  T24CategoryStoriesStats.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24CategoryStoriesStats.h"


NSString *const kT24CategoryStoriesStatsShares = @"shares";
NSString *const kT24CategoryStoriesStatsLikes = @"likes";
NSString *const kT24CategoryStoriesStatsInteractions = @"interactions";
NSString *const kT24CategoryStoriesStatsReads = @"reads";
NSString *const kT24CategoryStoriesStatsPageviews = @"pageviews";
NSString *const kT24CategoryStoriesStatsComments = @"comments";


@interface T24CategoryStoriesStats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24CategoryStoriesStats

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
            self.shares = [[self objectOrNilForKey:kT24CategoryStoriesStatsShares fromDictionary:dict] doubleValue];
            self.likes = [[self objectOrNilForKey:kT24CategoryStoriesStatsLikes fromDictionary:dict] doubleValue];
            self.interactions = [[self objectOrNilForKey:kT24CategoryStoriesStatsInteractions fromDictionary:dict] doubleValue];
            self.reads = [[self objectOrNilForKey:kT24CategoryStoriesStatsReads fromDictionary:dict] doubleValue];
            self.pageviews = [[self objectOrNilForKey:kT24CategoryStoriesStatsPageviews fromDictionary:dict] doubleValue];
            self.comments = [[self objectOrNilForKey:kT24CategoryStoriesStatsComments fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kT24CategoryStoriesStatsShares];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kT24CategoryStoriesStatsLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interactions] forKey:kT24CategoryStoriesStatsInteractions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reads] forKey:kT24CategoryStoriesStatsReads];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageviews] forKey:kT24CategoryStoriesStatsPageviews];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kT24CategoryStoriesStatsComments];

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

    self.shares = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsShares];
    self.likes = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsLikes];
    self.interactions = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsInteractions];
    self.reads = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsReads];
    self.pageviews = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsPageviews];
    self.comments = [aDecoder decodeDoubleForKey:kT24CategoryStoriesStatsComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_shares forKey:kT24CategoryStoriesStatsShares];
    [aCoder encodeDouble:_likes forKey:kT24CategoryStoriesStatsLikes];
    [aCoder encodeDouble:_interactions forKey:kT24CategoryStoriesStatsInteractions];
    [aCoder encodeDouble:_reads forKey:kT24CategoryStoriesStatsReads];
    [aCoder encodeDouble:_pageviews forKey:kT24CategoryStoriesStatsPageviews];
    [aCoder encodeDouble:_comments forKey:kT24CategoryStoriesStatsComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24CategoryStoriesStats *copy = [[T24CategoryStoriesStats alloc] init];
    
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
