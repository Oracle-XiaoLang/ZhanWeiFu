//
//  LeftAtPresentBorrowMoneyVC.m
//  短借宝
//
//  Created by iMac21 on 15/7/20.
//  Copyright (c) 2015年 com.appleyf. All rights reserved.
//

#import "LeftAtPresentBorrowMoneyVC.h"
#import "MJRefresh.h"
#import "MJRefreshFooterView.h"
#import "MJRefreshHeaderView.h"
#import "AFNetworking.h"
#import "JSONKit.h"

#import "Header.h"

@interface LeftAtPresentBorrowMoneyVC (){
    
    float width,heig;
    
    
    UIImageView *img1;
    UIImageView *img2;
    UIImageView *img3;
    UIImageView *img4;
    UIImageView *img5;
    
    UIView *shux1;
    UIView *shux2;
    UIView *shux3;
    UIView *shux4;
    UIView *shux5;
    UIView *shux6;
    UIView *shux7;
    UIView *shux8;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *image1;

@property (weak, nonatomic) IBOutlet UIView *image2;

@property (weak, nonatomic) IBOutlet UIView *image3;

@property (weak, nonatomic) IBOutlet UIImageView *image4;

@property (weak, nonatomic) IBOutlet UIView *image5;

@property (weak, nonatomic) IBOutlet UIView *image6;

@property (weak, nonatomic) IBOutlet UIImageView *image7;

@property (weak, nonatomic) IBOutlet UIView *image8;

@property (weak, nonatomic) IBOutlet UIView *image9;

@property (weak, nonatomic) IBOutlet UIImageView *image10;

@property (weak, nonatomic) IBOutlet UIView *image11;

@property (weak, nonatomic) IBOutlet UIView *image12;

@property (weak, nonatomic) IBOutlet UIImageView *image13;

@end

@implementation LeftAtPresentBorrowMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    width=[[UIScreen mainScreen] bounds].size.width;
    heig=[[UIScreen mainScreen] bounds].size.height;
    
