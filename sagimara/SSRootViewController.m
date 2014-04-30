//
//  SGViewController.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 7..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSRootViewController.h"
#import "SSSearchViewController.h"
#import "SSDataModel.h"

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
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90, 120, 175, 60)];
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

-(IBAction)searchClick:(id)sender
{
    //Trim
    NSString* temp = [searchField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    searchField.text = temp;
    
    if([self isPhonNumber:searchField.text])
    {
         [self performSegueWithIdentifier:@"Search" sender:self];
    }else{
        /*
         *
         * 정상적인 폰번호가 아닐때 에러 출력
         *
        */
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Search"]) {
        SSSearchViewController *sv = [segue destinationViewController];
        [sv waitingForData];
        [[SSDataModel getDataModel]sendDataToLocalhost:searchField.text];
    }
}

//폰넘버 체크 (향후 구현)
-(BOOL)isPhonNumber:(NSString*)text
{
    if([text isEqual:@""]){
        NSLog(@"phonNember is null");
        return NO;
    }
    
    return YES;
}
@end
