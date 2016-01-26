
//
//  LeftEnrollVC.m
//  短借宝
//
//  Created by iMac21 on 15/7/20.
//  Copyright (c) 2015年 com.appleyf. All rights reserved.
//

#import "LeftEnrollVC.h"
#import "CAPTCHAviewC.h"
#import "LeftRegisterVC.h"

#import "MBProgressHUD.h"

@interface LeftEnrollVC ()<UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UITextField *passwordNmu;

@property (weak, nonatomic) IBOutlet UITextField *passwordNmu2;



@end

@implementation LeftEnrollVC{
    MBProgressHUD *HUD;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [_NumTF addTarget:self action:@selector(changePhoneNumValue) forControlEvents:UIControlEventEditingChanged];
    //    密码
    [_passwordNmu addTarget:self action:@selector(changePasswordNumValue) forControlEvents:UIControlEventEditingChanged];
    
    
    [_passwordNmu2 addTarget:self action:@selector(changePassword2NumValue) forControlEvents:UIControlEventEditingChanged];
    
    
}
-(void)changePhoneNumValue
{
    int MaxLen = 11;
    NSString* szText = [_NumTF text];
    if ([_NumTF.text length]> MaxLen)
    {
        _NumTF.text = [szText substringToIndex:MaxLen];
    }
}

-(void)changePasswordNumValue
{
    int MaxLen = 14;
    NSString* szText = [_passwordNmu text];
    if ([_passwordNmu.text length]>14)
    {
        _passwordNmu.text = [szText substringToIndex:MaxLen];
    }
}

-(void)changePassword2NumValue
{
    int MaxLen = 14;
    NSString* szText = [_passwordNmu2 text];
    if ([_passwordNmu2.text length]> MaxLen)
    {
        _passwordNmu2.text = [szText substringToIndex:MaxLen];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)zhuce:(UIButton *)sender {
    
    
    
    //    正则表达式判断是不是手机号码
    
    //    手机
    NSString *regex = @"[1][34578]\\d{9}";
    
    //    密码
    //    NSString *pasRegex =@"^[a-zA-Z0-9]{6,13}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:_NumTF.text];
    
    if (!isMatch) {
        
        HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        HUD.mode = MBProgressHUDModeText;
        
        HUD.labelText = @"请输入正确的手机号码";
        
        HUD.margin = 10.f;
        
        HUD.removeFromSuperViewOnHide=YES;
        
        [HUD hide:YES afterDelay:2];
    }
    else
    {
        
        
        
        //    验证码
        CAPTCHAviewC *cap=[[CAPTCHAviewC alloc] init];
        
        cap.left=self.NumTF.text;
        
        
        NSUserDefaults *mySettingData = [NSUserDefaults standardUserDefaults];
        //    传验证码
        [mySettingData setObject:cap.left forKey:@"left"];
        //    判断注册
        
        NSLog(@"检查是否注册成功!");
        
        NSString *regPassword = self.passwordNmu.text;
        
        //    NSLog(@"regPassword为%@",regPassword);
        
        NSString * regPassword2 = self.passwordNmu2.text;
        //    NSLog(@"regPassword1为%@",regPassword2);
        
        
        
        if([regPassword isEqualToString:@""] || regPassword == nil){
            NSLog(@"注册失败！");
            
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"密码不能为空!";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:2];
            
            
            
        }else if(regPassword.length < 6){
            
            //        NSLog(@"---%@",regPassword);
            NSLog(@"注册失败！");
            
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"密码输入不能少于6个!";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:2];
            
            
            
            self.passwordNmu.text=@"";
            self.passwordNmu2.text=@"";
            
        } else if(![regPassword isEqualToString:regPassword2]){
            NSLog(@"注册失败！");
            
            
            HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"两次密码输入不一致!";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:2];
            
            self.passwordNmu.text=@"";
            self.passwordNmu2.text=@"";
            
        }else{
            
            
            
            //        网络请求加蒙版
            HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            HUD.mode = MBProgressHUDModeText;
            
            HUD.labelText = @"请求中...";
            
            HUD.margin = 10.f;
            
            HUD.removeFromSuperViewOnHide=YES;
            
            [HUD hide:YES afterDelay:1];
            
            CAPTCHAviewC *l=[self.storyboard instantiateViewControllerWithIdentifier:@"CAPTCHA" ];
            
            [self.navigationController
             pushViewController:l animated:YES];
            
//            储存密码和账户
            NSDictionary *myDictionary=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.NumTF.text,regPassword,self.ShenFenZhengHao.text, nil] forKeys:[NSArray arrayWithObjects:@"name",@"pass",@"shenfenzhenghao", nil]];
            
            [mySettingData setObject:myDictionary forKey:@"myDictionary"];
            //  强制让数据立刻保存
            
            [mySettingData synchronize];
            
            
            
 
            
            
        }
        
    }
    
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
