//
//  SSTouchBlock.h
//  sagimara
//
//  Created by  byung-woo Lee on 2014. 4. 8..
//  Copyright (c) 2014년 nhnnext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSTouchBlock : UIView

-(void)setContentText:(NSString*)text;
-(void)setDefaultValue:(NSString*)title image:(UIImage*)img content:(NSString*)content;
-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
