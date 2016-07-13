//
//  T24StoryStats.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoryStats.h"


NSString *const kT24StoryStatsShares = @"shares";
NSString *const kT24StoryStatsLikes = @"likes";
NSString *const kT24StoryStatsInteractions = @"interactions";
NSString *const kT24StoryStatsReads = @"reads";
NSString *const kT24StoryStatsPageviews = @"pageviews";
NSString *const kT24StoryStatsComments = @"comments";


@interface T24StoryStats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoryStats

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
            self.shares = [[self objectOrNilForKey:kT24StoryStatsShares fromDictionary:dict] doubleValue];
            self.likes = [[self objectOrNilForKey:kT24StoryStatsLikes fromDictionary:dict] doubleValue];
            self.interactions = [[self objectOrNilForKey:kT24StoryStatsInteractions fromDictionary:dict] doubleValue];
            self.reads = [[self objectOrNilForKey:kT24StoryStatsReads fromDictionary:dict] doubleValue];
            self.pageviews = [[self objectOrNilForKey:kT24StoryStatsPageviews fromDictionary:dict] doubleValue];
            self.comments = [[self objectOrNilForKey:kT24StoryStatsComments fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kT24StoryStatsShares];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kT24StoryStatsLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interactions] forKey:kT24StoryStatsInteractions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reads] forKey:kT24StoryStatsReads];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageviews] forKey:kT24StoryStatsPageviews];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kT24StoryStatsComments];

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

    self.shares = [aDecoder decodeDoubleForKey:kT24StoryStatsShares];
    self.likes = [aDecoder decodeDoubleForKey:kT24StoryStatsLikes];
    self.interactions = [aDecoder decodeDoubleForKey:kT24StoryStatsInteractions];
    self.reads = [aDecoder decodeDoubleForKey:kT24StoryStatsReads];
    self.pageviews = [aDecoder decodeDoubleForKey:kT24StoryStatsPageviews];
    self.comments = [aDecoder decodeDoubleForKey:kT24StoryStatsComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_shares forKey:kT24StoryStatsShares];
    [aCoder encodeDouble:_likes forKey:kT24StoryStatsLikes];
    [aCoder encodeDouble:_interactions forKey:kT24StoryStatsInteractions];
    [aCoder encodeDouble:_reads forKey:kT24StoryStatsReads];
    [aCoder encodeDouble:_pageviews forKey:kT24StoryStatsPageviews];
    [aCoder encodeDouble:_comments forKey:kT24StoryStatsComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoryStats *copy = [[T24StoryStats alloc] init];
    
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
