//
//  T24StoryAuthor.m
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T24StoryAuthor.h"
#import "T24StoryImages.h"


NSString *const kT24StoryAuthorName = @"name";
NSString *const kT24StoryAuthorAlias = @"alias";
NSString *const kT24StoryAuthorImages = @"images";


@interface T24StoryAuthor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T24StoryAuthor

@synthesize name = _name;
@synthesize alias = _alias;
@synthesize images = _images;


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
            self.name = [self objectOrNilForKey:kT24StoryAuthorName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kT24StoryAuthorAlias fromDictionary:dict];
            self.images = [T24StoryImages modelObjectWithDictionary:[dict objectForKey:kT24StoryAuthorImages]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kT24StoryAuthorName];
    [mutableDict setValue:self.alias forKey:kT24StoryAuthorAlias];
    [mutableDict setValue:[self.images dictionaryRepresentation] forKey:kT24StoryAuthorImages];

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

    self.name = [aDecoder decodeObjectForKey:kT24StoryAuthorName];
    self.alias = [aDecoder decodeObjectForKey:kT24StoryAuthorAlias];
    self.images = [aDecoder decodeObjectForKey:kT24StoryAuthorImages];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kT24StoryAuthorName];
    [aCoder encodeObject:_alias forKey:kT24StoryAuthorAlias];
    [aCoder encodeObject:_images forKey:kT24StoryAuthorImages];
}

- (id)copyWithZone:(NSZone *)zone
{
    T24StoryAuthor *copy = [[T24StoryAuthor alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
    }
    
    return copy;
}


@end
