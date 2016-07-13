//
//  HotNewsViewController.h
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotNewsCollectionViewCell.h"
@class HotNewsViewController;

@protocol HotNewsViewControllerDelegate <NSObject>
-(void)sendLoadingComplete;


@end


@interface HotNewsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,retain) id<HotNewsViewControllerDelegate> delegate;

@end
