//
//  LRWLoginVC.m
//  contact
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 wyzc_lrw. All rights reserved.
//

#import "LRWLoginVC.h"
#import "SVProgressHUD.h"

@interface LRWLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *acountTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UISwitch *remberpwSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autologinSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LRWLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.acountTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pswTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}
-(void)textChange{
    self.loginBtn.enabled =self.acountTF.text.length&&self.pswTF.text.length;
}
- (IBAction)remeberclick:(UISwitch *)sender {
    if (!sender.on) {
//        self.autologinSwitch.on=NO;
        [self.autologinSwitch setOn:NO animated:YES];
    }
}
- (IBAction)autologinclick:(UISwitch *)sender {
    if (sender.on) {
//        self.remberpwSwitch.on=YES;
        [self.remberpwSwitch setOn:YES animated:YES];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    segue.destinationViewController.title =[NSString stringWithFormat:@"欢迎登录%@的通讯录",self.acountTF.text];
}
- (IBAction)loginBtnClick:(UIButton *)sender {
    if ([self.acountTF.text isEqualToString:@"lrw"]&&[self.pswTF.text isEqualToString:@"111"]) {
        [SVProgressHUD show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            [self performSegueWithIdentifier:@"contact" sender:nil];
        });
        
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
