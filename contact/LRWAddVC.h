//
//  LRWAddVC.h
//  contact
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 wyzc_lrw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRWModel.h"

@protocol LRWDelegate <NSObject>

-(void)ADDContact:(LRWModel*)model;

@end

@interface LRWAddVC : UIViewController
@property (weak,nonatomic)id<LRWDelegate>delegate;
@end
