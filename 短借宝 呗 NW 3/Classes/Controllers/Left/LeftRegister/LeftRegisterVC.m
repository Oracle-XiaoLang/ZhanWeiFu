//
//  LeftRegisterVC.m
//  短借宝
//
//  Created by iMac21 on 15/7/20.
//  Copyright (c) 2015年 com.appleyf. All rights reserved.
//

#import "LeftRegisterVC.h"
#import "LeftEnrollVC.h"
#import "AFNetworking.h"
#import "SBJson.h"
#import "Networking.h"
#import "MBProgressHUD.h"
#import "MainVC.h"
#import "LeftVC.h"
#import "JSONKit.h"

#import "Header.h"

#import "APService.h"
#import "Wangjimima.h"


@interface LeftRegisterVC ()<phoneDelegate>{
    
    MBProgressHUD *HUD;
    
    float width,heig;
    
}

@property (strong, nonatomic)  UIImageView *DuiHao;
@property (strong, nonatomic)  UIButton *DianJiShiJian;

@property (strong, nonatomic)  UITextField *phone;

@property (strong, nonatomic)  UITextField *password;

@end

@implementation LeftRegisterVC

//-(void)name:(NSString *)name password:(NSString *)password
//{
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    
//    NSDictionary*myDic=[defaults dictionaryForKey:@"myDictionary"];
//    
//    
//    self.phone.text=name;
//    
//    
////    NSLog(@"aaaa%@",name);
//    NSLog(@"%@",self.phone.text);
//    
//}

- (IBAction)up_zhuce:(UIBarButtonItem *)sender {
    
    LeftEnrollVC* left3=[self.storyboard instantiateViewControllerWithIdentifier:@"LeftEnroll"];
    
    left3.delegate=self;
    

    
    [self.navigationController
     pushViewController:left3 animated:YES];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    width=[[UIScreen mainScreen] bounds].size.width;
    
    heig=[[UIScreen mainScreen] bounds].size.height;
    
    
    UIView *vvv=[[UIView alloc] initWithFrame:CGRectMake(0, 20, width, 80)];
    
    vvv.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:vvv];
    
    
    UIView *vvv1=[[UIView alloc] initWithFrame:CGRectMake(0, 61, width, 1)];
    
    vvv1.backgroundColor=[UIColor colorWithRed:215.0/255 green:215.0/255 blue:215.0/255 alpha:1.0f];
    
    [self.view addSubview:vvv1];
    
    
    UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(20, 31, 15, 22)];
    
    img1.image=[UIImage imageNamed:@"zhuce_03.png"];
    
    [self.view addSubview:img1];
    
    UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake(20, 71, 15, 22)];
    
    img2.image=[UIImage imageNamed:@"zhuce_10.png"];
    
    [self.view addSubview:img2];
    
    
    _phone=[[UITextField alloc] initWithFrame:CGRectMake(69, 20, 251, 41)];
    _phone.placeholder=@"请输入手机号码";
    
    _phone.font=[UIFont systemFontOfSize:15];
    
    [self.view addSubview:_phone];
    
    _password=[[UITextField alloc] initWithFrame:CGRectMake(69, 62, 251, 41)];
    _password.placeholder=@"请输入密码";
    
    _password.secureTextEntry=YES; 
    
    _password.font=[UIFont systemFontOfSize:15];
    
    [self.view addSubview:_password];
    
    
    _DianJiShiJian=[[UIButton alloc] initWithFrame:CGRectMake(25, 120, 116, 30)];
    
    
    [_DianJiShiJian setTitle:@"自动登录" forState:UIControlStateNormal];
    
    [_DianJiShiJian setTitleColor:[UIColor colorWithRed:97.0/255 green:97.0/255  blue:97.0/255  alpha:1.0f] forState:UIControlStateNormal];
    _DianJiShiJian.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    
    [_DianJiShiJian addTarget:self action:@selector(RememberThePassword:) forControlEvents:UIControlEventTouchUpInside];
    _DianJiShiJian.tag=11;
    
//    NSUserDefaults *defaults2=[NSUserDefaults standardUserDefaults];
//    
//    [defaults2 setObject:@"0" forKey:@"tag"];
    
    [self.view addSubview:_DianJiShiJian];
    
    _DuiHao=[[UIImageView alloc] initWithFrame:CGRectMake(30, 127, 16, 16)];
    
    _DuiHao.image=[UIImage imageNamed:@"denglu_15"];
    
    [self.view addSubview:_DuiHao];
    
