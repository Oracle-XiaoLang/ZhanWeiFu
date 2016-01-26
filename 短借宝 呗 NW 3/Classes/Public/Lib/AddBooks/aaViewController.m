//
//  aaViewController.m
//  dianhuaben
//
//  Created by iMac21 on 15/8/14.
//  Copyright (c) 2015年 iMac21. All rights reserved.
//

#import "aaViewController.h"
#import "JSONKit.h"
#import "ContactViewDataSource.h"
#import "AFNetworking.h"
#import "HMContact.h"
@interface aaViewController ()<UITableViewDelegate>{
    
    float width,heig;
}

@end

@implementation aaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    width=[[UIScreen mainScreen] bounds].size.width;
    
    heig=[[UIScreen mainScreen] bounds].size.height;
    
    _UITableView_table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, heig-64)];
    
    [self.view addSubview:_UITableView_table];
    
    // Do any additional setup after loading the view from its nib.
    [self loadTable];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    HMContact *contactTWO=[[HMContact alloc]init];
    contactTWO.name=cell.textLabel.text;
    contactTWO.num=cell.detailTextLabel.text;
    
    [self.delegate HMUTVC:self didSelectInfo:contactTWO.name phone:contactTWO.num];
    
    [self.navigationController popViewControllerAnimated:YES];

    
//    NSLog(@"%@",cell.textLabel.text);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadTable{
    ContactViewDataSource * tableDataSource = [ContactViewDataSource getDatasource];
    tableDataSource.delegate = self;
    self.UITableView_table.dataSource = tableDataSource;
    self.UITableView_table.delegate=self;
}
-(void)reload{
    [self.UITableView_table reloadData];
    self.UITableView_table.delegate = self;

}

@end
