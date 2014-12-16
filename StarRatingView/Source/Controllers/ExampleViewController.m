//
//  ExampleViewController.m
//  StarRatingView
//
//  Created by liaojinxing on 14-5-4.
//  Copyright (c) 2014年 jinxing. All rights reserved.
//

#import "ExampleViewController.h"
#import "StarRatingView.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor grayColor]];
  
  StarRatingView *ratingView = [[StarRatingView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 50, 20)];
  ratingView.rateEnabled = YES;
  ratingView.starWidth = 30.0f;
  // set image
  ratingView.fullImage = [UIImage imageNamed: @"ic_starwhite.png"];
  ratingView.halfImage = [UIImage imageNamed:@"ic_starwhitehalf.png"];
  ratingView.emptyImage = [UIImage imageNamed:@"ic_starwhiteept"];
  
  
  ratingView.rating = 4.0f;
  [self.view addSubview:ratingView];
}

@end
