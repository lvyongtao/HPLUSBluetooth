//
//  AppDelegate.h
//  蓝牙
//
//  Created by user on 16/3/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CBCentralManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CBPeripheralManager *manager;


@end

