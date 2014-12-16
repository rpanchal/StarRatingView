//
//  RatingView.m
//  StarRatingView
//
//  Created by liaojinxing on 14-5-4.
//  Copyright (c) 2014年 jinxing. All rights reserved.
//

#import "StarRatingView.h"

static const CGFloat kDefaultStarWidth = 16.0f;

@interface StarRatingView ()


@property (nonatomic, strong) NSMutableArray *starButtons;

@end


@implementation StarRatingView

- (id)initWithFrame:(CGRect)frame
{
  return [self initWithFrame:frame rateEnabled:NO];
}

- (id)initWithFrame:(CGRect)frame rateEnabled:(BOOL)rateEnabled
{
  self = [super initWithFrame:frame];
  if (self) {
    _starButtons = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i++) {
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setFrame:frame];
      [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
      button.tag = i;
      [self addSubview:button];
      [_starButtons addObject:button];
    }

    self.starWidth = kDefaultStarWidth;
    self.rateEnabled = rateEnabled;
  }
  return self;
}


- (void)setStarWidth:(CGFloat)starWidth
{
  _starWidth = starWidth;
  for (int i = 0; i < _starButtons.count; i++) {
    UIButton *button = [_starButtons objectAtIndex:i];
    [button setFrame:CGRectMake(self.starWidth * i,
                                0,
                                self.starWidth,
                                self.starWidth)];
  }
}

- (void)setRateEnabled:(BOOL)rateEnabled
{
  _rateEnabled = rateEnabled;
  for (int i = 0; i < _starButtons.count; i++) {
    UIButton *button = [_starButtons objectAtIndex:i];
    [button setUserInteractionEnabled:_rateEnabled];
    if (_rateEnabled) {
      [button  addTarget:self
                  action:@selector(rate:)
        forControlEvents:UIControlEventTouchUpInside];
    }
  }
}

- (void)rate:(id)sender
{
  UIButton *button = (UIButton *)sender;
  [self setRating:button.tag + 1];
}

- (void)setRating:(CGFloat)rating
{
  _rating = rating;

  UIImage *starFull, *starHalf, *starEmpty;

  if (self.fullImage) {
    starFull = self.fullImage;
  } else {
    starFull = [UIImage imageNamed:@"ic_starred.png"];
  }

  if (self.halfImage) {
    starHalf = self.halfImage;
  } else {
    starHalf = [UIImage imageNamed:@"ic_starredhalf.png"];
  }

  if (self.emptyImage) {
    starEmpty = self.emptyImage;
  } else {
    starEmpty = [UIImage imageNamed:@"ic_starredept.png"];
  }

  int fullStars = floor(rating);
  int i;
  for (i = 0; i < fullStars; i++) {
    UIButton *button = [_starButtons objectAtIndex:i];
    [button setImage:starFull forState:UIControlStateNormal];
  }

  if (rating - fullStars >= 0.5) {
    UIButton *button = [_starButtons objectAtIndex:fullStars];
    [button setImage:starHalf forState:UIControlStateNormal];
    i++;
  }

  for (; i < 5; i++) {
    UIButton *button = [_starButtons objectAtIndex:i];
    [button setImage:starEmpty forState:UIControlStateNormal];
  }
}

@end
