//
//  SSInfoView.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 7..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSInfoView.h"

@implementation SSInfoView
{
    UIImageView *photoView;
    UIView *background;
    UILabel *nameLabel, *gradeLabel, *dateLabel, *detailLabel;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        photoView = [[UIImageView alloc]init];
        [photoView setImage:[UIImage imageNamed:@"defaultPhoto.png"]];
        [photoView setFrame:CGRectMake(20, 20, 100, 100)];
        
        nameLabel  = [self makeLabel:nameLabel x:20 y:120 width:100 height:30 text:@"홍 길동" size:14.f];
        [nameLabel setTextAlignment:NSTextAlignmentCenter];
        
        gradeLabel = [self makeLabel:gradeLabel x:130 y:20 width:180 height:30 text:@"Trust" size:23.f];
        [gradeLabel setTextAlignment:NSTextAlignmentCenter];

        dateLabel = [self makeLabel:dateLabel x:130 y:50 width:180 height:20 text:@"2014년 3월 4일 인증됨" size:10.f];
        [dateLabel setTextAlignment:NSTextAlignmentCenter];
        
        detailLabel = [self makeLabel:detailLabel x:133 y:83 width:174 height:64 text:@"아무나 믿지마세요!" size:14.f];
        
        
        background = [[UIView alloc]initWithFrame:CGRectMake(130, 80, 180, 70)];
        [background setBackgroundColor:[UIColor whiteColor]];
        [background setAlpha:0.3f];
        
        
        
        [self addSubview:photoView];
        [self addSubview:background];
        
    }
    return self;
}

- (UILabel*)makeLabel:(UILabel*)label x:(CGFloat)x y:(CGFloat)y
                width:(CGFloat)width height:(CGFloat)height text:(NSString*)text size:(CGFloat)size
{
    label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [label setText:text];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:size]];
    [self addSubview:label];
    return label;
}

-(void)setDefaultValue:(NSString*)name
{
    
}

@end
