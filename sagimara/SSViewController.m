//
//  SGViewController.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 7..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSViewController.h"
#import "SSSearchViewController.h"

@interface SSViewController ()

@end

@implementation SSViewController
{
    UITextField *searchField;
    UIButton *searchButton;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Hello,World!");
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(67, 117, 175, 60)];
    [label setText:@"Second Sight"];
    [label setFont:[UIFont systemFontOfSize:23.f]];
    [label setTextColor:[UIColor whiteColor]];
    
    searchField = [[UITextField alloc]initWithFrame:CGRectMake(37, 200, 200, 30)];
    [searchField setPlaceholder:@"휴대폰 번호를 입력하세요"];
    [searchField setBackgroundColor:[UIColor whiteColor]];
    
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(246, 200, 50, 30)];
    [searchButton setTitle:@"검색" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchButton setBackgroundColor:[UIColor colorWithRed:(CGFloat)226/256 green:(CGFloat)122/256 blue:(CGFloat)63/256 alpha:1]];
    [searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap:)];
    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)51/256 green:(CGFloat)77/256 blue:(CGFloat)87/256 alpha:1]];
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
    if([self isPhonNumber:searchField.text])
    {
        SSSearchViewController *searchViewController = [[SSSearchViewController alloc]initWithNibName:@"SSSearchViewController" bundle:nil];
        [self.navigationController pushViewController:searchViewController animated:YES];
    }
}
-(BOOL)isPhonNumber:(NSString*)text
{
    
    return YES;
}
@end
