//
//  SSDataModel.m
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 9..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import "SSDataModel.h"


@implementation SSDataModel 
{
    NSDictionary *_responseData;
    SSSearchViewController * _searchViewController;
}
    static SSDataModel* dataModel;

+(SSDataModel*)getDataModel{

    if (dataModel ==nil) {
        dataModel = [[SSDataModel alloc]init];
    }
    return dataModel;
}


- (void)setSearchViewController:(SSSearchViewController*)searchViewController
{
    _searchViewController = searchViewController;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    _responseData = [NSJSONSerialization
             JSONObjectWithData:data
             options:NSJSONReadingMutableContainers error:nil];
//    NSString *returnString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    
//    
//    NSLog(@"string : %@",returnString);
    NSLog(@"%@",_responseData);
    NSString *name = [_responseData objectForKey:@"profile_phone"];
    NSLog(@"model = %@",name);

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:_responseData forKey:@"jsonData"];
    [notificationCenter postNotificationName:@"serverData" object:self userInfo:dic];
    
}
- (NSDictionary*) getResponseData
{
    return _responseData;
}
-  (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

}


-(void)sendData2 :(NSString*)number
{
    _responseData = nil;
    NSString *smsURL = @"http://10.73.45.133:8080/test";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *post = [NSString stringWithFormat:@"id=%@",number];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    [request setURL:[NSURL URLWithString:smsURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    [NSURLConnection connectionWithRequest:request delegate:self ];
}
-(void)sendDataToLocalhost :(NSString*)number
{
    _responseData = nil;

    NSString *smsURL = @"http://localhost:8080/test";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *post = [NSString stringWithFormat:@"id=%@",number];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    [request setURL:[NSURL URLWithString:smsURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    [NSURLConnection connectionWithRequest:request delegate:self ];
}

-(void)sendData :(NSString*)number
{
    
    NSString *aURLString = @"http://10.73.45.133:8080/test";
    
    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSMutableURLRequest *aRequest = [NSMutableURLRequest requestWithURL:aURL];
    [aRequest setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"form-data; boundary=%@",boundary];
    [aRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"id"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", number] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [aRequest setHTTPBody:body];
    [NSURLConnection connectionWithRequest:aRequest delegate:self ];
}

@end
