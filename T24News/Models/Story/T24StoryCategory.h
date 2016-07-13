//
//  T24StoryCategory.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface T24StoryCategory : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *categoryIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *alias;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
