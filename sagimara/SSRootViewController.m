//
//  SGViewController.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 7..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSRootViewController.h"
#import "SSSearchViewController.h"

@interface SSRootViewController ()

@end

@implementation SSRootViewController
{
    UITextField *searchField;
    UIButton *searchButton;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //View 배경색 변경
    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)77/256 blue:(CGFloat)87/256 alpha:1]];
    
    //로고 Label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(67, 117, 175, 60)];
    [label setText:@"Second Sight"];
    [label setFont:[UIFont systemFontOfSize:23.f]];
    [label setTextColor:[UIColor whiteColor]];
    
    //검색창
    searchField = [[UITextField alloc]initWithFrame:CGRectMake(37, 200, 200, 30)];
    [searchField setPlaceholder:@"휴대폰 번호를 입력하세요"];
    [searchField setBackgroundColor:[UIColor whiteColor]];
    
    //검색 버튼
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(246, 200, 50, 30)];
    [searchButton setTitle:@"검색" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //아무대나 터치하면 키보드 감추기
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap:)];
    
    //뷰 삽입
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:label];
    [self.view addSubview:searchField];
    [self.view addSubview:searchButton];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didTap:(UITapGestureRecognizer*)rec
{
    [searchField resignFirstResponder];
}
-(void)searchClick:(UITapGestureRecognizer*)rec
{
    //폰넘버 정상 데이터인지 확인 부분 (정상일시 View 전환 :SSSearchViewController)
    if([self isPhonNumber:searchField.text])
    {
        SSSearchViewController *searchViewController = [[SSSearchViewController alloc]initWithNibName:@"SSSearchViewController" bundle:nil];
        [self.navigationController pushViewController:searchViewController animated:YES];
    }
}

//폰넘버 체크 (향후 구현)
-(BOOL)isPhonNumber:(NSString*)text
{
    
    return YES;
}
@end
