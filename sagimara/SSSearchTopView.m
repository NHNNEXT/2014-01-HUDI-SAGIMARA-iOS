//
//  SSInfoView.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 7..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSSearchTopView.h"

@implementation SSSearchTopView
{
    UIImageView *photoView;
    UIView *background;
    UILabel *gradeLabel, *dateLabel, *detailLabel;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        photoView = [[UIImageView alloc]init];
        [photoView setImage:[UIImage imageNamed:@"defaultPhoto.png"]];
        [photoView setFrame:CGRectMake(20, 20, 100, 100)];
        
        _nameLabel  = [self makeLabel:_nameLabel x:20 y:120 width:100 height:30 text:@"정보없음" size:14.f];
        [_nameLabel setTextAlignment:NSTextAlignmentCenter];
        
        gradeLabel = [self makeLabel:gradeLabel x:130 y:20 width:180 height:30 text:@"Warning" size:23.f];
        [gradeLabel setTextAlignment:NSTextAlignmentCenter];

        dateLabel = [self makeLabel:dateLabel x:130 y:50 width:180 height:20 text:@"인증 정보가 없습니다." size:10.f];
        [dateLabel setTextAlignment:NSTextAlignmentCenter];
        
        detailLabel = [self makeLabel:detailLabel x:133 y:83 width:174 height:64 text:@"당당하게 인증요청하세요!" size:14.f];
        
        
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

-(void)setGradeLabelValue:(NSString*)status
{
    [gradeLabel setText:status];
}

@end
