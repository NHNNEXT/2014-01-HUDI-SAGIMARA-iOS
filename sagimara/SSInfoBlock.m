//
//  SSTouchBlock.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 8..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSInfoBlock.h"

@implementation SSInfoBlock
{
    UIButton *touchButton;
    UILabel *titleLabel;
    UILabel *contentLabel;
    UIImageView *backgroundImage;
    UIImageView *signal;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:(CGFloat)222/256 green:(CGFloat)222/256 blue:(CGFloat)222/256 alpha:1]];
        CGSize size =  frame.size;

        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, size.width, 20)];
        [titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [titleLabel setTextColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)51/256 blue:(CGFloat)51/256 alpha:1]];
        [titleLabel setAlpha:0.3];

        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, size.width, size.height-20)];
        [contentLabel setTextAlignment:NSTextAlignmentCenter];
        [contentLabel setFont:[UIFont systemFontOfSize:20.f]];
        [contentLabel setTextColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)51/256 blue:(CGFloat)51/256 alpha:1]];
        
        backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 15, size.width-60, size.height-10)];
        touchButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];

        signal = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 10, 10)];
        
        [self addSubview:titleLabel];
        [self addSubview:contentLabel];
        [self addSubview:backgroundImage];
        [self addSubview:touchButton];
        [self addSubview:signal];
    }
    return self;
}

-(void)setSignal:(int)flag
{
    switch (flag) {
        case 0:
            [signal setImage:[UIImage imageNamed:@"flag_danger.png"]];
            break;
        case 1:
            [signal setImage:[UIImage imageNamed:@"flag_warn.png"]];
            break;
        case 2:
            [signal setImage:[UIImage imageNamed:@"flag_trust.png"]];
            break;
        default:
            break;
    }
}
-(void)setContentText:(NSString*)text
{
    [contentLabel setText:text];
}

-(void)setDefaultValue:(NSString*)title image:(UIImage*)img content:(NSString*)content
{
    [titleLabel setText:title];
    [contentLabel setText:content];
    [signal setImage:[UIImage imageNamed:@"flag_warn.png"]];
    [backgroundImage setImage:img];
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [touchButton addTarget:target action:action forControlEvents:controlEvents];
}


@end
