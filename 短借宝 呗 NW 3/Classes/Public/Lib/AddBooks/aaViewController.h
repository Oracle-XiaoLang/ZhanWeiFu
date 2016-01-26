//
//  aaViewController.h
//  dianhuaben
//
//  Created by iMac21 on 15/8/14.
//  Copyright (c) 2015年 iMac21. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableReloadDelegate.h"
#import "HMContact.h"
#import "BaseVC.h"
@class HMContact,aaViewController;


@protocol HMUTVCDelegate <NSObject>

@optional
- (void)HMUTVC:(aaViewController *)vc didSelectInfo:(NSString *)name phone:(NSString *)phone;

@end

@interface aaViewController : BaseVC<TableReloadDelegate>
@property (strong, nonatomic) UITableView *UITableView_table;
- (void) loadTable;
@property (nonatomic, retain) id<HMUTVCDelegate> delegate;



@end
