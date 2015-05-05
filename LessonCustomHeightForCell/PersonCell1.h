//
//  PersonCell1.h
//  LessonCustomHeightForCell
//
//  Created by 陈清源 on 15/5/1.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;

@interface PersonCell1 : UITableViewCell

@property (nonatomic, retain, readonly) UIImageView *headerImageView;

@property (nonatomic, retain, readonly) UILabel *nameLabel;

@property (nonatomic, retain, readonly) UILabel *phoneLabel;

@property (nonatomic, retain, readonly) UILabel *introduceLabel;

@property (nonatomic, retain) Person *person;

+ (CGFloat)cellHeightForPerson:(Person *)p;

@end
