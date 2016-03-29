//
//  ViewController.m
//  SlideImage
//
//  Created by gsh on 16/3/29.
//  Copyright © 2016年 gsh. All rights reserved.
//

#import "ViewController.h"
#import "SHGImageHeaderView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    SHGImageHeaderView *headerView = [[[NSBundle mainBundle]loadNibNamed:@"SHGImageHeaderView" owner:self options:nil] firstObject];
    headerView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH * 9.0f/16.0f);
    [headerView setDataSource:@[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg"]];
    [self.view addSubview:headerView];
    headerView.timeInterval = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
