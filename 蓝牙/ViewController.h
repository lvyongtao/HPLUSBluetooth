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
//#import <CoreBluetooth/CoreBluetooth.h>
//#import <CoreBluetooth/CBService.h>
//#import <CoreTelephony/CTCallCenter.h>
//#import <CoreTelephony/CTCall.h>

#define CHARA_UUIDSTRING_Step @"FF06"
#define CHARA_UUIDSTRING_Battery @"FF0C"
#define CHARA_UUIDSTRING_Shake @"2A06"
#define CHARA_UUIDSTRING_Device @"FF01"


//@interface HPLUSConnectModel :NSObject <NSCoding>
//
///**
// *  设备名称CBPeripheral
// */
//@property (nonatomic,copy  ) NSString *name;
///**
// *  设备唯一标示
// */
//@property (nonatomic,copy  ) NSString *identifier;
///**
// *  设备连接状态
// */
//@property (nonatomic,assign) BOOL     isConnected;
///**
// *  设备信号强度 （如_isScanRepeat=true，则在扫描过程中会实时变化,被连上的设备不被赋值）
// */
//@property (nonatomic,assign) NSInteger rssi;
//
//@end



//@interface HPLUSRunData : NSObject
//
//@property (copy, nonatomic) NSString *dateTime;
//
//@property (copy, nonatomic) NSString *step;
//
//@property (copy, nonatomic) NSString *distance;
//
//@property (copy, nonatomic) NSString *runCalories;
//
//@property (copy, nonatomic) NSString *staticCalories;
//
//@property (copy, nonatomic) NSString *runTimes;
//
//@property (copy, nonatomic) NSString *maxHeartRate;
//
//@property (copy, nonatomic) NSString *minHeartRate;
//
//
//- (HPLUSRunData *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate;
//+ (HPLUSRunData *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate;
//
//@end
//
//
//@interface HPLUSleepData : NSObject
//
//@property (copy, nonatomic) NSString *dateTime;
//
//@property (copy, nonatomic) NSString *sleepDate;
//
//@property (copy, nonatomic) NSString *secondSleepDate;
//
//@property (copy, nonatomic) NSString *deepSleepDate;
//
//@property (copy, nonatomic) NSString *shallowSleepDate;
//
//@property (copy, nonatomic) NSString *wakeUpTimes;
//
//@property (copy, nonatomic) NSString *wakeUpDate;
//
//@property (copy, nonatomic) NSString *startDate;
//
//- (HPLUSleepData *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate;
//+ (HPLUSleepData *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate;
//
//@end
//
//
//@interface RealRunData : NSObject
//
//@property (copy, nonatomic) NSString *realStep;
//
//@property (copy, nonatomic) NSString *realDistance;
//
//@property (copy, nonatomic) NSString *realCalories;
//
//@property (copy, nonatomic) NSString *staticCalories;
//
//@property (copy, nonatomic) NSString *battery;
//
//@property (copy, nonatomic) NSString *heartRate;
//
//- (RealRunData *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate;
//
//+ (RealRunData *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate;
//
//@end
//
//
//
//
//typedef NS_ENUM(NSInteger,HPLUSBluetoothCommand){
///*系统设置*/
//    HPLUSBluetoothCommandNo = 0,
//    HPLUSBluetoothCommandPowerOff = 91,//关机
//    HPLUSBluetoothCommandReboot = 165,//重启
//    HPLUSBluetoothCommandClearAllData = 216,//清除数据
///*提醒*/
//    HPLUSBluetoothCommandSedentaryRemind = 30,//久坐提醒
//    HPLUSBluetoothCommandAlarmClock = 12,//闹钟
//    HPLUSBluetoothCommandMessageRemind = 7,//短信提醒
//    HPLUSBluetoothCommandPhoneRemind = 6,//电话提醒
//    HPLUSBluetoothCommandSocialRemind = 49,//社交提醒
///*获取数据*/
//    HPLUSBluetoothCommandVersion = 23,//版本号
//    HPLUSBluetoothCommandRunData = 21,//运动数据
//    HPLUSBluetoothCommandSleepData = 25,//睡眠数据
///*心率监测*/
//    HPLUSBluetoothCommandHearRate = 53,//心率监测
//    HPLUSBluetoothCommandRealHearRate = 50,//实时心率监测
///*参数设置*/
//    HPLUSBluetoothCommandScreenTime = 11,//亮屏时间
//    HPLUSBluetoothCommandSex = 45,//性别
//    HPLUSBluetoothCommandAge = 44,//年龄
//    HPLUSBluetoothCommandWeight = 5,//体重
//    HPLUSBluetoothCommandHeight = 4,//身高
//    HPLUSBluetoothCommandDate = 8,//日期
//    HPLUSBluetoothCommandTime = 9//时间
//};
//
//
//typedef NS_ENUM(NSInteger,HPLUSBluetoothSetting){
///*心率监测开关设置*/
//    HPLUSBluetoothSettingHearRateOn = 10,
//    HPLUSBluetoothSettingHearRateOff = 255,
///*实时心率监测开关设置*/
//    HPLUSBluetoothSettingRealHearRateOn = 11,
//    HPLUSBluetoothSettingRealHearRateOff = 22,
///*清除历史数据*/
//    HPLUSBluetoothSettingClear = 90,
///*重启手环*/
//    HPLUSBluetoothSettingreBoot = 90,
///*手环关机*/
//    HPLUSBluetoothSettingPowerOff = 90,
///*手环获取数据判别命令*/
//    HPLUSBluetoothSettingRealTimeData = 51,
//    HPLUSBluetoothSettingSleepData = 26,
//    HPLUSBluetoothSettingRunData = 54,
///*手环短信，电话提醒命令*/
//    HPLUSBluetoothSettingPhone = 170,
//    HPLUSBluetoothSettingMessage = 170,
//    
//};



