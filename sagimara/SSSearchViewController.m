//
//  SSSearchViewController.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 8..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSSearchViewController.h"
#import "SSInfoView.h"
#import "SSTouchBlock.h"
@interface SSSearchViewController ()

@end

@implementation SSSearchViewController
{
    UIScrollView *scrollView;
    SSInfoView* infoView;
    SSTouchBlock *todayInfo,*locationInfo,*watchInfo,*notifyInfo;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //뷰사이즈 받아오기
    CGSize viewSize = self.view.bounds.size;
    CGFloat halfWidth = viewSize.width/2;
    
    //배경색 설정
    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)77/256 blue:(CGFloat)87/256 alpha:1]];
    
    //스크롤뷰 생성
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    scrollView.contentSize = CGSizeMake(viewSize.width, viewSize.height);
    //infoView생성
    infoView = [[SSInfoView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, 160)];
    
    //중단 버튼 2개 생성 및 설정(reconfirmButton, tradeHistoryButton)
    UIButton *reconfirmButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 160, halfWidth, 40)];
    UIButton *tradeHistoryButton = [[UIButton alloc]initWithFrame:CGRectMake(halfWidth, 160, halfWidth, 40)];
    [reconfirmButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [tradeHistoryButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [reconfirmButton setTitle:@"재인증 요청" forState:UIControlStateNormal];
    [tradeHistoryButton setTitle:@"거래내역 보기" forState:UIControlStateNormal];
    
    //infoView 배경색 설정 및 데이터 변경 (향후 추가 구현!)
    [self insertDataIntoInfoView];
    
    //뷰에 스크롤뷰 넣고, 스크롤뷰에 뷰들 넣기
    [self.view addSubview:scrollView];
    [scrollView addSubview:infoView];
    [scrollView addSubview:reconfirmButton];
    [scrollView addSubview:tradeHistoryButton];

    //하단 4개 버튼 만들기
    todayInfo    = [self makeTouchBlock:todayInfo x:0 y:200 width:halfWidth height:100];
    locationInfo = [self makeTouchBlock:locationInfo x:halfWidth y:200 width:halfWidth height:100];
    watchInfo    = [self makeTouchBlock:watchInfo x:0 y:300 width:halfWidth height:100];
    notifyInfo   = [self makeTouchBlock:notifyInfo x:halfWidth y:300 width:halfWidth height:100];
    
    //하단 4개 버튼 초기값
    [todayInfo setDefaultValue:@"Today" image:[UIImage imageNamed:@"bg_today.png"] content:@"99"];
    [locationInfo setDefaultValue:@"Location" image:[UIImage imageNamed:@"bg_location.png"] content:@"경기도 성남시"];
    [watchInfo setDefaultValue:@"Watch" image:[UIImage imageNamed:@"bg_watch.png"] content:@"3"];
    [notifyInfo setDefaultValue:@"Notify" image:[UIImage imageNamed:@"bg_notify.png"] content:@"0"];
    
    //값 변경 TEST
    [todayInfo setContentText:@"12345"];
}

- (void)insertDataIntoInfoView
{
    [infoView setBackgroundColor:[UIColor colorWithRed:(CGFloat)69/256 green:(CGFloat)178/256 blue:(CGFloat)157/256 alpha:1]];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (SSTouchBlock*)makeTouchBlock:(SSTouchBlock*)block x:(CGFloat)x y:(CGFloat)y
                 width:(CGFloat)width height:(CGFloat) height
{
    block = [[SSTouchBlock alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [scrollView addSubview:block];
    return block;
}
@end
