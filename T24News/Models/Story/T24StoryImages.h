//
//  T24StoryImages.h
//
//  Created by   on 7/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface T24StoryImages : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *box;
@property (nonatomic, strong) NSString *list;
@property (nonatomic, strong) NSString *grid;
@property (nonatomic, strong) NSString *page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
