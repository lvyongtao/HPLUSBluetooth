//
//  ViewController.h
//  蓝牙
//
//  Created by user on 16/3/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPLUSManager.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <CallKit/CallKit.h>
#endif


#import "UIView+MBView.h"

#define CHARA_UUIDSTRING_Step @"FF06"
#define CHARA_UUIDSTRING_Battery @"FF0C"
#define CHARA_UUIDSTRING_Shake @"2A06"
#define CHARA_UUIDSTRING_Device @"FF01"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *msgLable;
@property (weak, nonatomic) IBOutlet UILabel *realLable;

@end

