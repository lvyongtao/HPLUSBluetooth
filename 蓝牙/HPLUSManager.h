//
//  HPLUSManager.h
//  蓝牙
//
//  Created by lvyongtao on 16/10/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreBluetooth/CBService.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>


@interface HPLUSConnectModel :NSObject <NSCoding>

/**
 *  设备名称CBPeripheral
 */
@property (nonatomic,copy  ) NSString *name;
/**
 *  设备唯一标示
 */
@property (nonatomic,copy  ) NSString *identifier;
/**
 *  设备连接状态
 */
@property (nonatomic,assign) BOOL     isConnected;
/**
 *  设备信号强度 （如_isScanRepeat=true，则在扫描过程中会实时变化,被连上的设备不被赋值）
 */
@property (nonatomic,assign) NSInteger rssi;

@end



@interface HPLUSRunDataModel : NSObject<NSCoding>

@property (copy, nonatomic) NSString *dateTime;//时间

@property (copy, nonatomic) NSString *step;//步数

@property (copy, nonatomic) NSString *distance;//里程(10m)

@property (copy, nonatomic) NSString *runCalories;//运动消耗卡路里(cal)

@property (copy, nonatomic) NSString *staticCalories;//静止消耗卡路里(cal)

@property (copy, nonatomic) NSString *runTimes;//运动时间(minute)

@property (copy, nonatomic) NSString *maxHeartRate;//心率最大值（次／分钟）

@property (copy, nonatomic) NSString *minHeartRate;//心率最小值（次／分钟）


