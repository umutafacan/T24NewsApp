//
//  DetailViewController.h
//  T24News
//
//  Created by umut on 7/15/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFImageView.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet DFImageView *imageView;

@property (nonatomic,strong) T24StoryData *data;


@end
