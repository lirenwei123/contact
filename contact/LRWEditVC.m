//
//  LRWEditVC.m
//  contact
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 wyzc_lrw. All rights reserved.
//

#import "LRWEditVC.h"

@interface LRWEditVC ()
@property (weak, nonatomic) IBOutlet UITextField *acountTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UIButton *add;

@end

@implementation LRWEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.acountTF.text =self.model.name;
    self.pswTF.text =self.model.phone;
    
    [self.acountTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pswTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];

}

-(void)textChange{
    self.add.enabled =self.acountTF.text.length&&self.pswTF.text.length;
}


- (IBAction)addClick:(UIButton *)sender {
    self.model.name =self.acountTF.text;
    self.model.phone=self.pswTF.text;
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"save" object:nil];
    
}
- (IBAction)fanhui:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)edit:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
    self.acountTF.enabled =YES;
    self.pswTF.enabled =YES;
    self.add.hidden =NO;
    [self.pswTF becomeFirstResponder];
    sender.title=@"取消";
    }else{
        sender.title=@"编辑";
        self.acountTF.enabled =NO;
        self.pswTF.enabled =NO;
        self.add.enabled =NO;
        self.add.hidden =YES;
        [self.view endEditing:YES];
        //恢复之前的数据
        self.acountTF.text=self.model.name;
        self.pswTF.text=self.model.phone;

    }
}


//-(void)setModel:(LRWModel *)model{
//    _model =model;
//}
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
