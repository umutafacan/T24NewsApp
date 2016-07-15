//
//  DetailViewController.m
//  T24News
//
//  Created by umut on 7/15/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation DetailViewController

#pragma mark - Life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelTitle.text = _data.title;
    
    [self configureViews];
    [self configureScrollView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configurator

-(void)configureScrollView
{
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 627)];
    
    

}

-(void)configureViews
{
    
    _imageView.allowsAnimations=YES;
    _imageView.managesRequestPriorities=YES;
    [_imageView prepareForReuse];
    //image url's are broken somehow it needs to refinish more
    [_imageView setImageWithResource:[NSURL URLWithString:_data.images.page] targetSize:_imageView.frame.size contentMode:DFImageContentModeAspectFill options:nil];
    




}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
