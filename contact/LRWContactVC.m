//
//  LRWContactVC.m
//  contact
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 wyzc_lrw. All rights reserved.
//

#import "LRWContactVC.h"
#import "LRWModel.h"
#import "LRWAddVC.h"
#import "LRWEditVC.h"


@interface LRWContactVC ()<LRWDelegate>
@property (strong,nonatomic)NSMutableArray *modelArry;
@end

@implementation LRWContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(relotableview) name:@"save" object:nil];
}
-(void)relotableview{
    [self.tableView reloadData];
}
- (IBAction)fanhui:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)add:(UIBarButtonItem *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelArry.count;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[LRWAddVC class]]) {
        LRWAddVC* vc =segue.destinationViewController;
        vc.delegate=self;
    }
    if([segue.destinationViewController isKindOfClass:[LRWEditVC class]]){
        LRWEditVC *vc =segue.destinationViewController;
        NSIndexPath *index =[self.tableView indexPathForSelectedRow];
        //这个model是个指针，如果在那边吧model改了，那么这里也就改了。
        vc.model =self.modelArry[index.row];
        
    }
}

-(void)ADDContact:(LRWModel *)model{
    [self.modelArry addObject:model];
    [self.tableView reloadData];
}
-(NSMutableArray *)modelArry{
    if (!_modelArry) {
        _modelArry=@[].mutableCopy;
    }
    return _modelArry;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    }
    LRWModel *model =self.modelArry[indexPath.row];
    cell.textLabel.text =model.name;
    cell.detailTextLabel.text =model.phone;
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view =[[UIView alloc]init];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"edit" sender:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
