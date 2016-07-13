//
//  ServiceManager.h
//  T24News
//
//  Created by umut on 7/11/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - Blocks
typedef void (^completion) (void);
typedef void (^failure)(NSError *error);
typedef void (^completionStories) (T24StoriesResponse* response);
typedef void (^completionCategories) (T24CategoriesResponse* response);
typedef void (^completionCategoryStories) (T24CategoryStoriesResponse* response);
typedef void (^completionStory) (T24StoryResponse* response);

@interface ServiceManager : NSObject

#pragma mark - Init
+(ServiceManager *)sharedManager;
-(id)init;


-(void)fetchHotNewsWithCompletion:(completionStories)completion failure:(failure)failure;
-(void)fetchStoriesAtPage:(int)page WithCompletion:(completionStories)completion failure:(failure)failure;
-(void)fetchCategoriesWithCompletion:(completionCategories)completion failure:(failure)failure;
-(void)fetchCategoryStoriesAt:(int)categoryID WithCompletion:(completionCategoryStories)completion failure:(failure)failure;
-(void)fetchStoryWith:(int)storyID WithCompletion:(completionStory)completion failure:(failure)failure;


@end
