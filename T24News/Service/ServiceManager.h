//
//  ServiceManager.h
//  T24News
//
//  Created by umut on 7/11/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void (^completion) (void);
typedef void (^failure)(NSError *error);


typedef void (^completionStories) (T24StoriesResponse* response);
typedef void (^completionCategories) (T24CategoriesResponse* response);
typedef void (^completionCategoryStories) (T24CategoryStoriesResponse* response);
typedef void (^completionStory) (T24StoryResponse* response);

@interface ServiceManager : NSObject




@end
