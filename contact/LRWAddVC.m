//
//  LRWAddVC.m
//  contact
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 wyzc_lrw. All rights reserved.
//

#import "LRWAddVC.h"
#import "LRWModel.h"

@interface LRWAddVC ()
@property (weak, nonatomic) IBOutlet UITextField *acountTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UIButton *AddbTN;

@end

@implementation LRWAddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.acountTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pswTF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];

}
-(void)textChange{
 self.AddbTN.hidden =!(self.acountTF.text.length&&self.pswTF.text.length);
}
- (IBAction)addBTnClick:(UIButton *)sender {
    LRWModel *model =[[LRWModel alloc]init];
    model.name=self.acountTF.text;
    model.phone =self.pswTF.text;
    [self.delegate ADDContact:model];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)fanhui:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
