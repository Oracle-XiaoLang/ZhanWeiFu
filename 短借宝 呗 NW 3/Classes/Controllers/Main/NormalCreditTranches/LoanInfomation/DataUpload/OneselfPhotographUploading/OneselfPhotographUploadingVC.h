//
//  OneselfPhotographUploadingVC.h
//  短借宝
//
//  Created by Mr.于小秋 on 15/7/14.
//  Copyright (c) 2015年 com.appleyf. All rights reserved.
//

#import "BaseVC.h"
@protocol tupianDelegate3 <NSObject>

@optional

-(void)tu3;

@end

@interface OneselfPhotographUploadingVC : BaseVC

@property (retain ,nonatomic)id<tupianDelegate3>delegate;

@end
