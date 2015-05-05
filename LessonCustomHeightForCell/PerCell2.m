//
//  PerCell2.m
//  LessonCustomHeightForCell
//
//  Created by 陈清源 on 15/5/1.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import "PerCell2.h"
#import "Person.h"

@interface PerCell2 ()

+ (CGFloat)heightForString:(NSString *)str;

@end

@implementation PerCell2

- (void)dealloc
{
    [_headerImageView release];
    [_sexLabel release];
    [_nameLabel release];
    [_phoneLabel release];
    [_introduceLabel release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 10, 80, 120)];
        [self.contentView addSubview:_headerImageView];
        
        _sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        [self.contentView addSubview:_sexLabel];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 10, 150, 20)];
        [self.contentView addSubview:_nameLabel];
        
        _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 35, 210, 20)];
        [self.contentView addSubview:_phoneLabel];
        
        _introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 210, 70)];
        _introduceLabel.font = [UIFont systemFontOfSize:18];
        _introduceLabel.numberOfLines = 0;
        [self.contentView addSubview:_introduceLabel];
    }
    return self;
}

- (void)setPerson:(Person *)person
{
    if (_person != person)
    {
        [_person release];
        _person = [person retain];
        
        _headerImageView.image = [UIImage imageNamed:person.icon];
        _sexLabel.text = person.sex;
        _nameLabel.text = person.name;
        _phoneLabel.text = person.phoneNumber;
        _introduceLabel.text = person.introduce;
        _introduceLabel.frame = CGRectMake(10, 60, 210, [PerCell2 heightForString:person.introduce]);
    }
}

+ (CGFloat)heightForString:(NSString *)str
{
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:18],NSFontAttributeName, nil];
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(210, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
}

+ (CGFloat)cellHeightForPerson:(Person *)p
{
    //自我介绍Label的y值 + 自我介绍Label的 height + 最下面那块空白区域
    CGFloat height = 60 + [PerCell2 heightForString:p.introduce] + 10;
    
    return height > 140 ? height : 140;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
