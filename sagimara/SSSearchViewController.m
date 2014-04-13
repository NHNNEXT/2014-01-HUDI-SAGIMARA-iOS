//
//  SSSearchViewController.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 8..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSSearchViewController.h"
#import "SSSearchTopView.h"
#import "SSSearchMiddleView.h"
#import "SSSearchBottomView.h"
#import "SSDataModel.h"

@interface SSSearchViewController ()

@end

@implementation SSSearchViewController
{
    UIScrollView *scrollView;
    SSSearchTopView *topView;
    SSSearchMiddleView *middleView;
    SSSearchBottomView *bottomView;
    UISearchBar *search;
    UIActivityIndicatorView *indicatiorView;
    SSDataModel *dataModel;
}
enum infoBlock{
    TODAY = 0,
    LOCATION = 1,
    WATCH = 2,
    NOTIFY= 3
};
- (void)viewDidLoad
{
    [super viewDidLoad];
    //뷰사이즈 받아오기
    CGSize viewSize = self.view.bounds.size;

    
    //배경색 설정
    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)77/256 blue:(CGFloat)87/256 alpha:1]];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(searchBarButtonClick:)];
    self.navigationItem.rightBarButtonItem = searchButton ;
    
    //UIView *indicatiorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    indicatiorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    [indicatiorView setBackgroundColor:[UIColor grayColor]];
    [indicatiorView setAlpha:0.6f];
    [indicatiorView startAnimating];
    [dataModel setSearchViewController:self];
    
    //스크롤뷰 생성
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    
    //View생성
    topView = [[SSSearchTopView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, 160)];
    middleView = [[SSSearchMiddleView alloc]initWithFrame:CGRectMake(0, topView.frame.size.height, viewSize.width, 240)];
    bottomView = [[SSSearchBottomView alloc]initWithFrame:CGRectMake(0, topView.frame.size.height+middleView.frame.size.height, viewSize.width, 300)];
    
    //infoView 배경색 설정 및 데이터 변경 (향후 추가 구현!)
    [self insertDataIntoInfoView:2];
    
    //뷰에 스크롤뷰 넣고, 스크롤뷰에 뷰들 넣기
    [self.view addSubview:scrollView];
    [scrollView addSubview:topView];
    [scrollView addSubview:middleView];
    [scrollView addSubview:bottomView];
    scrollView.contentSize = CGSizeMake(viewSize.width, topView.frame.size.height + middleView.frame.size.height + bottomView.frame.size.height);


    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap:)];
    search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, viewSize.width, 35)];
    search.hidden= YES;
    [self.view addSubview: search];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:indicatiorView];
}

- (void)insertDataIntoInfoView:(int)status
{
    switch (status) {
        case 0:
            [topView setBackgroundColor:[UIColor colorWithRed:(CGFloat)223/256 green:(CGFloat)90/256 blue:(CGFloat)73/256 alpha:1]];
            break;
        case 1:
            [topView setBackgroundColor:[UIColor colorWithRed:(CGFloat)255/256 green:(CGFloat)204/256 blue:(CGFloat)51/256 alpha:1]];
            break;
        case 2:
            [topView setBackgroundColor:[UIColor colorWithRed:(CGFloat)69/256 green:(CGFloat)178/256 blue:(CGFloat)157/256 alpha:1]];
            break;
            
        default:
            break;
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchBarButtonClick:(id)sender
{
    if(search.hidden){
        CGRect newFrame = scrollView.frame;
        newFrame.origin.y += 35;
        newFrame.size.height-=35;
        scrollView.frame = newFrame;
    }else{
        CGRect newFrame = scrollView.frame;
        newFrame.origin.y -= 35;
        newFrame.size.height += 35;
        scrollView.frame = newFrame;
    }
    
    
    search.hidden = !search.hidden;
}
-(void)didTap:(UITapGestureRecognizer*)rec
{
    [search resignFirstResponder];
}
-(void)stopIndicatiorView :(NSDictionary*)data
{
    
   NSString *name = [data objectForKey:@"profile_phone"];
    [topView setName:name];
    [indicatiorView stopAnimating];
    indicatiorView = nil;
    
    if(data!=nil){
    //값 변경 TEST
    [middleView insertIntoInfoBlockName:TODAY
                                   text:[data objectForKey:@"profile_inquiry"]
                                 signal:2];
    [middleView insertIntoInfoBlockName:LOCATION
                                   text:[data objectForKey:@"profile_location"]
                                 signal:2];
    [middleView insertIntoInfoBlockName:WATCH
                                   text:[data objectForKey:@"profile_verification"]
                                 signal:1];
    [middleView insertIntoInfoBlockName:NOTIFY
                                   text:[data objectForKey:@"profile_video"]
                                 signal:0];
    [self insertDataIntoInfoView:(int)[data objectForKey:@"profile_status"]];
        
    }
}
@end
