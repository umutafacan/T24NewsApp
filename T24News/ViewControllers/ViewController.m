//
//  ViewController.m
//  T24News
//
//  Created by umut on 7/11/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,HotNewsViewControllerDelegate,StoriesViewControllerDelegate>

#pragma mark - IBOutlets
@property (weak, nonatomic) IBOutlet UIView *viewNavigationBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewHotNews;

#pragma mark - Properties

@property (nonatomic,strong) StoriesViewController *storiesVC;
@property (nonatomic,strong) HotNewsViewController *hotNewsVC;

@property (nonatomic) int loadingCounter;

@end

@implementation ViewController

#pragma mark - LIFE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getChieldViewControllers];
    
    [self configureDelegates];
    [self configureScrollView];
    [[PopupManager sharedManager]showLoading:self completion:^{
        
    }];
    
    
    _loadingCounter = 0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Configurators

-(void)getChieldViewControllers
{
    for (UIViewController *vc in self.navigationController.viewControllers ) {
        if ([vc isKindOfClass:[HotNewsViewController class]]) {
            self.hotNewsVC = vc;
        }
        if ([vc isKindOfClass:[StoriesViewController class]]) {
            self.storiesVC = vc;
            
        }
    }
    

}
-(void)configureScrollView
{
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.height-40) )];

}

-(void)configureDelegates
{
    self.scrollView.delegate = self;
    self.hotNewsVC.delegate =self;
    self.storiesVC.delegate=self;
    

}


#pragma mark - ScrollViewDelegates


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{


}

#pragma mark - Chield Delegates

-(void)sendLoadingComplete
{
    _loadingCounter++;
    if (_loadingCounter == 2) {
        [[PopupManager sharedManager]removeAllPopups];
    }
}

-(void)sendLoadingFinished
{
    
    _loadingCounter++;
    if (_loadingCounter == 2) {
        [[PopupManager sharedManager]removeAllPopups];
    }

}


@end