    _JieKuanJinE=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 0, 120, 30)];
    _JieKuanJinE.font=[UIFont systemFontOfSize:14.0f];
    _JieKuanJinE.textAlignment=NSTextAlignmentRight;
    
    _JieKuanJinE.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_JieKuanJinE];
    
    _HuanKuanTianShu=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 25, 120, 30)];
    _HuanKuanTianShu.font=[UIFont systemFontOfSize:14.0f];
    
    _HuanKuanTianShu.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    _HuanKuanTianShu.textAlignment=NSTextAlignmentRight;
    
    [self.view addSubview:_HuanKuanTianShu];
    
    _JieKuanFeiYong=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 52, 120, 30)];
    _JieKuanFeiYong.font=[UIFont systemFontOfSize:14.0f];
    _JieKuanFeiYong.textAlignment=NSTextAlignmentRight;
    
    _JieKuanFeiYong.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_JieKuanFeiYong];
    
    _HuanKuanJinE=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 81, 120, 30)];
    _HuanKuanJinE.font=[UIFont systemFontOfSize:14.0f];
    _HuanKuanJinE.textAlignment=NSTextAlignmentRight;
    
    _HuanKuanJinE.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_HuanKuanJinE];
    
    _DaoZhangJinE=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 110, 120, 30)];
    _DaoZhangJinE.font=[UIFont systemFontOfSize:14.0f];
    _DaoZhangJinE.textAlignment=NSTextAlignmentRight;
    
    _DaoZhangJinE.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_DaoZhangJinE];
    
    _JieKuanShiJian=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 139, 120, 30)];
    _JieKuanShiJian.font=[UIFont systemFontOfSize:14.0f];
    _JieKuanShiJian.textAlignment=NSTextAlignmentRight;
    
    _JieKuanShiJian.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_JieKuanShiJian];
    
    _HuanKuanShiJian=[[UILabel alloc] initWithFrame:CGRectMake(width-148, 170, 120, 30)];
    _HuanKuanShiJian.font=[UIFont systemFontOfSize:14.0f];
    
    _HuanKuanShiJian.textAlignment=NSTextAlignmentRight;
    
    _HuanKuanShiJian.textColor=[UIColor colorWithRed:97.0/255 green:97.0/255 blue:97.0/255 alpha:1.0f];
    
    [self.view addSubview:_HuanKuanShiJian];
    
    
    UIScrollView *scl=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 210, width, heig-210-64)];
    
    scl.contentSize=CGSizeMake(width, 280);
    
    scl.backgroundColor=[UIColor whiteColor];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:scl];
    
    
    img1=[[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 30, 10, 10)];
    
    img1.image=[UIImage imageNamed:@"dangqianjiekuan_07"];
    
    shux1=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 42, 2, 21)];
    shux1.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
 
    //
    
    shux2=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 63, 2, 21)];
    shux2.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    img2=[[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 86, 10, 10)];
    img2.image=[UIImage imageNamed:@"dangqianjiekuan_08"];

    shux3=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 98, 2, 21)];
    shux3.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    //
    
    shux4=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 119, 2, 21)];
    shux4.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    img3=[[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 142, 10, 10)];
    img3.image=[UIImage imageNamed:@"dangqianjiekuan_08"];

    
    shux5=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 154, 2, 21)];
    shux5.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
   //
    
    shux6=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 175, 2, 21)];
    shux6.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    img4=[[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 198, 10, 10)];
    img4.image=[UIImage imageNamed:@"dangqianjiekuan_08"];

    
    shux7=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 210, 2, 21)];
    shux7.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
   //
    
    shux8=[[UIView alloc] initWithFrame:CGRectMake((width-100)/2+4, 231, 2, 21)];
    shux8.backgroundColor=[UIColor colorWithRed:162.0/255.0 green:166.0/255.0 blue:176.0/255.0 alpha:1.0];
    
    img5=[[UIImageView alloc] initWithFrame:CGRectMake((width-100)/2, 254, 10, 10)];
    img5.image=[UIImage imageNamed:@"dangqianjiekuan_08"];

    
    
    [scl addSubview:img1];
    [scl addSubview:img2];
    [scl addSubview:img3];
    [scl addSubview:img4];
    [scl addSubview:img5];
    [scl addSubview:shux1];
    [scl addSubview:shux2];
    [scl addSubview:shux3];
    [scl addSubview:shux4];
    [scl addSubview:shux5];
    [scl addSubview:shux6];
    [scl addSubview:shux7];
    [scl addSubview:shux8];
    
    
        
    UILabel *lls=[[UILabel alloc] initWithFrame:CGRectMake((width-100)/2+40, 20, 60, 30)];
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
        lls.font=[UIFont systemFontOfSize:14 weight:2];
    else
        lls.font=[UIFont systemFontOfSize:14];
 
    
    lls.textColor=[UIColor blackColor];
    
    lls.text=@"借款申请";
    
    [scl addSubview:lls];
    
    UILabel *lls1=[[UILabel alloc] initWithFrame:CGRectMake((width-100)/2+40, 77, 60, 30)];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
        lls1.font=[UIFont systemFontOfSize:14 weight:2];
    else
        lls1.font=[UIFont systemFontOfSize:14];
    
    lls1.textColor=[UIColor blackColor];
    
    lls1.text=@"审核中";
    
    [scl addSubview:lls1];
    
    UILabel *lls2=[[UILabel alloc] initWithFrame:CGRectMake((width-100)/2+40, 133, 60, 30)];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
        lls2.font=[UIFont systemFontOfSize:14 weight:2];
    else
        lls2.font=[UIFont systemFontOfSize:14];
    
    lls2.textColor=[UIColor blackColor];
    
    lls2.text=@"已放款";
    
    [scl addSubview:lls2];
    
    UILabel *lls3=[[UILabel alloc] initWithFrame:CGRectMake((width-100)/2+40, 189, 80, 30)];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
        lls3.font=[UIFont systemFontOfSize:14 weight:2];
    else
        lls3.font=[UIFont systemFontOfSize:14];
    
    lls3.textColor=[UIColor blackColor];
    
    lls3.text=@"已申请还款";
    
    [scl addSubview:lls3];
    
    UILabel *lls4=[[UILabel alloc] initWithFrame:CGRectMake((width-100)/2+40, 245, 60, 30)];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
        lls4.font=[UIFont systemFontOfSize:14 weight:2];
    else
        lls4.font=[UIFont systemFontOfSize:14];
    lls4.textColor=[UIColor blackColor];
    
    lls4.text=@"借款还清";
    
    [scl addSubview:lls4];

    
    
    
    
    NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
        
       [self DangQianDaiKuan];
    
}

