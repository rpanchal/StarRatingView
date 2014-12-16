//
//  RatingView.h
//  StarRatingView
//
//  Created by liaojinxing on 14-5-4.
//  Copyright (c) 2014年 jinxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarRatingView : UIView

- (id)initWithFrame:(CGRect)frame rateEnabled:(BOOL)rateEnabled;

// star configuration
@property (nonatomic, assign) CGFloat starWidth;
@property (nonatomic, assign) BOOL rateEnabled;

@property (nonatomic, strong) UIImage *fullImage;
@property (nonatomic, strong) UIImage *halfImage;
@property (nonatomic, strong) UIImage *emptyImage;

// star image
@property (nonatomic, assign) CGFloat rating;


@end