//    if (width==414) {
//        
//        _DianJiShiJian.frame=CGRectMake(25, 142, 116, 30);
//        _DuiHao.frame=CGRectMake(30, 150, 16, 16);
//    }

    
    
    UIButton *deng=[[UIButton alloc] initWithFrame:CGRectMake(16, 174, width-32, 40)];
    
    [deng setTitle:@"登录" forState:UIControlStateNormal];
    
    [deng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    deng.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    
    deng.backgroundColor=[UIColor colorWithRed:0 green:204.0/255 blue:176.0/255 alpha:1.0f];
    
    
    [deng addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [deng.layer setCornerRadius:5.0f];
    
    [self.view addSubview:deng];
    
  UIButton  *forget=[[UIButton alloc] initWithFrame:CGRectMake(width-126, 120, 116, 30)];
    
    
    [forget setTitle:@"忘记密码？" forState:UIControlStateNormal];
    
    [forget setTitleColor:[UIColor colorWithRed:97.0/255 green:97.0/255  blue:97.0/255  alpha:1.0f] forState:UIControlStateNormal];
    forget.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    
    [forget addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:forget];
    
    
    
    
  
    NSUserDefaults *defaults1=[NSUserDefaults standardUserDefaults];
    
     self.DuiHao.hidden=NO;
    // self.DuiHao.image=[UIImage imageNamed:@"denglu_18.png"];
    
    if ([[defaults1 objectForKey:@"tag"]intValue]==1) {
        
        self.DuiHao.image=[UIImage imageNamed:@"denglu_15.png"];
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        NSDictionary*myDic=[defaults dictionaryForKey:@"myDictionary"];
        
        
        self.password.text=[myDic valueForKey:@"pass"];
    }
    else {
        
        self.DuiHao.image=[UIImage imageNamed:@"denglu_18.png"];
        
        self.password.text=@"";
    }
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSDictionary*myDic=[defaults dictionaryForKey:@"myDictionary"];
    
    self.phone.text=[myDic valueForKey:@"name"];
    
    [self.phone addTarget:self action:@selector(changePhone) forControlEvents:UIControlEventEditingChanged];
    [self.password addTarget:self action:@selector(changepassword) forControlEvents:UIControlEventEditingChanged];
    
    
}

-(void)forgetPassword{
    
    Wangjimima *ww=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"wangjimima"];
    
    [self.navigationController pushViewController:ww animated:YES];
}

-(void)changePhone
{
    int MaxLen = 11;
    NSString* szText = [_phone text];
    if ([_phone.text length]> MaxLen)
    {
        _phone.text = [szText substringToIndex:MaxLen];
    }
}

-(void)changepassword{
    int MaxLen = 14;
    NSString* szText = [_password text];
    if ([_password.text length]> MaxLen)
    {
        _password.text = [szText substringToIndex:MaxLen];
    }
    
}



