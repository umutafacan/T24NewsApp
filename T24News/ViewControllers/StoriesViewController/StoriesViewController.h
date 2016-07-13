//
//  StoriesViewController.h
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoriesCollectionViewCell.h"

@protocol StoriesViewControllerDelegate <NSObject>

-(void)sendLoadingFinished;

@end

@interface StoriesViewController : UIViewController

@property (nonatomic,weak) id<StoriesViewControllerDelegate> delegate;

@end
