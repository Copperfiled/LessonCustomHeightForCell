//
//  Person.m
//  LessonCustomHeightForCell
//
//  Created by 陈清源 on 15/5/1.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_icon release];
    [_name release];
    [_phoneNumber release];
    [_sex release];
    [_introduce release];
    [super dealloc];
}

@end