- (IBAction)popR:(UIBarButtonItem *)sender {

    [self.navigationController popToRootViewControllerAnimated:YES];
 
}
-(void)DangQianDaiKuan
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:[defaults3 objectForKey:@"zhid"],@"zhid",@"1",@"pagenumber",nil];
    
    NSString *strJson = [dataDictionary JSONString];
    //    NSLog(@"%@",strJson);
    
    NSString *url = [NSString stringWithFormat:@"%@androidIndexAction!selectdqjk.action",networkAddress];
    
    NSString *url1=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"url--%@",url1);
    
    [manager POST:url1 parameters:@{@"keyword":strJson} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",operation.responseObject);
                
        if ([operation.responseObject count]==0) {
            
        }else{
        
        if ([responseObject[0] objectForKey:@"cwfkbs"]==NULL) {
            
            
        }else{
        
        [defaults3 setObject:[responseObject[0] objectForKey:@"id"] forKey:@"DaiKuanXinXiID"];
            
//            [defaults3 setObject:[responseObject[0] objectForKey:@"DaiKuanShiFouKeYi"] forKey:@"Z"];
         
            
            [defaults3 setObject:[responseObject[0] objectForKey:@"cwfkbs"] forKey:@"ZhuangTai"];
            
            [defaults3 setObject:[responseObject[0] objectForKey:@"hksq"] forKey:@"ShenQing"];
            
            [defaults3 setObject:[responseObject[0] objectForKey:@"jkqx"] forKey:@"Tianshu"];
            
            
        //借款金额
        NSString *jkje=[NSString stringWithFormat:@"%@元",[responseObject[0] objectForKey:@"jkje"]];
        self.JieKuanJinE.text=jkje;
        //还款天数
        NSString *jkts=[NSString stringWithFormat:@"%@天",[responseObject[0] objectForKey:@"jkqx"]];
        self.HuanKuanTianShu.text=jkts;
            
        //借款费用
            float jblv=[[responseObject[0] objectForKey:@"jblv"] floatValue];
        NSString *jkfy=[NSString stringWithFormat:@"%.2f元",[jkje intValue]*jblv/1000*[jkts intValue]];

        self.JieKuanFeiYong.text=jkfy;
            
        self.HuanKuanJinE.text=jkje;

            
        //还款金额
            
            NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
            
            NSTimeInterval a=[dat timeIntervalSince1970]*1000;
            
            NSString *timeString = [NSString stringWithFormat:@"%f", a];
            
            int ts=[[responseObject[0] objectForKey:@"jkqx"] intValue];
            
        if ([[responseObject[0] objectForKey:@"fksj"] intValue]>0) {
           
            
            int v=(([timeString intValue]-[[responseObject[0] objectForKey:@"fksj"] intValue])/86400000-ts);
         
            
            if(v>0){
                
                if (v<16-ts) {
                    
                    self.HuanKuanJinE.text=[NSString stringWithFormat:@"%.2f",[[responseObject[0] objectForKey:@"jkje"] floatValue]+10+[[responseObject[0] objectForKey:@"jkje"] floatValue]*v*[[responseObject[0] objectForKey:@"wylv1"] floatValue]/1000+[[responseObject[0] objectForKey:@"jkje"]intValue]*ts*[[responseObject[0] objectForKey:@"jblv"] floatValue]/1000] ;
                    
                    self.JieKuanFeiYong.text=[NSString stringWithFormat:@"%.2f",10+[[responseObject[0] objectForKey:@"jkje"] floatValue]*v*[[responseObject[0] objectForKey:@"wylv1"] floatValue]/1000+[[responseObject[0] objectForKey:@"jkje"]intValue]*ts*[[responseObject[0] objectForKey:@"jblv"] floatValue]/1000];

                }
                else{
                    self.HuanKuanJinE.text=[NSString stringWithFormat:@"%.2f",
                                            ([[responseObject[0] objectForKey:@"jkje"] intValue]+
                                            10+[[responseObject[0] objectForKey:@"jkje"]intValue]*ts*[[responseObject[0] objectForKey:@"jblv"] floatValue]/1000+
                                            [[responseObject[0] objectForKey:@"jkje"] intValue]*15*[[responseObject[0] objectForKey:@"wylv1"] floatValue]/1000+
                                            [[responseObject[0] objectForKey:@"jkje"] intValue]*[[responseObject[0] objectForKey:@"wylv2"] floatValue]/1000*(v-15))] ;
                    
                    self.JieKuanFeiYong.text=[NSString stringWithFormat:@"%.2f",
                                              (10+[[responseObject[0] objectForKey:@"jkje"]intValue]*ts*[[responseObject[0] objectForKey:@"jblv"] floatValue]/1000+
                                               [[responseObject[0] objectForKey:@"jkje"] intValue]*15*[[responseObject[0] objectForKey:@"wylv1"] floatValue]/1000+
                                               [[responseObject[0] objectForKey:@"jkje"] intValue]*[[responseObject[0] objectForKey:@"wylv2"] floatValue]/1000*(v-15))] ;
                    
                }
                
                
            }else{
                
                    self.HuanKuanJinE.text=jkje;
                    self.JieKuanFeiYong.text=jkfy;
                
            }
                
                
            }
            
            
        //到账金额
//        NSString *dzje=[NSString stringWithFormat:@"%@元",[responseObject[0] objectForKey:@"jkje"]];
            self.DaoZhangJinE.text=[NSString stringWithFormat:@"%.2f元",[[responseObject[0] objectForKey:@"jkje"] floatValue]-[[responseObject[0] objectForKey:@"sxf"] floatValue]];
        
        //借款时间
//        NSString *jksh=[NSString stringWithFormat:@"%@天",[responseObject[0] objectForKey:@"sqsj"]];
         
            NSString *str=[responseObject[0] objectForKey:@"sqsj"];//时间戳
            

    
            
            
            NSTimeInterval time=[str longLongValue]/1000;//因为时差问题要加8小时 == 28800 sec
            NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
            
            //实例化一个NSDateFormatter对象
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
            
            NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
            
        self.JieKuanShiJian.text=currentDateStr;
        
        //还款时间
            
//        NSString *hksj=[NSString stringWithFormat:@"%@天",[responseObject[0] objectForKey:@"hksq"]];
            
          //  NSString *str1=[NSString stringWithFormat:@"%ld",(long)([[responseObject[0] objectForKey:@"yhksj"] integerValue]+[[responseObject[0] objectForKey:@"jkqx"] integerValue]*86400000)];//时间戳
            
 NSString *str1=[responseObject[0] objectForKey:@"yhksj"];//时间戳
            
            
            
    // 保存借到歀时间
            
            [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"JKSJ" ];
            
            [[NSUserDefaults standardUserDefaults]setObject:str1 forKey:@"DKSJ" ];
            
    //
            
            NSTimeInterval time1=[str1 longLongValue]/1000;//因为时差问题要加8小时 == 28800 sec
            NSDate *detaildate1=[NSDate dateWithTimeIntervalSince1970:time+[jkts intValue]*24*60*60];
            
            //实例化一个NSDateFormatter对象
            NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter1 setDateFormat:@"yyyy年MM月dd日"];
            
            NSString *currentDateStr1 = [dateFormatter1 stringFromDate: detaildate1];
           
                self.HuanKuanShiJian.text=currentDateStr1;
            
            NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
            
            
            if ([[defaults3 objectForKey:@"DaiKuanShiFouKeYi"]  intValue]==1) {
                
                shux2.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
                img2.image=[UIImage imageNamed:@"dangqianjiekuan_07"];
                
                shux3.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
            }
            
            
            if ([[defaults3 objectForKey:@"ZhuangTai"] intValue]==1) {
                
                shux4.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
                img3.image=[UIImage imageNamed:@"dangqianjiekuan_07"];
                
                shux5.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
                
            }
            else{
                
//                _JieKuanJinE.text=@"元";
//                _HuanKuanTianShu.text=@"天";
//                _JieKuanFeiYong.text=@"元";
//                _HuanKuanJinE.text=@"元";
//                _DaoZhangJinE.text=@"元";
//                _JieKuanShiJian.text=@"";
//                _HuanKuanShiJian.text=@"";
                
                
            }
            
            if ([[defaults3 objectForKey:@"ShenQing"] intValue]==1) {
               shux6.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
                img4.image=[UIImage imageNamed:@"dangqianjiekuan_07"];
                
                shux7.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:95.0/255.0 blue:100.0/255.0 alpha:1.0];
                
            }
            
            
            [self ShiFouFeYiDaiKuan];
            

    }
        
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];


}

