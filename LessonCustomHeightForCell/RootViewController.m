//
//  RootViewController.m
//  LessonCustomHeightForCell
//
//  Created by 陈清源 on 15/5/1.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"
#import "PersonCell1.h"
#import "PerCell2.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)dealloc
{
    [_tableView release];
    [_persons release];
    [super dealloc];
}

- (void)editContacts
{
    [_tableView setEditing:YES animated:YES];
}
- (void)loadView
{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.title = @"Resume";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editContacts)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.view = _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Students" ofType:@"plist"];
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    _persons = [[NSMutableArray alloc] initWithCapacity:[array count]];
    
    for (NSDictionary *dic in array)
    {
        Person *person = [[Person alloc] init];
        
        [person setValuesForKeysWithDictionary:dic];
        
        [_persons addObject:person];
        
        [person release];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *p = _persons[indexPath.row];
    
    if ([p.sex isEqualToString:@"女"])
    {
        return [PerCell2 cellHeightForPerson:p];
    }
    else
    {
        return [PersonCell1 cellHeightForPerson:p] ;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_persons count];
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *p = _persons[indexPath.row];

    if ([p.sex isEqualToString:@"女"])
    {
        //使用样式2
        static NSString *reuseIdentifier = @"person2";
        
        PerCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        
        if (cell2 == nil)
        {
            cell2 = [[[PerCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
        }
        
        cell2.person = _persons[indexPath.row];
        
        return cell2;
    }
    else
    {
        //使用样式1
        static NSString *reuseIdentifier = @"person1";
        
        PersonCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        
        if (cell1 == nil)
        {
            cell1 = [[[PersonCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
        }
        
        cell1.person = _persons[indexPath.row];
        
        return cell1;
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return the rows that can be edit
    if ([[_persons[indexPath.row] sex] isEqualToString:@"女"]) {
        //不能删除女的
        return NO;
    }
    else return YES;
}
//return the style of the delete
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//commit delegate
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_persons removeObjectAtIndex:indexPath.row];
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"Students" ofType:@"plist"];
    
//    NSUserDefaults *userDefault = [[NSUserDefaults alloc]initWithSuiteName:path];
//    [userDefault removeObjectForKey:@"杨腾飞"];
    NSArray *array = [[NSArray alloc]initWithObjects:indexPath, nil];
    [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationLeft];
    [tableView setEditing:NO animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
