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
    SSInfoView* infoView;
    int a;
    SSTouchBlock *todayInfo,*locationInfo,*watchInfo,*notifyInfo;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize viewSize = self.view.bounds.size;
    CGFloat halfWidth = viewSize.width/2;
    NSLog(@"%f",halfWidth);
    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)77/256 blue:(CGFloat)87/256 alpha:1]];
    
    infoView = [[SSInfoView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, 220)];
    UIButton *reconfirmButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 220, halfWidth, 40)];
    UIButton *tradeHistoryButton = [[UIButton alloc]initWithFrame:CGRectMake(halfWidth, 220, halfWidth, 40)];
    [reconfirmButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [tradeHistoryButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [reconfirmButton setTitle:@"재인증 요청" forState:UIControlStateNormal];
    [tradeHistoryButton setTitle:@"거래내역 보기" forState:UIControlStateNormal];
    
    [self insertDataIntoInfoView];
    [self.view addSubview:infoView];
    [self.view addSubview:reconfirmButton];
    [self.view addSubview:tradeHistoryButton];

    todayInfo    = [self makeTouchBlock:todayInfo x:0 y:260 width:halfWidth height:100];
    locationInfo = [self makeTouchBlock:locationInfo x:halfWidth y:260 width:halfWidth height:100];
    watchInfo    = [self makeTouchBlock:watchInfo x:0 y:360 width:halfWidth height:100];
    notifyInfo   = [self makeTouchBlock:notifyInfo x:halfWidth y:360 width:halfWidth height:100];
    
    [todayInfo setDefaultValue:@"Today" image:[UIImage imageNamed:@"bg_today.png"] content:@"99"];
    [locationInfo setDefaultValue:@"Location" image:[UIImage imageNamed:@"bg_location.png"] content:@"경기도 성남시"];
    [watchInfo setDefaultValue:@"Watch" image:[UIImage imageNamed:@"bg_watch.png"] content:@"3"];
    [notifyInfo setDefaultValue:@"Notify" image:[UIImage imageNamed:@"bg_notify.png"] content:@"0"];
    
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
    [self.view addSubview:block];
    return block;
}
@end
