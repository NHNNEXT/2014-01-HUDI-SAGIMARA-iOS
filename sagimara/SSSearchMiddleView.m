//
//  SSSearchMiddleView.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 10..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSSearchMiddleView.h"
#import "SSInfoBlock.h"
@implementation SSSearchMiddleView
{
    NSMutableArray *infoBlocks;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize viewSize = frame.size;
        CGFloat halfWidth = viewSize.width/2;
        
        //중단 버튼 2개 생성 및 설정(reconfirmButton, tradeHistoryButton)
        UIButton *reconfirmButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, halfWidth, 40)];
        UIButton *tradeHistoryButton = [[UIButton alloc]initWithFrame:CGRectMake(halfWidth, 0, halfWidth, 40)];
        [reconfirmButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)51/256 blue:(CGFloat)51/256 alpha:1]];
        [tradeHistoryButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)51/256 blue:(CGFloat)51/256 alpha:1]];
        [reconfirmButton setTitle:@"재인증 요청" forState:UIControlStateNormal];
        [tradeHistoryButton setTitle:@"거래내역 보기" forState:UIControlStateNormal];
        
        UIImageView *button_partition = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_partition.png"]];
        [button_partition setFrame:CGRectMake(halfWidth, 0, 1, 40)];
        [button_partition setAlpha: 0.3f];
        
        [self addSubview:reconfirmButton];
        [self addSubview:tradeHistoryButton];
        [self addSubview:button_partition];
        
        //infoBlock 4개 만들기
        infoBlocks = [[NSMutableArray alloc]initWithCapacity:4];
        [self makeInfoBlockAt:0 x:0 y:40 width:halfWidth height:100];
        [self makeInfoBlockAt:1 x:halfWidth y:40 width:halfWidth height:100];
        [self makeInfoBlockAt:2 x:0 y:140 width:halfWidth height:100];
        [self makeInfoBlockAt:3 x:halfWidth y:140 width:halfWidth height:100];
        
        //infoBlock 4개 초기값
        [[infoBlocks objectAtIndex:0] setDefaultValue:@"Today" image:[UIImage imageNamed:@"bg_today.png"] content:@"0"];
        [[infoBlocks objectAtIndex:1] setDefaultValue:@"Location" image:[UIImage imageNamed:@"bg_location.png"] content:@"위치정보 없음"];
        [[infoBlocks objectAtIndex:2] setDefaultValue:@"Watch" image:[UIImage imageNamed:@"bg_watch.png"] content:@"0"];
        [[infoBlocks objectAtIndex:3] setDefaultValue:@"Notify" image:[UIImage imageNamed:@"bg_notify.png"] content:@"0"];
        


    }
    return self;
}
- (void)makeInfoBlockAt:(int)index x:(CGFloat)x y:(CGFloat)y
                          width:(CGFloat)width height:(CGFloat) height
{
    SSInfoBlock *infoBlock = [[SSInfoBlock alloc] initWithFrame:CGRectMake(x, y, width, height)];
    infoBlock.layer.borderColor = [UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)51/256 blue:(CGFloat)51/256 alpha:0.3].CGColor;
    infoBlock.layer.borderWidth = 0.25f;
    
    [infoBlocks insertObject:infoBlock atIndex:index];
    [self addSubview:infoBlock];
}
-(void)insertIntoInfoBlockName:(int)block text:(NSString*)value signal:(int)sig
{
    [[infoBlocks objectAtIndex:block] setContentText:value];
    [[infoBlocks objectAtIndex:block] setSignal:sig];
    
}
@end
