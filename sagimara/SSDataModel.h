//
//  SSDataModel.h
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 9..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSearchViewController.h"
@interface SSDataModel : NSObject <NSURLConnectionDataDelegate>
+(SSDataModel*)getDataModel;
-(void)sendData :(NSString*)number;
-(void)sendData2 :(NSString*)number;
-(void)sendDataToLocalhost :(NSString*)number;
-(void)requestWebData;
-(NSDictionary*) getResponseData;
- (void)setSearchViewController:(SSSearchViewController*)searchViewController;
@end