-(void)ShiFouFeYiDaiKuan
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:[defaults3 objectForKey:@"zhid"],@"zhid",nil];
    //    NSLog(@"%@",[defaults3 objectForKey:@"zhid"]);
    
    NSString *strJson = [dataDictionary JSONString];
    //    NSLog(@"%@",strJson);
    
    NSString *url = [NSString stringWithFormat:@"%@androidIndexAction!queryHydk_flag.action",networkAddress];
    
    NSString *url1=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"url--%@",url1);
    
    [manager POST:url1 parameters:@{@"keyword":strJson} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Success----: %@", responseObject);
        //        NSLog(@"Success: %@", [responseObject[0] objectForKey:@"flag"]);
        
       // if ([[responseObject[0] objectForKey:@"flag"] intValue]==0)
       // {
            [defaults3 setObject:[responseObject[0] objectForKey:@"flag"] forKey:@"DaiKuanShiFouKeYi"];
            [defaults3 setObject:[responseObject[0] objectForKey:@"massages"] forKey:@"DaiKuanShuChuXinXi"];
        
        if ([[defaults3 objectForKey:@"DaiKuanShiFouKeYi"] intValue]==0) {
            
                            _JieKuanJinE.text=@"元";
                            _HuanKuanTianShu.text=@"天";
                            _JieKuanFeiYong.text=@"元";
                            _HuanKuanJinE.text=@"元";
                            _DaoZhangJinE.text=@"元";
                            _JieKuanShiJian.text=@"";
                            _HuanKuanShiJian.text=@"";

            
        }
            
            
       // }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
