//
//  PasswordModification.m
//  短借宝
//
//  Created by iMac21 on 15/8/12.
//  Copyright (c) 2015年 com.appleyf. All rights reserved.
//

#import "PasswordModification.h"
#import "AFNetworking.h"
#import "SBJson.h"
#import "Networking.h"
#import "MBProgressHUD.h"
#import "Header.h"

@interface PasswordModification (){
    
    MBProgressHUD *HUD;
    
    float width;
    
}

@property (weak, nonatomic) IBOutlet UITextField *JiuMima;
@property (weak, nonatomic) IBOutlet UITextField *XinMiMa;
@property (weak, nonatomic) IBOutlet UITextField *ZaiCiShuRuXInMIMa;

@end

@implementation PasswordModification

- (void)viewDidLoad {
    [super viewDidLoad];
    
    width=[[UIScreen mainScreen] bounds].size.width;
    
    UIButton *bb1=[[UIButton alloc] initWithFrame:CGRectMake(16, 100+width/2, width-32, 44)];
    
    [bb1 setTitle:@"确认" forState:UIControlStateNormal];
    [bb1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bb1 addTarget:self action:@selector(XiuGaiMIMa:) forControlEvents:UIControlEventTouchUpInside];
    bb1.backgroundColor=[UIColor colorWithRed:0 green:204.0/255 blue:178.0/255 alpha:1.0f];
    
    [bb1.layer setCornerRadius:8.0f];
    
    [self.view addSubview:bb1];

    
    
    
    
    // Do any additional setup after loading the view.
}
- (void)XiuGaiMIMa:(UIButton *)sender {
    
    if (self.XinMiMa.text.length>0 &&  [self.XinMiMa.text isEqualToString:self.ZaiCiShuRuXInMIMa.text]) {
        
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSUserDefaults *defaults3=[NSUserDefaults standardUserDefaults];
    
    
    NSDictionary*myDic=[defaults dictionaryForKey:@"myDictionary"];
    
    
    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:[defaults3 objectForKey:@"zhid"],@"zhid",[myDic valueForKey:@"pass"],@"oldpassword",self.XinMiMa.text,@"newspassword",nil];
    
    
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    
    NSString *jasonString = [writer stringWithObject:dataDictionary];
    
    NSLog(@"%@",jasonString);
    
    //
    //    包括dxyzm:短信验证码 zcsjhm：用户注册手机号码 password：注册密码
    
    
    NSString *url2 = [NSString stringWithFormat:@"%@androidLogAction!editpassword.action?editpassword=%@",networkAddress,jasonString];
    
    NSString *url1=[url2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
        NSLog(@"url--%@",url2);
    
    [manager POST:url1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"aaaaaa%@",responseObject);
        
        if ( [defaults3 integerForKey:@"true"]==1) {
            
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"修改成功";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:3];
            
            NSUserDefaults *mySettingData = [NSUserDefaults standardUserDefaults];
            
            
            NSDictionary *myDictionary=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.XinMiMa.text, nil] forKeys:[NSArray arrayWithObjects:@"pass", nil]];
            
            [mySettingData setObject:myDictionary forKey:@"myDictionary"];
            //  强制让数据立刻保存
            
            [mySettingData synchronize];
            
            //                        MainVC *l=[self.storyboard instantiateViewControllerWithIdentifier:@"MainVC" ];
            
            [self.navigationController
             popToRootViewControllerAnimated:YES];
            
            
        }
        else
        {
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"旧密码错误";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:3];
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

    }else{
        HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        HUD.mode = MBProgressHUDModeText;
        
        HUD.labelText = @"密码不一致";
        
        HUD.margin = 10.f;
        
        HUD.removeFromSuperViewOnHide=YES;
        
        [HUD hide:YES afterDelay:3];
    
    }

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
