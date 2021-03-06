//
//  ServiceManager.m
//  T24News
//
//  Created by umut on 7/11/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "ServiceManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation ServiceManager
+(ServiceManager *)sharedManager
{
    static ServiceManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{ _sharedManager = [[ServiceManager alloc]init];});
    
    return  _sharedManager;
}


-(id)init
{
    if (self) {
        
    }
    return self;
}

#pragma mark - Base URL
-(NSString *)baseServiceURL
{
    
    return @"http://t24.com.tr/api/v3/";

}

#pragma mark - AFManager Settings
- (AFSecurityPolicy *)securityPolicy {
    
    return [AFSecurityPolicy defaultPolicy];
    
}

- (AFHTTPRequestOperationManager *)generateManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = requestSerializer;
    
    return manager;
}


#pragma mark - HotNews

-(NSString *)urlHotNews
{
    
    return [NSString stringWithFormat:@"%@%@",[self baseServiceURL],@"stories.json?paging=1"];
    
}

-(void)fetchHotNewsWithCompletion:(completionStories)completion failure:(failure)failure
{
    AFHTTPRequestOperationManager *manager = [self generateManager];
    
    [manager GET:[self urlHotNews] parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             T24StoriesResponse *result = [[T24StoriesResponse alloc]initWithDictionary:(NSDictionary *)responseObject];
             
             if (result) {
                 
                 if (completion) {
                     completion(result);
                 }
             }else
             {
                 if (failure) {
                     failure(operation.error);
                 }
                 
             }
             
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
             
             
         }];
}


#pragma mark - Stories

-(NSString *)urlStoriesForPage:(int)page
{
    
    return [NSString stringWithFormat:@"%@%@%d",[self baseServiceURL],@"stories.json?paging=",page];
    
}

-(void)fetchStoriesAtPage:(int)page WithCompletion:(completionStories)completion failure:(failure)failure
{
    AFHTTPRequestOperationManager *manager = [self generateManager];
    
    [manager GET:[self urlStoriesForPage:page] parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             T24StoriesResponse *result = [[T24StoriesResponse alloc]initWithDictionary:(NSDictionary *)responseObject];
             
             if (result) {
                 
                 if (completion) {
                     completion(result);
                 }
             }else
             {
                 if (failure) {
                     failure(operation.error);
                 }
                 
             }
             
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
             
             
         }];
}


#pragma mark - Categories

-(NSString *)urlCategories
{
    
    return [NSString stringWithFormat:@"%@%@",[self baseServiceURL],@"categories.json?type=story"];
    
}

-(void)fetchCategoriesWithCompletion:(completionCategories)completion failure:(failure)failure
{
    AFHTTPRequestOperationManager *manager = [self generateManager];
    
    [manager GET:[self urlCategories] parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             T24CategoriesResponse *result = [[T24CategoriesResponse alloc]initWithDictionary:(NSDictionary *)responseObject];
             
             if (result) {
                 
                 if (completion) {
                     completion(result);
                 }
             }else
             {
                 if (failure) {
                     failure(operation.error);
                 }
                 
             }
             
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
             
             
         }];
}

#pragma mark - Categories

-(NSString *)urlCategoryStoriesAt:(int)categoryID
{
    
    return [NSString stringWithFormat:@"%@%@%d",[self baseServiceURL],@"stories.json?category=",categoryID];
    
}

-(void)fetchCategoryStoriesAt:(int)categoryID WithCompletion:(completionCategoryStories)completion failure:(failure)failure
{
    AFHTTPRequestOperationManager *manager = [self generateManager];
    
    [manager GET:[self urlCategories] parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             T24CategoryStoriesResponse *result = [[T24CategoryStoriesResponse alloc]initWithDictionary:(NSDictionary *)responseObject];
             
             if (result) {
                 
                 if (completion) {
                     completion(result);
                 }
             }else
             {
                 if (failure) {
                     failure(operation.error);
                 }
                 
             }
             
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
             
             
         }];
}


#pragma mark - Categories

-(NSString *)urlStorysWith:(int)storyID
{
    
    return [NSString stringWithFormat:@"%@%@%d",[self baseServiceURL],@"stories.json?story=",storyID];
    
}

-(void)fetchStoryWith:(int)storyID WithCompletion:(completionStory)completion failure:(failure)failure
{
    AFHTTPRequestOperationManager *manager = [self generateManager];
    
    [manager GET:[self urlStorysWith:storyID] parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             T24StoryResponse *result = [[T24StoryResponse alloc]initWithDictionary:(NSDictionary *)responseObject];
             
             if (result) {
                 
                 if (completion) {
                     completion(result);
                 }
             }else
             {
                 if (failure) {
                     failure(operation.error);
                 }
                 
             }
             
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
             
             
         }];
}






@end