@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *msgLable;
@property (weak, nonatomic) IBOutlet UILabel *realLable;

//@property (assign, nonatomic) HPLUSBluetoothCommand commandType;
/*********手环最好佩戴在左手上面，1.5cm距离你的手腕处。确保接近于你的皮肤******************************/

/*!
 *  @brief  同步日期和时间
 *
 */
//- (void)setDateAndTime;

/*!
 *  @brief  同步年龄，身高，体重，性别等参数
 *
 *  @param Age      年龄限制（0-255）
 *  @param Height   年龄限制（0-255）
 *  @param Weight   年龄限制（0-255）
 *  @param Sex      年龄限制（0 男 1女）
 */
//- (void)setBlueAge:(NSUInteger )age Height:(NSUInteger )height Weight:(NSUInteger )weight Sex:(NSUInteger )sex;

/*!
 *  @brief  设置亮屏的时间
 *
 *  @param  please kindly konw from 0:00am to 6:00am.devices default to turn off automatic bright screen ,avoid to desturb your good dream.
 *  @param Time Scope: 3s～255s
 */
//- (void)setScreenLightTime:(NSUInteger )time;

/*!
 *  @brief  设置全天心率监测开
 *
 */
//- (void)setHeartRate_On;

/*!
 *  @brief  设置全天心率监测关
 *
 */
//- (void)setHeartRate_Off;


/*!
 *  @brief  设置实时心率监测开
 *
 */
//- (void)setRealHeartRate_On;

/*!
 *  @brief  设置实时心率监测关
 *
 */
//- (void)setRealHeartRate_Off;


/*!
 *  @brief  设置闹钟提醒
 *
 *  @param Time Scope: 00:00~23:59
 *              Example: 08:40
 */
//- (void)setAlarmClockWithTime:(NSString *)time;

/*!
 *  @brief  设置久坐提醒
 *
 *  @param StartTime Scope: 00:00~23:59
 *                   Example: 09:00
 *  @param EndTime   Scope: 00:00~23:59
 *                   Example: 05:00
 */
//- (void)setSedentaryRemindStartTime:(NSString *)startTime EndTime:(NSString *)endTime;

/*!
 *  @brief  设置社交提醒
 *
 *  @param Type Scope: 1->QQ ;2->微信;3->Facebook; 4->Twitter
 */
//- (void)setSocialRemindType:(NSUInteger )type;

/*!
 *  @brief  设置电话提醒
 *
 */
//- (void)setPhoneRemind;

/*!
 *  @brief  设置短信提醒
 *
 */
//- (void)setMessageRemind;

/*!
 *  @brief  清除手环所有的数据
 *
 */
//- (void)setClearAllData;

/*!
 *  @brief  设置手环重启
 *
 */
//- (void)setReBoot;

/*!
 *  @brief  设置手环关机
 *
 */
//- (void)setPowerOff;

/*!
 *  @brief  获取手环的运动数据
 *
 *  @return 手环的运动数据
 */
//- (HPLUSRunData *)getRunDataCommand;

/*!
 *  @brief  获取手环的睡眠数据
 *
 *  @param  Device will automatically monitoring sleeping quality from 21:00pm -- 9:00am
 *  @return 手环的睡眠数据
 */
//- (HPLUSleepData *)getSleepDataCommand;

/*!
 *  @brief  获取手环的运动实时数据
 *
 *  @return 手环的实时运动数据
 */
//- (RealRunData *)getRealRunDataCommand;

@end

