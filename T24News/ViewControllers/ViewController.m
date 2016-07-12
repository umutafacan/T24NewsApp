//
//  ViewController.m
//  T24News
//
//  Created by umut on 7/11/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

#pragma mark - IBOutlets
@property (weak, nonatomic) IBOutlet UIView *viewNavigationBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewHotNews;

#pragma mark - Properties

@property (nonatomic,strong) StoriesViewController *storiesVC;
@property (nonatomic,strong) HotNewsViewController *hotNewsVC;


@end

@implementation ViewController

#pragma mark - LIFE
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDelegates];
    [self configureScrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Configurators

-(void)configureScrollView
{
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.height-40) )];

}

-(void)configureDelegates
{
    self.scrollView.delegate = self;
    

}


#pragma mark - ScrollViewDelegates


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{


}

@end