- (void)onClick:(id)sender
{
    ((UIButton *)sender).selected = YES;
    
}
- (IBAction)cancel:(UIBarButtonItem *)sender {
    
[self.navigationController popToRootViewControllerAnimated:YES];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@YES forKey:@"yes"];
    
}
- (void)RememberThePassword:(UIButton *)sender {
    if (sender.tag == 10) {
        //    获取注册的值
        
        //self.DuiHao.hidden=NO;
        self.DuiHao.image=[UIImage imageNamed:@"denglu_15.png"];
        
        sender.tag = 11;
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        [defaults setObject:@"1" forKey:@"tag"];
        
    }else{
        
       // self.DuiHao.hidden=YES;
        self.DuiHao.image=[UIImage imageNamed:@"denglu_18.png"];
        
        //self.password.text=@"";
        
        sender.tag = 10;
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        [defaults setObject:@"0" forKey:@"tag"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {

    HUD=[[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:HUD];
    
    
    HUD.mode =MBProgressHUDModeIndeterminate;
    
    HUD.labelText =@"正在加载...";
    
    HUD.margin = 10.f;
    
    //HUD.dimBackground=YES;
    
    [HUD show:YES];

    [self logincode];
   
}

-(void)logincode{
    
    NSString *name = self.phone.text;
    //获得密码输入框中的文字
    NSString *password = self.password.text;
    
    //    上传用户注册
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    
    //    NSUserDefaults *defaults2=[NSUserDefaults standardUserDefaults];
    //
    //    NSDictionary*myDic2=[defaults2 dictionaryForKey:@"myDictionary"];
    
    //    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:[myDic2 valueForKey:@"name"],@"username",[myDic2 valueForKey:@"pass"],@"password",nil];
    
    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:name,@"username",password,@"password",nil];
    
    
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    
    NSString *jasonString = [writer stringWithObject:dataDictionary];
    
     
    
    NSString *url2 = [NSString stringWithFormat:@"%@androidLogAction!login.action?login=%@",networkAddress,jasonString];
    
    NSString *url1=[url2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //    NSLog(@"url--%@",url2);
    
    [manager POST:url1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"aaaaaa%@",responseObject);
        
        [HUD hide:YES];
        
        [HUD removeFromSuperview];
        
        HUD=nil;

        
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        //系统自带JSON解析
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        //        NSLog(@"%@",resultDic);
        
        //        NSLog(@"%@",[resultDic objectForKey:@"flag"]);
        
        
        NSDictionary *dic=[resultDic objectForKey:@"hyxx"];
        
        NSDictionary *dic1=[resultDic objectForKey:@"hyzh"];
        
        //        NSLog(@"%@",dic1);
        
        if ( [[resultDic objectForKey:@"flag"] integerValue]==1) {
            
            // 保存key
            
            
            [APService setAlias:name callbackSelector:nil object:nil];
    
            
            NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
            
            
            [defaults3 setObject:[NSString stringWithFormat:@"%@",[resultDic objectForKey:@"key"]] forKey:@"kkkey"];
            
            //flag   判断0或1   登录
            [defaults3 setObject:[resultDic objectForKey:@"flag"] forKey:@"true"];
            //个人信息页面
#warning 个人信息页面
            //            所在大学
            [defaults3 setObject:[dic objectForKey:@"sfzh"] forKey:@"GeRenXinXi_ShenFenZhenHao_Field"];//身份证号
            [defaults3 setObject:[dic objectForKey:@"id"] forKey:@"id"];//会员id
            [defaults3 setObject:[dic objectForKey:@"zhid"] forKey:@"zhid"];//会员账号id
            
            
            if ([[dic objectForKey:@"szdx"]  isEqualToString:@"null"]||[[dic objectForKey:@"skrxm"] isEqualToString:@"null"]) {
                
                [defaults3 setObject:@"" forKey:@"JiaTingZhuZhi"];
                
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_ShengShiQu_Field"];//地址
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_ShengRi_Field"];//生日
                [defaults3 setObject:@""forKey:@"FangJianHao"];//房间号
                [defaults3 setObject:@"" forKey:@"XUeHao"];//会员学号
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_Name_Field"];//会员姓名
                [defaults3 setObject:@"" forKey:@"xingbie"];//性别
                [defaults3 setObject:@"" forKey:@"SuSheDiZhi"];//宿舍地址
                [defaults3 setObject:@"" forKey:@"GongYuHao"];//宿舍楼号
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_BanJi_Field"];//所在班级
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_SuoZaiDaXue_Field"];//所在大学
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_SuoZaiZhuanYe_Field"];//所在专业
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_XueXinWangMiMai_Field"];//学信网密码
                [defaults3 setObject:@"" forKey:@"GeRenXinXi_XueXinWangZhangHao_Field"];//学信网账号
                //联系人页面
#warning 联系人页面
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_DaoYuanName_Field"];//紧急联系人导员姓名
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_DaoYuanPhoneNum_Field"];//紧急联系人导员手机号
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_XueShengName_Field"];//紧急联系人同学1姓名
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_XueShengPhoneNum_Field"];//紧急联系人同学1手机号
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_XueShengName2_Field"];//紧急联系人同学2姓名
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_XueShengPhoneNum2_Field"];//紧急联系人同学2手机号
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_PhoneNum_Field"];//紧急联系人（父&母）电话号
                [defaults3 setObject:@"" forKey:@"fumu"];//紧急联系人选择（父&母）
                [defaults3 setObject:@"" forKey:@"LianXiRenXinXi_Name_Field"];//紧急联系人（父&母）姓名
                //银行卡信息页面
#warning 银行卡信息页面
                [defaults3 setObject:@"" forKey:@"YinHangKaXinXi_KaiHuRenXingMing_Field"];//收款姓名
                [defaults3 setObject:@"" forKey:@"bank"];//收款银行
                [defaults3 setObject:@"" forKey:@"YinHangKaXinXi_YinHangKaHao_Field"];//收款银行卡号
                [defaults3 setObject:@"" forKey:@"YinHangKaXinXi_KaiHuMingCheng_Field"];
                //照片资料页面
#warning 照片资料页面
                [defaults3 setObject:@"" forKey:@"zjz1"];//身份证
                [defaults3 setObject:@"" forKey:@"zjz2"];//学生证
                [defaults3 setObject:@"" forKey:@"zjz3"];//个人自拍
            }else{
                
                [defaults3 setObject:[dic objectForKey:@"jtzz"] forKey:@"JiaTingZhuZhi"];
                
                [defaults3 setObject:[dic objectForKey:@"address"] forKey:@"GeRenXinXi_ShengShiQu_Field"];//地址
                [defaults3 setObject:[dic objectForKey:@"csrq"] forKey:@"GeRenXinXi_ShengRi_Field"];//生日
                [defaults3 setObject:[dic objectForKey:@"fjh"] forKey:@"FangJianHao"];//房间号
                [defaults3 setObject:[dic objectForKey:@"xl"] forKey:@"XUeHao"];//会员学号
                [defaults3 setObject:[dic objectForKey:@"hyxm"] forKey:@"GeRenXinXi_Name_Field"];
                //会员姓名
                //[defaults3 setObject:[dic objectForKey:@"id"] forKey:@"id"];//会员id
                [defaults3 setObject:[dic objectForKey:@"sex"] forKey:@"xingbie"];//性别
                [defaults3 setObject:[dic objectForKey:@"sfzh"] forKey:@"GeRenXinXi_ShenFenZhenHao_Field"];//身份证号
                [defaults3 setObject:[dic objectForKey:@"ssdz"] forKey:@"SuSheDiZhi"];//宿舍地址
                [defaults3 setObject:[dic objectForKey:@"sslh"] forKey:@"GongYuHao"];//宿舍楼号
                [defaults3 setObject:[dic objectForKey:@"szbj"] forKey:@"GeRenXinXi_BanJi_Field"];//所在班级
                [defaults3 setObject:[dic objectForKey:@"szdx"] forKey:@"GeRenXinXi_SuoZaiDaXue_Field"];//所在大学
                [defaults3 setObject:[dic objectForKey:@"szzy"] forKey:@"GeRenXinXi_SuoZaiZhuanYe_Field"];//所在专业
                //        [defaults3 setObject:[dic objectForKey:@"zhid"] forKey:@"zhid"];//会员账号id
                [defaults3 setObject:[dic objectForKey:@"xxwps"] forKey:@"GeRenXinXi_XueXinWangMiMai_Field"];//学信网密码
                [defaults3 setObject:[dic objectForKey:@"xxwzh"] forKey:@"GeRenXinXi_XueXinWangZhangHao_Field"];//学信网账号
                //联系人页面
#warning 联系人页面
                [defaults3 setObject:[dic objectForKey:@"jjlxr_dy"] forKey:@"LianXiRenXinXi_DaoYuanName_Field"];//紧急联系人导员姓名
                [defaults3 setObject:[dic objectForKey:@"jjlxr_dysjh"] forKey:@"LianXiRenXinXi_DaoYuanPhoneNum_Field"];//紧急联系人导员手机号
                [defaults3 setObject:[dic objectForKey:@"jjlxr_tx1"] forKey:@"LianXiRenXinXi_XueShengName_Field"];//紧急联系人同学1姓名
                [defaults3 setObject:[dic objectForKey:@"jjlxr_tx1sjh"] forKey:@"LianXiRenXinXi_XueShengPhoneNum_Field"];//紧急联系人同学1手机号
                [defaults3 setObject:[dic objectForKey:@"jjlxr_tx2"] forKey:@"LianXiRenXinXi_XueShengName2_Field"];//紧急联系人同学2姓名
                [defaults3 setObject:[dic objectForKey:@"jjlxr_tx2sjh"] forKey:@"LianXiRenXinXi_XueShengPhoneNum2_Field"];//紧急联系人同学2手机号
                [defaults3 setObject:[dic objectForKey:@"lxrdh"] forKey:@"LianXiRenXinXi_PhoneNum_Field"];//紧急联系人（父&母）电话号
                [defaults3 setObject:[dic objectForKey:@"lxrgx"] forKey:@"fumu"];//紧急联系人选择（父&母）
                [defaults3 setObject:[dic objectForKey:@"lxrxm"] forKey:@"LianXiRenXinXi_Name_Field"];//紧急联系人（父&母）姓名
                //银行卡信息页面
#warning 银行卡信息页面
                [defaults3 setObject:[dic objectForKey:@"skrxm"] forKey:@"YinHangKaXinXi_KaiHuRenXingMing_Field"];//收款姓名
                [defaults3 setObject:[dic objectForKey:@"skyh"] forKey:@"bank"];//收款银行
                [defaults3 setObject:[dic objectForKey:@"skyhkh"] forKey:@"YinHangKaXinXi_YinHangKaHao_Field"];//收款银行卡号
                [defaults3 setObject:@"khhmc" forKey:@"YinHangKaXinXi_KaiHuMingCheng_Field"];
                //照片资料页面
#warning 照片资料页面
                [defaults3 setObject:[dic objectForKey:@"zjz1"] forKey:@"zjz1"];//身份证
                [defaults3 setObject:[dic objectForKey:@"zjz2"] forKey:@"zjz2"];//学生证
                [defaults3 setObject:[dic objectForKey:@"zjz3"] forKey:@"zjz3"];//个人自拍
                [defaults3 setObject:[dic objectForKey:@"zjz4"] forKey:@"zjz4"];//个人自拍
                
                
            }
            
            //        hyzh
            //会员黑名单
            [defaults3 setObject:[dic1 objectForKey:@"hmdbs"]forKey:@"HeiMingDan"];
            //会员诚信值
            [defaults3 setObject:[dic1 objectForKey:@"hycxz"]forKey:@"HuiYuanChengXinZhi"];
            //会员积分
            [defaults3 setObject:[dic1 objectForKey:@"hyjf"]forKey:@"HuiYuanJiFen"];
            //        [defaults3 setObject:[dic1 objectForKey:@"id"]forKey:@"id2"];
            //        [defaults3 setObject:[dic1 objectForKey:@"password"]forKey:@"password"];
            //        [defaults3 setObject:[dic1 objectForKey:@"shbs"]forKey:@"shbs"];
            //        [defaults3 setObject:[dic1 objectForKey:@"shsj"]forKey:@"shsj"];
            //        [defaults3 setObject:[dic1 objectForKey:@"sjhm"]forKey:@"sjhm"];
            [defaults3 setObject:[dic1 objectForKey:@"username"]forKey:@"username"];
            //        [defaults3 setObject:[dic1 objectForKey:@"xxwsbs"]forKey:@"xxwsbs"];
            //        [defaults3 setObject:[dic1 objectForKey:@"zcsj"]forKey:@"zcsj"];
            
            
            //    获取注册的值
            //        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            //
            //        NSDictionary*myDic=[defaults dictionaryForKey:@"myDictionary"];
            //
            //        NSString*str=[NSString stringWithFormat:@"name:%@,pass:%@",[myDic valueForKey:@"name"],[myDic valueForKey:@"pass"]];
            //
            //        NSLog(@"%@",str);
            
            //    基本类型用 “＝＝”比较是否相等
            
            
            
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"登录成功";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:3];
            
            NSUserDefaults *mySettingData = [NSUserDefaults standardUserDefaults];
            
            
            NSDictionary *myDictionary=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:name,password, nil] forKeys:[NSArray arrayWithObjects:@"name",@"pass", nil]];
            
            [mySettingData setObject:myDictionary forKey:@"myDictionary"];
            //  强制让数据立刻保存
            [self ShiFouFeYiDaiKuan];
            
            [mySettingData synchronize];
            
            //                        MainVC *l=[self.storyboard instantiateViewControllerWithIdentifier:@"MainVC" ];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginstate" object:nil];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            
        }
        else
        {
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"用户名或密码错误！";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:3];
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [HUD hide:YES];
        
        [HUD removeFromSuperview];
        
        HUD=nil;

        HUD=[[MBProgressHUD alloc] initWithView:self.view];
        
        [self.view addSubview:HUD];
        
        
        HUD.mode =MBProgressHUDModeText;
        
        HUD.labelText =@"网络未连接，请重试！";
        
        HUD.margin = 10.f;
        
        HUD.removeFromSuperViewOnHide=YES;
        
        [HUD hide:YES afterDelay:2];

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
        
        [defaults3 setObject:[responseObject[0] objectForKey:@"flag"] forKey:@"DaiKuanShiFouKeYi"];
        [defaults3 setObject:[responseObject[0] objectForKey:@"massages"] forKey:@"DaiKuanShuChuXinXi"];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
    
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