- (HPLUSRunDataModel *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate;
+ (HPLUSRunDataModel *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate;

@end


@interface HPLUSleepDataModel : NSObject<NSCoding>

@property (copy, nonatomic) NSString *dateTime;//时间

@property (copy, nonatomic) NSString *sleepDate;//睡眠时间

@property (copy, nonatomic) NSString *secondSleepDate;//第二阶段时间

@property (copy, nonatomic) NSString *deepSleepDate;//深度睡眠时间

@property (copy, nonatomic) NSString *shallowSleepDate;//浅睡眠时间

@property (copy, nonatomic) NSString *wakeUpTimes;//中途醒时间 （分钟）

@property (copy, nonatomic) NSString *wakeUpDate;//中途醒次数

@property (copy, nonatomic) NSString *startDate;//开始睡眠时间

- (HPLUSleepDataModel *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate;
+ (HPLUSleepDataModel *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate;

@end


@interface RealRunDataModel : NSObject

@property (copy, nonatomic) NSString *realStep;//当前步数

@property (copy, nonatomic) NSString *realDistance;//当前运动里程

@property (copy, nonatomic) NSString *realCalories;//当前消耗卡路里

@property (copy, nonatomic) NSString *staticCalories;//静止消耗卡路里

@property (copy, nonatomic) NSString *battery;//电池百分比

@property (copy, nonatomic) NSString *heartRate;//心率 [255 0  表示无效数据（次／分钟）]

- (RealRunDataModel *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate;

+ (RealRunDataModel *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate;

@end



@interface HPlusExerciseDataModel : NSObject<NSCoding>

@property (copy, nonatomic) NSString *dates;//锻炼的日期

@property (assign, nonatomic) NSInteger weeks;//锻炼的星期几

@property (assign, nonatomic) NSInteger dataTypes;//锻炼的数据类型

@property (copy, nonatomic) NSString *steps;//锻炼的步数

@property (copy, nonatomic) NSString *distances;//锻炼的距离

@property (copy, nonatomic) NSString *calories;//锻炼消耗的卡路里

@property (assign, nonatomic) float circleTimes;//锻炼类型的圈数

@property (copy, nonatomic) NSString *exerciseDurations;//锻炼的时长


- (HPlusExerciseDataModel *)initWithDates:(NSString *)dates Weeks:(NSInteger )weeks DataTypes:(NSInteger )dataTypes Steps:(NSString *)steps Distances:(NSString *)distances Calories:(NSString *)calories CircleTimes:(float )circleTimes ExerciseDurations:(NSString *)exerciseDurations;

+ (HPlusExerciseDataModel *)initWithDates:(NSString *)dates Weeks:(NSInteger )weeks DataTypes:(NSInteger )dataTypes Steps:(NSString *)steps Distances:(NSString *)distances Calories:(NSString *)calories CircleTimes:(float )circleTimes ExerciseDurations:(NSString *)exerciseDurations;

@end

typedef NS_ENUM(NSInteger,HPLUSBluetoothCommand){
    /*系统设置*/
    HPLUSBluetoothCommandNo = 0,
    HPLUSBluetoothCommandPowerOff = 91,//关机
    HPLUSBluetoothCommandReboot = 165,//重启
    HPLUSBluetoothCommandClearAllData = 216,//清除数据
    /*提醒*/
    HPLUSBluetoothCommandSedentaryRemind = 30,//久坐提醒
    HPLUSBluetoothCommandAlarmClock = 12,//闹钟
    HPLUSBluetoothCommandMessageRemind = 7,//短信提醒
    HPLUSBluetoothCommandPhoneRemind = 6,//电话提醒
    HPLUSBluetoothCommandSocialRemind = 49,//社交提醒
    /*获取数据*/
    HPLUSBluetoothCommandVersion = 23,//版本号
    HPLUSBluetoothCommandRunData = 21,//运动数据
    HPLUSBluetoothCommandSleepData = 25,//睡眠数据
    HPLUSBluetoothCommandExerciseData = 25,//锻炼数据
    /*心率监测*/
    HPLUSBluetoothCommandHearRate = 53,//心率监测
    HPLUSBluetoothCommandRealHearRate = 50,//实时心率监测
    /*参数设置*/
    HPLUSBluetoothCommandScreenTime = 11,//亮屏时间
    HPLUSBluetoothCommandSex = 45,//性别
    HPLUSBluetoothCommandAge = 44,//年龄
    HPLUSBluetoothCommandWeight = 5,//体重
    HPLUSBluetoothCommandHeight = 4,//身高
    HPLUSBluetoothCommandDate = 8,//日期
    HPLUSBluetoothCommandTime = 9//时间
};


typedef NS_ENUM(NSInteger,HPLUSBluetoothSetting){
    /*心率监测开关设置*/
    HPLUSBluetoothSettingHearRateOn = 10,
    HPLUSBluetoothSettingHearRateOff = 255,
    /*实时心率监测开关设置*/
    HPLUSBluetoothSettingRealHearRateOn = 11,
    HPLUSBluetoothSettingRealHearRateOff = 22,
    /*清除历史数据*/
    HPLUSBluetoothSettingClear = 90,
    /*重启手环*/
    HPLUSBluetoothSettingreBoot = 90,
    /*手环关机*/
    HPLUSBluetoothSettingPowerOff = 90,
    /*手环获取数据判别命令*/
    HPLUSBluetoothSettingRealTimeData = 51,//实时运动数据
    HPLUSBluetoothSettingSleepData = 26,//睡眠数据
    HPLUSBluetoothSettingRunData = 54,//历史运动数据
    HPLUSBluetoothSettingExerciseData = 54,//锻炼数据
    /*手环短信，电话提醒命令*/
    HPLUSBluetoothSettingPhone = 170,
    HPLUSBluetoothSettingMessage = 170
    
};
#define SearchTimeOutInterval 60.f
#define ConnectTimeInterval 10.f

//typedef void(^CBPeripheralBlock)(NSMutableArray *);


typedef void(^HPLUSManagerTitleBlock)(NSString *title);
typedef void(^HPLUSManagerDevicesBlock)(NSMutableArray *arr);
typedef void(^HPLUSManagerRealDataBlock)(RealRunDataModel *model);
typedef void(^HPLUSManagerRunDataBlock)(HPLUSRunDataModel *model);
typedef void(^HPLUSManagerSleepDataBlock)(HPLUSleepDataModel *model);
typedef void(^HPLUSManagerExerciseDataBlock)(HPlusExerciseDataModel *model);

@interface HPLUSManager : NSObject

@property (readwrite,copy, nonatomic) NSString *title;

@property (readwrite,strong, nonatomic) NSMutableArray *devices;


+ (HPLUSManager *)ShareManager;
/*!
 *  @brief  初始化蓝牙管理中心
 *
 */
- (void)initCentralManager;
/*!
 *  @brief  断开蓝牙服务
 *
 */
- (void)disconnectPeripheral;


/*********手环最好佩戴在左手上面，1.5cm距离你的手腕处。确保接近于你的皮肤******************************/
//蓝牙状态的字符串
/*!
 *  @brief  连接外设
 *
 */
- (void)connectWithPeripheral:(CBPeripheral *)peripheral;
/*!
 *  @brief  取消连接外设
 *
 */
- (void)cancleConnectWithPeripheral:(CBPeripheral *)peripheral;
/*!
 *  @brief  同步日期和时间
 *
 */
- (void)setDateAndTime;

/*!
 *  @brief  同步年龄，身高，体重，性别等参数
 *
 *  @param Age      年龄限制（0-255）
 *  @param Height   年龄限制（0-255）
 *  @param Weight   年龄限制（0-255）
 *  @param Sex      年龄限制（0 男 1女）
 */
- (void)setBlueAge:(NSUInteger )age Height:(NSUInteger )height Weight:(NSUInteger )weight Sex:(NSUInteger )sex;

/*!
 *  @brief  设置亮屏的时间
 *
 *  @param  please kindly konw from 0:00am to 6:00am.devices default to turn off automatic bright screen ,avoid to desturb your good dream.
 *  @param Time Scope: 3s～255s
 */
- (void)setScreenLightTime:(NSUInteger )time;

/*!
 *  @brief  设置全天心率监测开
 *
 */
- (void)setHeartRate_On;

/*!
 *  @brief  设置全天心率监测关
 *
 */
- (void)setHeartRate_Off;


/*!
 *  @brief  设置实时心率监测开
 *
 */
- (void)setRealHeartRate_On;

/*!
 *  @brief  设置实时心率监测关
 *
 */
- (void)setRealHeartRate_Off;


/*!
 *  @brief  设置闹钟提醒
 *
 *  @param Time Scope: 00:00~23:59
 *              Example: 08:40
 */
- (void)setAlarmClockWithTime:(NSString *)time;

/*!
 *  @brief  设置久坐提醒
 *
 *  @param StartTime Scope: 00:00~23:59
 *                   Example: 09:00
 *  @param EndTime   Scope: 00:00~23:59
 *                   Example: 05:00
 *  @param TheIntervalTime   0->关闭提醒，1->45分钟，2->60分钟，3->120分钟，4->180分钟，5->240分钟。
 *
 */
- (void)setSedentaryRemindStartTime:(NSString *)startTime EndTime:(NSString *)endTime TheIntervalTime:(NSInteger )intervalTime;

/*!
 *  @brief  设置社交提醒
 *
 *  @param Type Scope: 1->QQ ;2->微信;3->Facebook; 4->Twitter
 */
- (void)setSocialRemindType:(NSUInteger )type;

/*!
 *  @brief  设置电话提醒
 *
 */
- (void)setPhoneRemind;

/*!
 *  @brief  设置短信提醒
 *
 */
- (void)setMessageRemind;

/*!
 *  @brief  清除手环所有的数据
 *
 */
- (void)setClearAllData;

/*!
 *  @brief  设置手环重启
 *
 */
- (void)setReBoot;

/*!
 *  @brief  设置手环关机
 *
 */
- (void)setPowerOff;

/*!
 *  @brief  获取手环的运动数据
 *
 *  @return 手环的运动数据
 */
- (void )setRunDataCommand:(NSInteger ) runtype SleepDataCommand:(NSInteger )sleeptype ExerciseDataCommand:(NSInteger )exercisetype;

/*********获取手环数据的block方法******************************/

- (void)GetHPLUSManagerTitle:(HPLUSManagerTitleBlock )stateTitle;//连接设备的name

- (void)GetHPLUSManagerDevices:(HPLUSManagerDevicesBlock )devices;//扫描蓝牙的数量

- (void)GetHPLUSManagerRealData:(HPLUSManagerRealDataBlock )realModel;//实时数据的model

- (void)GetHPLUSManagerRunData:(HPLUSManagerRunDataBlock )runModel;//运动数据的model

- (void)GetHPLUSManagerSleepData:(HPLUSManagerSleepDataBlock )sleepModel;//睡眠数据的model

- (void)GetHPLUSManagerExerciseData:(HPLUSManagerExerciseDataBlock )exerciseModel;//锻炼数据的model


///*!
// *  @brief  返回连接设备的name
// *
// */
//
//@property (copy, nonatomic) void(^HPLUSManagerTitleBlock)(NSString *);
///*!
// *  @brief  返回CBPeripheral对象数组的长度
// *
// */
//@property (copy, nonatomic) void(^HPLUSManagerDevicesBlock)(NSMutableArray *);
///*!
// *  @brief  返回实时数据的model
// *
// */
//@property (copy, nonatomic) void(^HPLUSManagerRealDataBlock)(RealRunDataModel *);
//
//@property (copy, nonatomic) void(^HPLUSManagerRunDataBlock)(HPLUSRunDataModel *);
//
//@property (copy, nonatomic) void(^HPLUSManagerSleepDataBlock)(HPLUSleepDataModel *);
//
//@property (copy, nonatomic) void(^HPLUSManagerExerciseDataBlock)(HPlusExerciseDataModel *);

//- (HPLUSRunDataModel *)getRunDataCommand;
//
///*!
// *  @brief  获取手环的睡眠数据
// *
// *  @param  Device will automatically monitoring sleeping quality from 21:00pm -- 9:00am
// *  @return 手环的睡眠数据
// */
//- (HPLUSRunDataModel *)getSleepDataCommand;
//
///*!
// *  @brief  获取手环的运动实时数据
// *
// *  @return 手环的实时运动数据
// */
//- (HPLUSRunDataModel *)getRealRunDataCommand;


@end
