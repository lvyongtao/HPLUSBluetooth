//
//  HPLUSManager.m
//  蓝牙
//
//  Created by lvyongtao on 16/10/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "HPLUSManager.h"
@implementation HPLUSConnectModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.identifier forKey:@"identifier"];
    [aCoder encodeBool:self.isConnected forKey:@"isConnected"];
    [aCoder encodeInteger:self.rssi forKey:@"rssi"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
        self.isConnected = [aDecoder decodeBoolForKey:@"isConnected"];
        self.rssi = [aDecoder decodeIntegerForKey:@"rssi"];
    }
    return self;
}

@end

@implementation HPLUSRunDataModel
- (HPLUSRunDataModel *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate{
    if (self = [super init]) {
        _dateTime = dateTime;
        _step = step;
        _distance = distance;
        _runCalories = runCalories;
        _staticCalories = staticCalories;
        _runTimes = runTimes;
        _maxHeartRate = maxHeartRate;
        _minHeartRate = minHeartRate;
//        NSLog(@"dateTime = %@,step = %@,distance = %@,runCalories = %@,staticCalories = %@,runTimes = %@,maxHeartRate = %@,minHeartRate = %@",dateTime,step,distance,runCalories,staticCalories,runTimes,maxHeartRate,minHeartRate);
    }
    return self;
}
+ (HPLUSRunDataModel *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate{
    HPLUSRunDataModel *model = [[HPLUSRunDataModel alloc] initWithDateTime:dateTime Step:step Distance:distance RunCalories:runCalories StaticCalories:staticCalories RunTimes:runTimes MaxHeartRate:maxHeartRate MinHeartRate:minHeartRate];
    return model;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.dateTime forKey:@"dateTime"];
    [aCoder encodeObject:self.step forKey:@"step"];
    [aCoder encodeObject:self.distance forKey:@"distance"];
    [aCoder encodeObject:self.runCalories forKey:@"runCalories"];
    
    [aCoder encodeObject:self.staticCalories forKey:@"staticCalories"];
    [aCoder encodeObject:self.runTimes forKey:@"runTimes"];
    [aCoder encodeObject:self.maxHeartRate forKey:@"maxHeartRate"];
    [aCoder encodeObject:self.minHeartRate forKey:@"minHeartRate"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.dateTime = [aDecoder decodeObjectForKey:@"dateTime"];
        self.step = [aDecoder decodeObjectForKey:@"step"];
        self.distance = [aDecoder decodeObjectForKey:@"distance"];
        self.runCalories = [aDecoder decodeObjectForKey:@"runCalories"];
        self.staticCalories = [aDecoder decodeObjectForKey:@"staticCalories"];
        
        self.runTimes = [aDecoder decodeObjectForKey:@"runTimes"];
        self.maxHeartRate = [aDecoder decodeObjectForKey:@"maxHeartRate"];
        self.minHeartRate = [aDecoder decodeObjectForKey:@"minHeartRate"];
    }
    return self;
}
@end


@implementation HPLUSleepDataModel

- (HPLUSleepDataModel *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate{
    if (self = [super init]) {
        _dateTime = dateTime;
        _sleepDate = sleepDate;
        _secondSleepDate = secondSleepDate;
        _deepSleepDate = deepSleepDate;
        _shallowSleepDate = shallowSleepDate;
        _wakeUpTimes = wakeUpTimes;
        _wakeUpDate = wakeUpDate;
        _startDate = startDate;
//        NSLog(@"dateTime = %@,sleepDate = %@,secondSleepDate = %@,deepSleepDate = %@,shallowSleepDate = %@,wakeUpTimes = %@,wakeUpDate = %@,startDate = %@",dateTime,sleepDate,secondSleepDate,deepSleepDate,shallowSleepDate,wakeUpTimes,wakeUpDate,startDate);
    }
    return self;
}

+ (HPLUSleepDataModel *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate{
    HPLUSleepDataModel *model = [[HPLUSleepDataModel alloc] initWithDateTime:dateTime SleepDate:sleepDate SecondSleepDate:secondSleepDate DeepSleepDate:deepSleepDate ShallowSleepDate:shallowSleepDate WakeUpTimes:wakeUpTimes WakeUpDate:wakeUpDate StartDate:startDate];
    return model;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.dateTime forKey:@"dateTime"];
    [aCoder encodeObject:self.sleepDate forKey:@"sleepDate"];
    [aCoder encodeObject:self.secondSleepDate forKey:@"secondSleepDate"];
    [aCoder encodeObject:self.deepSleepDate forKey:@"deepSleepDate"];
    
    [aCoder encodeObject:self.shallowSleepDate forKey:@"shallowSleepDate"];
    [aCoder encodeObject:self.wakeUpTimes forKey:@"wakeUpTimes"];
    [aCoder encodeObject:self.wakeUpDate forKey:@"wakeUpDate"];
    [aCoder encodeObject:self.startDate forKey:@"startDate"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.dateTime = [aDecoder decodeObjectForKey:@"dateTime"];
        self.sleepDate = [aDecoder decodeObjectForKey:@"sleepDate"];
        self.secondSleepDate = [aDecoder decodeObjectForKey:@"secondSleepDate"];
        self.deepSleepDate = [aDecoder decodeObjectForKey:@"deepSleepDate"];
        self.shallowSleepDate = [aDecoder decodeObjectForKey:@"shallowSleepDate"];
        
        self.wakeUpTimes = [aDecoder decodeObjectForKey:@"wakeUpTimes"];
        self.wakeUpDate = [aDecoder decodeObjectForKey:@"wakeUpDate"];
        self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
    }
    return self;
}
@end


@implementation RealRunDataModel

- (RealRunDataModel *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate{
    if (self = [super init]) {
        _realStep = realStep;
        _realDistance = realDistance;
        _realCalories = realCalories;
        _staticCalories = staticCalories;
        _battery = battery;
        _heartRate = heartRate;
        NSLog(@"realStep = %@,realDistance = %@,realCalories =%@,staticCalories = %@,battery = %@,heartRate= %@",realStep,realDistance,realCalories,staticCalories,battery,heartRate);
    }
    return self;
    
}
+ (RealRunDataModel *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate{
    RealRunDataModel *model = [[RealRunDataModel alloc] initWithRealStep:realStep RealDistance:realDistance RealCalories:realCalories StaticCalories:staticCalories Battery:battery HeartRate:heartRate];
    return model;
}

@end


@implementation HPlusExerciseDataModel

- (HPlusExerciseDataModel *)initWithDates:(NSString *)dates Weeks:(NSInteger )weeks DataTypes:(NSInteger)dataTypes Steps:(NSString *)steps Distances:(NSString *)distances Calories:(NSString *)calories CircleTimes:(float)circleTimes ExerciseDurations:(NSString *)exerciseDurations{
    if (self = [super init]) {
        _dates = dates;
        _weeks = weeks;
        _dataTypes = dataTypes;
        _steps = steps;
        _distances = distances;
        _calories = calories;
        _circleTimes = circleTimes;
        _exerciseDurations = exerciseDurations;
    }
    return self;
}

+ (HPlusExerciseDataModel *)initWithDates:(NSString *)dates Weeks:(NSInteger)weeks DataTypes:(NSInteger)dataTypes Steps:(NSString *)steps Distances:(NSString *)distances Calories:(NSString *)calories CircleTimes:(float)circleTimes ExerciseDurations:(NSString *)exerciseDurations{
    HPlusExerciseDataModel *model = [[HPlusExerciseDataModel alloc] initWithDates:dates Weeks:weeks DataTypes:dataTypes Steps:steps Distances:distances Calories:calories CircleTimes:circleTimes ExerciseDurations:exerciseDurations];
    return model;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.dates forKey:@"dates"];
    [aCoder encodeInteger:self.weeks forKey:@"weeks"];
    [aCoder encodeInteger:self.dataTypes forKey:@"dataTypes"];
    [aCoder encodeObject:self.steps forKey:@"dataTypes"];
    
    [aCoder encodeObject:self.distances forKey:@"distances"];
    [aCoder encodeObject:self.calories forKey:@"calories"];
    [aCoder encodeFloat:self.circleTimes forKey:@"circleTimes"];
    [aCoder encodeObject:self.exerciseDurations forKey:@"exerciseDurations"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.dates = [aDecoder decodeObjectForKey:@"dates"];
        self.weeks = [aDecoder decodeIntegerForKey:@"weeks"];
        self.dataTypes = [aDecoder decodeIntegerForKey:@"dataTypes"];
        self.steps = [aDecoder decodeObjectForKey:@"steps"];
        self.distances = [aDecoder decodeObjectForKey:@"distances"];

        self.calories = [aDecoder decodeObjectForKey:@"calories"];
        self.circleTimes = [aDecoder decodeFloatForKey:@"circleTimes"];
        self.exerciseDurations = [aDecoder decodeObjectForKey:@"exerciseDurations"];
    }
    return self;
}
@end

// 设备名
#define DEVICENAME @"HPLUS"

/**
 *  **HPlus Service 服务接口:
 *  **服务UUID
 */
#define TRANSFER_SERVICE_UUID @"14701820-620A-3973-7C78-9CFFF0876ABD"

/**
 *  **特征UUID 信息，指令
 *  **BLE Properties: Write
 *  **Date Type: Byte[] (可变长度字节数组)
 */
#define CHARACTERISTIC_SERVICE_UUID @"14702856-620A-3973-7C78-9CFFF0876ABD"

/**
 *  **特征UUID 通知，信息，指令
 *  **BLE Properties: Notify
 *  **Date Type: Byte[] (可变长度字节数组)
 */
#define CHARACTERISTIC_SERVICE_UUID_NOTIFY @"14702853-620A-3973-7C78-9CFFF0876ABD"

//#define DUMMY_SERVICE_UUID_STRING @"7905F431-B5CE-4E99-A40F-4B1E122D00D0"
/*
 7905F431-B5CE-4E99-A40F-4B1E122D00D0
 Characteristic类型
 所涉及的characteristic
 
 1、Notification Source:
 
 UUID 9FBF120D-6301-42D9-8C58-25E699A21DBD(notifiable)
 
 基本通知源，通知一些计数的信息；
 
 
 
 2、Control Point:
 
 UUID 69D1D8F3-45E1-49A8-9821-9BBDFDAAD9D9(writeable with response)
 
 控制器，用于向ios设备写入控制信息，例如读取详情；
 
 
 
 3、Data Source:
 
 UUID 22EAC6E9-24D6-4BB5-BE44-B36ACE7C7BFB(notifiable)
 
 数据源，用于提供详细数据，在控制信息写入后通过此characteristic返回；
 */

@interface HPLUSManager ()<CBCentralManagerDelegate,CBPeripheralDelegate>

@property (strong, nonatomic) CBPeripheral* myPeripheral;
@property (strong, nonatomic) CBCentralManager* myCentralManager;
//write read 的特征服务
@property (strong, nonatomic) CBCharacteristic *writeCharacter;
//连接失败定时器 10s
@property (strong, nonatomic) NSTimer *connectTimer;
//搜索超时定时器 60s
@property (strong, nonatomic) NSTimer *searchTimer;

/*!
 *  @brief  返回连接设备的name
 *
 */

@property (copy, nonatomic) void(^HPLUSManagerTitleBlock)(NSString *);
/*!
 *  @brief  返回CBPeripheral对象数组的长度
 *
 */
@property (copy, nonatomic) void(^HPLUSManagerDevicesBlock)(NSMutableArray *);
/*!
 *  @brief  返回实时数据的model
 *
 */
@property (copy, nonatomic) void(^HPLUSManagerRealDataBlock)(RealRunDataModel *);

@property (copy, nonatomic) void(^HPLUSManagerRunDataBlock)(HPLUSRunDataModel *);

@property (copy, nonatomic) void(^HPLUSManagerSleepDataBlock)(HPLUSleepDataModel *);

@property (copy, nonatomic) void(^HPLUSManagerExerciseDataBlock)(HPlusExerciseDataModel *);

@end
static HPLUSManager *manager = nil;
@implementation HPLUSManager

+ (HPLUSManager *)ShareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HPLUSManager alloc] init];
    });
    return manager;
}
- (instancetype)init{
    
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (!manager) {
            manager = [super allocWithZone:zone];
            return manager;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}
- (void)initCentralManager{
    if (!self.myCentralManager) {
        //设置代理
        self.myCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        self.title = @"蓝牙设备管理";
    }else{
        [self centralManagerDidUpdateState:self.myCentralManager];
    }
}
- (void)disconnectPeripheral{
    if(self.myPeripheral){
        [self.myCentralManager cancelPeripheralConnection:self.myPeripheral];
        self.myPeripheral = nil;
        self.title = @"设备连接已断开";
    }
}

#pragma mark --写入命令，同步数据

- (void)setDateAndTime{
    NSString *dateString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:0];
    NSString *timeString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:1];
    NSData *dataDate = [self dataWithHexstring:dateString];
    NSData *dateTime = [self dataWithHexstring:timeString];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:dataDate];
        [self actionWriteWithData:dateTime];
    }
}

- (void)setBlueAge:(NSUInteger )age Height:(NSUInteger )height Weight:(NSUInteger )weight Sex:(NSUInteger )sex{
    if (age >= 255 || height >= 255 || weight >= 255) {
        NSLog(@"年龄,身高,体重参数设置不正确,重新设置");
        return;
    }
    if (sex == 0 || sex == 1) {}else{
        NSLog(@"性别参数设置错误,重新设置");
        return;
    }
    NSString *ageStr = [[self ToHex:(long long)HPLUSBluetoothCommandAge] stringByAppendingString:[NSString stringWithFormat:@"%zi",age]];
    NSString *heightStr = [[self ToHex:(long long)HPLUSBluetoothCommandHeight] stringByAppendingString:[NSString stringWithFormat:@"%zi",height]];
    NSString *weightStr = [[self ToHex:(long long)HPLUSBluetoothCommandWeight] stringByAppendingString:[NSString stringWithFormat:@"%zi",weight]];
    NSString *sexStr = [[self ToHex:(long long)HPLUSBluetoothCommandSex] stringByAppendingString:[NSString stringWithFormat:@"%zi",sex]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:ageStr]];
        [self actionWriteWithData:[self dataWithHexstring:heightStr]];
        [self actionWriteWithData:[self dataWithHexstring:weightStr]];
        [self actionWriteWithData:[self dataWithHexstring:sexStr]];
    }
}

- (void)setScreenLightTime:(NSUInteger )time{
    NSString *timeStr = [[self ToHex:(long long)HPLUSBluetoothCommandScreenTime] stringByAppendingString:[self ToHex:(long long)time]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:timeStr]];
    }
}
- (void)setHeartRate_On{
    
    NSString *heartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingHearRateOn]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:heartRateStr]];
    }
}
- (void)setHeartRate_Off{
    NSString *heartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingHearRateOff]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:heartRateStr]];
    }
}
- (void)setRealHeartRate_On{
    NSString *realHeartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandRealHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingRealHearRateOn]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:realHeartRateStr]];
    }
    
}
- (void)setRealHeartRate_Off{
    NSString *realHeartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandRealHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingRealHearRateOff]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:realHeartRateStr]];
    }
    
}
- (void)setSedentaryRemindStartTime:(NSString *)startTime EndTime:(NSString *)endTime TheIntervalTime:(NSInteger )intervalTime{
    NSInteger startHours = [self IntegerFromStringTime:startTime TimeTag:0];
    NSInteger startMinutes = [self IntegerFromStringTime:startTime TimeTag:1];
    
    NSInteger endHours = [self IntegerFromStringTime:endTime TimeTag:0];
    NSInteger endMinutes = [self IntegerFromStringTime:endTime TimeTag:1];
    
    
    if (startHours == 80 || startMinutes == 80 || endHours == 80 || endMinutes == 80) {
        NSLog(@"久坐提醒命令写入不正确");
        return;
    }
    NSString *sedentaryStr = [[[[[[self ToHex:(long long)HPLUSBluetoothCommandSedentaryRemind]stringByAppendingString:[self ToHex:(long long)intervalTime] ] stringByAppendingString:[self ToHex:(long long)startHours]] stringByAppendingString:[self ToHex:(long long)startMinutes]] stringByAppendingString:[self ToHex:(long long)endHours]] stringByAppendingString:[self ToHex:(long long)endMinutes]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:sedentaryStr]];
    }
}
- (void)setSocialRemindType:(NSUInteger)type{
    NSString *socoalStr = [[self ToHex:(long long)HPLUSBluetoothCommandSocialRemind] stringByAppendingString:[self ToHex:(long long)type]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:socoalStr]];
    }
}

- (void)setPhoneRemind{
    NSString *phoneStr = [[self ToHex:(long long)HPLUSBluetoothCommandPhoneRemind] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingPhone]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:phoneStr]];
    }
}
- (void)setMessageRemind{
    NSString *messageStr = [[self ToHex:(long long)HPLUSBluetoothCommandMessageRemind] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingMessage]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:messageStr]];
    }
}

- (void)setAlarmClockWithTime:(NSString *)time{
    NSInteger hours = [self IntegerFromStringTime:time TimeTag:0];
    NSInteger minutes = [self IntegerFromStringTime:time TimeTag:1];
    if (hours == 80 || minutes == 80) {
        NSLog(@"闹钟命令写入不正确");
        return;
    }
    NSString *alarmStr = [[[self ToHex:(long long)HPLUSBluetoothCommandAlarmClock] stringByAppendingString:[self ToHex:(long long)hours]] stringByAppendingString:[self ToHex:(long long)minutes]];;
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:alarmStr]];
    }
    
}

- (void)setClearAllData{
    NSString *clearStr = [[self ToHex:(long long)HPLUSBluetoothCommandClearAllData] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingClear]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:clearStr]];
    }
}

- (void)setReBoot{
    NSString *reBootStr = [[self ToHex:(long long)HPLUSBluetoothCommandReboot] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingreBoot]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:reBootStr]];
    }
    
}
- (void)setPowerOff{
    NSString *powerOffStr = [[self ToHex:(long long)HPLUSBluetoothCommandPowerOff] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingPowerOff]];
    if (self.myPeripheral && self.writeCharacter) {
        [self actionWriteWithData:[self dataWithHexstring:powerOffStr]];
    }
}

- (void)setRunDataCommand:(NSInteger)runtype SleepDataCommand:(NSInteger)sleeptype ExerciseDataCommand:(NSInteger)exercisetype{
    while (runtype == 1) {
        NSLog(@"执行了");
        NSString *runDataStr = [self ToHex:(long long)HPLUSBluetoothCommandRunData];
        if (self.myPeripheral && self.writeCharacter) {
            [self actionWriteWithData:[self dataWithHexstring:runDataStr]];
        }
        break;
    }
    
    while (sleeptype == 1) {
        NSLog(@"执行了");
        NSString *sleepDataStr = [self ToHex:(long long)HPLUSBluetoothCommandSleepData];
        if (self.myPeripheral && self.writeCharacter) {
            [self actionWriteWithData:[self dataWithHexstring:sleepDataStr]];
        }
        break;
    }
    
    while (exercisetype == 1) {
        NSLog(@"执行了");
        NSString *exerciseDataStr = [self ToHex:(long long)HPLUSBluetoothCommandExerciseData];
        if (self.myPeripheral && self.writeCharacter) {
            [self actionWriteWithData:[self dataWithHexstring:exerciseDataStr]];
        }
        break;
    }
}
//- (HPLUSRunDataModel *)getRunDataCommand{
//    NSString *runDataStr = [self ToHex:(long long)HPLUSBluetoothCommandRunData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:runDataStr]];
//    }
//    
//    return nil;
//}
//- (HPLUSleepDataModel *)getSleepDataCommand{
//    NSString *sleepDataStr = [self ToHex:(long long)HPLUSBluetoothCommandSleepData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:sleepDataStr]];
//    }
//    return nil;
//}
//- (RealRunDataModel *)getRealRunDataCommand{
//    NSString *realRunDataStr = [self ToHex:(long long)HPLUSBluetoothCommandSleepData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:realRunDataStr]];
//    }
//    return nil;
//}


- (void)actionWriteWithData:(NSData *)commandData{
    [self.myPeripheral writeValue:commandData forCharacteristic:self.writeCharacter type:CBCharacteristicWriteWithResponse];
}
- (void)actionWriteCommandWith:(const void *)byte length:(NSUInteger )length{
    
    NSData *commandData = [NSData dataWithBytes:byte length:length];
    [self.myPeripheral writeValue:commandData forCharacteristic:self.writeCharacter type:CBCharacteristicWriteWithResponse];
}
#pragma mark --蓝牙设备
//检查蓝牙状态
- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if (central.state != CBCentralManagerStatePoweredOn) {
        NSLog(@"蓝牙失败");
        self.title = @"蓝牙连接失败";
        switch (central.state) {
            case CBManagerStateUnknown:
                NSLog(@"CBManagerState_Unknown");
                break;
            case CBManagerStateResetting:
                NSLog(@"CBManagerState_Resetting");
                break;
            case CBManagerStateUnsupported:
                NSLog(@"CBManagerState_Unsupported");
                break;
            case CBManagerStateUnauthorized:
                NSLog(@"CBManagerState_Unauthorized");
                break;
            case CBManagerStatePoweredOff:
                NSLog(@"CBManagerState_PoweredOff");
                
                if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
                    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                    }
                    
                }else{
                    NSURL*url=[NSURL URLWithString:@"prefs:root=Bluetooth"];
                    if([[UIApplication sharedApplication] canOpenURL:url]) {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }
                break;
            default:
                break;
        }
        return;
    }
    NSLog(@"蓝牙状态打开，开始搜索蓝牙设备");
    
    //系统已连接的设备
    HPLUSConnectModel *connectPeripheral = [self UnarchiverWithkey:@"connectPeripheral"];
    if (connectPeripheral != nil) {
        CBPeripheral *peiii = [self retrievePeripheral:connectPeripheral.identifier];
        if (peiii != nil ) {
            NSLog(@"系统存储的配对设备 = %@",peiii);
            if (self.devices.count) {
                [self.devices removeAllObjects];
            }
            [self.devices addObject:peiii];
            if (self.HPLUSManagerDevicesBlock) {
                self.HPLUSManagerDevicesBlock(self.devices);
            }
            
            
        }else{
            NSLog(@"无系统存储的设备");
            //重连已连接的设备
            CBPeripheral *pe = [self retrievePeripheral:TRANSFER_SERVICE_UUID];
            if (pe != nil)  {
                if (self.devices.count) {
                    [self.devices removeAllObjects];
                }
                [self.devices addObject:pe];
                if (self.HPLUSManagerDevicesBlock) {
                    self.HPLUSManagerDevicesBlock(self.devices);
                }
                NSLog(@"已经连接系统中的配对设备 = %@",pe);
            }else{
                NSLog(@"搜索新的设备");
                [self.myCentralManager scanForPeripheralsWithServices:nil options:nil];
            }
        }
    }
    
   
     [self.myCentralManager scanForPeripheralsWithServices:nil options:nil];
    
    _searchTimer = [NSTimer scheduledTimerWithTimeInterval:SearchTimeOutInterval target:self selector:@selector(searchTimeout:) userInfo:self.myPeripheral repeats:NO];
}
- (CBPeripheral *)retrievePeripheral:(NSString *)uuidString{
    NSUUID *nsUUID = [[NSUUID UUID] initWithUUIDString:uuidString];
    if(nsUUID){
        NSArray *peripheralArray = [self.myCentralManager retrievePeripheralsWithIdentifiers:@[nsUUID]];
        if([peripheralArray count] > 0){
            for(CBPeripheral *peripheral in peripheralArray){
                NSLog(@"Connecting to Peripheral - %@", peripheral);
                if (peripheral.state == CBPeripheralStateDisconnected) {
                    [self connectWithPeripheral:peripheral];
                    self.myPeripheral = peripheral;
                    peripheral.delegate = self;
                }
                
            }
        }
        // There are no known Peripherals so we check for connected Peripherals if any
        else{
            CBUUID *cbUUID = [CBUUID UUIDWithNSUUID:nsUUID];
            NSArray *connectedPeripheralArray = [self.myCentralManager retrieveConnectedPeripheralsWithServices:@[cbUUID]];
            // If there are connected Peripherals
            if([connectedPeripheralArray count] > 0){
                for(CBPeripheral *peripheral in connectedPeripheralArray){
                    NSLog(@"Connecting to Peripheral - %@", peripheral);
                    if (peripheral.state == CBPeripheralStateDisconnected) {
                       [self connectWithPeripheral:peripheral];
                        self.myPeripheral = peripheral;
                        peripheral.delegate = self;
                    }
                    //                    [self.myCentralManager connectPeripheral:peripheral options:nil];
                    //                    self.myPeripheral = peripheral;
                    //                    peripheral.delegate = self;
                }
            }
            // Else there are no available Peripherals
            else{
                NSLog(@"There are no available Peripherals");
            }
        }
    }
    return self.myPeripheral;
}

//找到蓝牙设备的代理方法
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    self.title = @"正在搜索蓝牙设备...";
    //移除相同蓝牙设备的重复搜索
    if ([peripheral.name hasPrefix:DEVICENAME]) {
        if (peripheral.name.length) {
            if (self.devices.count > 0) {
                if (![self.devices containsObject:peripheral]) {
                    NSLog(@"查找到设备name = %@, identifier = %@,Data = %@",peripheral.name,peripheral.identifier,advertisementData);
                    [self.devices addObject:peripheral];
                    if (self.HPLUSManagerDevicesBlock) {
                        self.HPLUSManagerDevicesBlock(self.devices);
                    }
                    }
            }else{
                [self.devices addObject:peripheral];
                if (self.HPLUSManagerDevicesBlock) {
                    self.HPLUSManagerDevicesBlock(self.devices);
                }
                NSLog(@"查找到设备name = %@, identifier = %@,data = %@",peripheral.name,peripheral.identifier,advertisementData);
            }
        }
    }
//    if ([peripheral.name hasPrefix:DEVICENAME]) {
    
//        if (self.myPeripher al != peripheral) {
            //            [self connectWithPeripheral:peripheral];
//        }
        //        NSLog(@"查找到设备%@===%@",peripheral.name,advertisementData);
        
//    }
}

- (void)connectWithPeripheral:(CBPeripheral *)peripheral{
    self.myPeripheral = peripheral;
    //连接指定的设备
    self.title = @"发现HPLUS手环，开始连接...";
    //    [central connectPeripheral:self.myPeripheral options:nil];
    [self.myCentralManager connectPeripheral:self.myPeripheral options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnConnectionKey]];
    
    _connectTimer = [NSTimer scheduledTimerWithTimeInterval:ConnectTimeInterval target:self selector:@selector(connectTimeout:) userInfo:self.myPeripheral repeats:NO];
    [self.myCentralManager stopScan];
}
- (void)cancleConnectWithPeripheral:(CBPeripheral *)peripheral{
    if (peripheral.state == CBPeripheralStateConnected ) {
        [self cancleConnectWithPeripheral:peripheral];
    }

}
//设备连接超时提醒
- (void)connectTimeout:(NSTimer *)timer{
    [timer invalidate];
    self.title = @"设备连接超时，请重试";
    NSLog(@"设备连接超时，请重试");
}
//手机停止搜索设备
- (void)searchTimeout:(NSTimer *)timer{
    NSLog(@"60s停止搜索设备，节省资源");
    self.title = @"60s停止搜索设备，节省资源";
    [self.myCentralManager stopScan];
}
#pragma mark --CBCentralManagerDelegate
//连接蓝牙设备成功
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    self.title = @"连接成功，扫描信息...";
    if (self.HPLUSManagerTitleBlock) {
        self.HPLUSManagerTitleBlock(peripheral.name);
    }
    [_connectTimer invalidate];
    [self.myCentralManager stopScan];
    
    HPLUSConnectModel *model = [[HPLUSConnectModel alloc] init];
    model.name = peripheral.name;
    model.identifier = peripheral.identifier.UUIDString;
    model.isConnected = YES;
    model.rssi = [peripheral.RSSI integerValue];
    [self ArchiveWithObject:model Forkey:@"connectPeripheral"];
    NSLog(@"%@",peripheral.identifier.UUIDString);
    NSLog(@"连接成功peripheral.name=%@ ,identifier = %@,peripheral.services＝%@ ",peripheral.name,peripheral,peripheral.services);
    [peripheral setDelegate:self];
    [peripheral discoverServices:nil];
}
//与蓝牙设备断开连接
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"与蓝牙设备断开连接 %@: %@", [peripheral name], [error localizedDescription]);
    //    [self connectWithPeripheral:peripheral];
    HPLUSConnectModel *model = [[HPLUSConnectModel alloc] init];
    model.name = peripheral.name;
    model.identifier = peripheral.identifier.UUIDString;
    model.isConnected = NO;
    model.rssi = [peripheral.RSSI integerValue];
    [self ArchiveWithObject:model Forkey:@"connectPeripheral"];
    if (self.HPLUSManagerTitleBlock) {
        self.HPLUSManagerTitleBlock(@"null");
    }
    self.title = @"连接已断开,请重新连接";
}
//连接蓝牙设备失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"连接蓝牙设备失败！%@ %@",[peripheral name],[error localizedDescription]);
    if (self.HPLUSManagerTitleBlock) {
        self.HPLUSManagerTitleBlock(@"null");
    }
    self.title = @"连接失败";
}
#pragma mark --CBPeripheralDelegate
//扫描到蓝牙服务
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    if (error) {
        NSLog(@"扫描蓝牙服务出错：%@-> %@", peripheral.name, [error localizedDescription]);
        self.title = @"扫描蓝牙服务出错";
        return;
    }
    NSLog(@"扫描蓝牙服务：name = %@,services = %@",peripheral.name,peripheral.services);
    
    for (CBService *service in peripheral.services) {
        NSLog(@"uuidstring = %@",service.UUID.UUIDString);
        [peripheral discoverCharacteristics:nil forService:service];
        
    }
}
//扫描到蓝牙特征
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    if (error) {
        NSLog(@"扫描蓝牙的特征失败！%@->%@-> %@",peripheral.name,service.UUID, [error localizedDescription]);
        self.title = @"扫描蓝牙的特征失败";
        return;
    }
    NSLog(@"扫描蓝牙的特征有：%@->%@->%@",peripheral.name,service.UUID,service.characteristics);
    for (CBCharacteristic *characteristic in service.characteristics) {
        //         NSLog(@"service:%@ 的 Characteristic: %@",service.UUID,characteristic.UUID);
        //数据的写入和读取
        if ([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_SERVICE_UUID]) {
            NSLog(@"lv UUID");
            self.writeCharacter = characteristic;
        }else if([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_SERVICE_UUID_NOTIFY]){
            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
//                        [peripheral readValueForCharacteristic:characteristic];
            NSLog(@"lv UUID_NOTIFY");
        }else{
            NSLog(@"lv other  characteristic=%@",service.UUID);
        }
    }
}




- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error{
    
    
}
#pragma mark --蓝牙设备信息处理
//中心读取外设实时数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if(error){
        NSLog(@"实时数据更新失败！%@-> %@",peripheral.name, [error localizedDescription]);
        self.title = @"实时数据更新失败";
    }
    NSLog(@"%@ %@",characteristic.UUID.UUIDString,characteristic.value);
    
    if(characteristic.isNotifying){
        [peripheral readValueForCharacteristic:characteristic];
    }else{
        [self.myCentralManager cancelPeripheralConnection:peripheral];
    }
    
}
//获取外设发来的数据,不论是read和notify,获取数据都从这个方法中读取
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    
    if (error) {
        NSLog(@"扫描蓝牙的特征失败！%@-> %@",peripheral.name, [error localizedDescription]);
        self.title = @"find value error.";
        return;
    }
    if ([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_SERVICE_UUID_NOTIFY]) {
        
        NSLog(@"notify 实时更新的数据");
        //        NSLog(@"notify value = %@",characteristic.value);
        NSString *hexString = [self hexDatatoString:characteristic.value];
        hexString = [[hexString substringToIndex:2] uppercaseString];
        //        NSString *longsleep = [self ToHex:(long long)HPLUSBluetoothSettingSleepData];
        //        NSLog(@"longsleep = %@,hex = %@",longsleep,hexString);
        if ([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingRunData]]) {//
            NSString *runStr = [self hexDatatoString:characteristic.value];
            NSArray *run = [self ArrFromHexString:runStr];
            if (run.count <19) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            NSLog(@"run value = %@",characteristic.value);

          HPLUSRunDataModel *model = [HPLUSRunDataModel initWithDateTime:[NSString stringWithFormat:@"%@-%@-%@",[self strtoulWithStringHigh:run[10] Low:run[9]],[self strtoulWithString:run[11]],[self strtoulWithString:run[12]]] Step:[self strtoulWithStringHigh:run[2] Low:run[1]] Distance:[self strtoulWithStringHigh:run[4] Low:run[3]] RunCalories:[self strtoulWithStringHigh:run[6] Low:run[5]] StaticCalories:[self strtoulWithStringHigh:run[8] Low:run[7]] RunTimes:[self strtoulWithStringHigh:run[14] Low:run[13]] MaxHeartRate:[self strtoulWithString:run[15]] MinHeartRate:[self strtoulWithString:run[16]]];
            if (self.HPLUSManagerRunDataBlock) {
                self.HPLUSManagerRunDataBlock(model);
            }
            
            //            NSLog(@"run = %@",run);
        }else if ([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingSleepData]]){
            NSString *sleepStr = [self hexDatatoString:characteristic.value];
            NSArray *sleep = [self ArrFromHexString:sleepStr];
            if (sleep.count < 19) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            
            NSLog(@"sleep value = %@",characteristic.value);
          HPLUSleepDataModel *model = [HPLUSleepDataModel initWithDateTime:[NSString stringWithFormat:@"%@-%@-%@",[self strtoulWithStringHigh:sleep[2] Low:sleep[1]],[self strtoulWithString:sleep[3]],[self strtoulWithString:sleep[4]]] SleepDate:[self strtoulWithStringHigh:sleep[6] Low:sleep[5]] SecondSleepDate:[self strtoulWithStringHigh:sleep[8] Low:sleep[7]] DeepSleepDate:[self strtoulWithStringHigh:sleep[10] Low:sleep[9]] ShallowSleepDate:[self strtoulWithStringHigh:sleep[12] Low:sleep[11]] WakeUpTimes:[NSString stringWithFormat:@"%@:%@",[self strtoulWithString:sleep[14]],[self strtoulWithString:sleep[13]]] WakeUpDate:[self strtoulWithStringHigh:sleep[16] Low:sleep[15]] StartDate:[NSString stringWithFormat:@"%@:%@",[self strtoulWithString:sleep[17]],[self strtoulWithString:sleep[18]]]];
            if (self.HPLUSManagerSleepDataBlock) {
                self.HPLUSManagerSleepDataBlock(model);
            }
            //            NSLog(@"sleep = %@",sleep);
        }else if ([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingRealTimeData]]){
            NSString *runnotifyStr = [self hexDatatoString:characteristic.value];
            NSArray *notify = [self ArrFromHexString:runnotifyStr];
            if (notify.count < 14) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            NSLog(@"notify value = %@",characteristic.value);
          RealRunDataModel *model = [RealRunDataModel initWithRealStep:[self strtoulWithStringHigh:notify[2] Low:notify[1]] RealDistance:[self strtoulWithStringHigh:notify[4] Low:notify[3]] RealCalories:[self strtoulWithStringHigh:notify[6] Low:notify[5]] StaticCalories:[self strtoulWithStringHigh:notify[8] Low:notify[7]] Battery:[NSString stringWithFormat:@"%@%%",[self strtoulWithString:notify[9]]] HeartRate:[self strtoulWithString:notify[11]]];
            //            NSLog(@"notify = %@",notify);
            if (self.HPLUSManagerRealDataBlock) {
                self.HPLUSManagerRealDataBlock(model);
            }
        }else if([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingExerciseData]]){
            NSString *exerciseStr = [self hexDatatoString:characteristic.value];
            NSArray *exercise = [self ArrFromHexString:exerciseStr];
            if (exercise.count < 20) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            NSLog(@"exercise value = %@",characteristic.value);
            
            
            NSString *dates = [[[[[[[[[[[self strtoulWithStringHigh:exercise[9] Low:exercise[10]]
                              stringByAppendingString:@":" ]
                              stringByAppendingString:[self strtoulWithString:exercise[11]]]
                              stringByAppendingString:@":" ]
                              stringByAppendingString:[self strtoulWithString:exercise[12]]]
                              stringByAppendingString:@":" ]
                              stringByAppendingString:[self strtoulWithString:exercise[13]]]
                              stringByAppendingString:@":" ]
                              stringByAppendingString:[self strtoulWithString:exercise[14]]]
                              stringByAppendingString:@":" ]
                              stringByAppendingString:[self strtoulWithString:exercise[15]]];
            
            NSString *durations = [[[[[self strtoulWithString:exercise[17]]
                                   stringByAppendingString:@":" ]
                                   stringByAppendingString:[self strtoulWithString:exercise[18]]]
                                   stringByAppendingString:@":" ]
                                   stringByAppendingString:[self strtoulWithString:exercise[19]]];
            
            HPlusExerciseDataModel *model = [HPlusExerciseDataModel initWithDates:dates Weeks:[[self strtoulWithString:exercise[16]] integerValue] DataTypes:[[self strtoulWithString:exercise[8]] integerValue] Steps:[self strtoulWithStringHigh:exercise[1] Low:exercise[2]] Distances:[self strtoulWithStringHigh:exercise[3] Low:exercise[4]] Calories:[self strtoulWithStringHigh:exercise[5] Low:exercise[6]] CircleTimes:[[self strtoulWithString:exercise[7]] floatValue] ExerciseDurations:durations];
            
            if (self.HPLUSManagerExerciseDataBlock) {
                self.HPLUSManagerExerciseDataBlock(model);
            }
           
        }else{
            NSLog(@"其他数据读取，暂时不处理%@",hexString);
        }
        
        //        NSLog(@"run = %@\nsleep = %@\nnotify = %@",run,sleep,notify);
        
    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_SERVICE_UUID]) {
        //        NSLog(@"同步获取数据");
        NSString *hexString = [self hexDatatoString:characteristic.value];
        hexString = [[hexString substringToIndex:2] uppercaseString];
        NSLog(@"value = %@",characteristic.value);
        NSLog(@"hex = %@",hexString);
    }else{
        //        NSLog(@" UUIDString = %@",characteristic.UUID.UUIDString);
    }
    
    
    
    
    
    
    
    
    //    if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_1]) {
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        NSLog(@"步数1：%d",steps);
    //
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_2]){
    //
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        NSLog(@"步数2：%d",steps);
    //
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_3]){
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        NSLog(@"步数3：%d",steps);
    //
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_4]){
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        NSLog(@"步数4：%d",steps);
    //
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Step]){
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        self.msgLable.text = [NSString stringWithFormat:@"当日步数\nstep＝：%d",steps];
    //        NSLog(@"步数5：%d",steps);
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Battery]){
    //        Byte *bufferBytes = (Byte *)characteristic.value.bytes;
    //        int buterys = TCcbytesValueToInt(bufferBytes)&0xff;
    //        self.msgLable.text = [self.msgLable.text stringByAppendingString:[NSString stringWithFormat:@"\n电量＝：%d%%",buterys]];
    //        NSLog(@"电池：%d%%",buterys);
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Shake]){
    //
    //
    //    }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Device]){
    //        Byte *steBytes = (Byte *)characteristic.value.bytes;
    //        int steps = TCcbytesValueToInt(steBytes);
    //        NSLog(@"步数7：%d",steps);
    //    }
    
    
    
    
    
}
#pragma mark --写入成功或者失败
//向蓝牙中写入数据后的回调函数
- (void)peripheral:(CBPeripheral*)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    NSLog(@"向peripheral中写入数据后的回调函数");
    if (error) {
        NSLog(@"%@",error.userInfo);
        return;
    }
    NSString *hexString = [self hexDatatoString:characteristic.value];
    hexString = [[hexString substringToIndex:2] uppercaseString];
    
    NSLog(@"chara = %@,发送数据成功= %d",characteristic,[self IntFromHexString:hexString]);
    
    //    NSLog(@"write value success : %@", hexString);
    switch ([self IntFromHexString:hexString]) {
        case HPLUSBluetoothCommandPowerOff:
            NSLog(@"HPLUSBluetoothCommandPowerOff");
            break;
        case HPLUSBluetoothCommandReboot:
            NSLog(@"HPLUSBluetoothCommandReboot");
            break;
        case HPLUSBluetoothCommandClearAllData:
            NSLog(@"HPLUSBluetoothCommandClearAllData");
            break;
        case HPLUSBluetoothCommandSedentaryRemind:
            NSLog(@"HPLUSBluetoothCommandSedentaryRemind");
            break;
        case HPLUSBluetoothCommandAlarmClock:
            NSLog(@"HPLUSBluetoothCommandAlarmClock");
            break;
        case HPLUSBluetoothCommandMessageRemind:
            NSLog(@"HPLUSBluetoothCommandMessageRemind");
            break;
        case HPLUSBluetoothCommandSocialRemind:
            NSLog(@"HPLUSBluetoothCommandSocialRemind");
            break;
        case HPLUSBluetoothCommandVersion:
            NSLog(@"HPLUSBluetoothCommandVersion");
            break;
        case HPLUSBluetoothCommandRunData:
            NSLog(@"HPLUSBluetoothCommandRunData");
            break;
        case HPLUSBluetoothCommandSleepData:
            NSLog(@"HPLUSBluetoothCommandSleepData");
            break;
        case HPLUSBluetoothCommandHearRate:
            NSLog(@"HPLUSBluetoothCommandHearRate");
            break;
        case HPLUSBluetoothCommandScreenTime:
            NSLog(@"HPLUSBluetoothCommandScreenTime");
            break;
        case HPLUSBluetoothCommandSex:
            NSLog(@"HPLUSBluetoothCommandSex");
            break;
        case HPLUSBluetoothCommandAge:
            NSLog(@"HPLUSBluetoothCommandAge");
            break;
        case HPLUSBluetoothCommandWeight:
            NSLog(@"HPLUSBluetoothCommandWeight");
            break;
        case HPLUSBluetoothCommandHeight:
            NSLog(@"HPLUSBluetoothCommandHeight");
            break;
        case HPLUSBluetoothCommandDate:
            NSLog(@"HPLUSBluetoothCommandDate");
            break;
        case HPLUSBluetoothCommandTime:
            NSLog(@"HPLUSBluetoothCommandTime");
            break;
        default:
            NSLog(@"HPLUSBluetoothCommandNo");
            break;
    }
}

#pragma mark --命令的写入转化数据类型
//10转16进制---------lv
-(NSString *)ToHex:(long long int)tmpid
{
    
    //    NSLog(@"tmpid = %lld",tmpid);
    NSString *nLetterValue;
    switch (tmpid) {
        case 0:
            nLetterValue =@"00";break;
        case 1:
            nLetterValue =@"01";break;
        case 2:
            nLetterValue =@"02";break;
        case 3:
            nLetterValue =@"03";break;
        case 4:
            nLetterValue =@"04";break;
        case 5:
            nLetterValue =@"05";break;
        case 6:
            nLetterValue =@"06";break;
        case 7:
            nLetterValue =@"07";break;
        case 8:
            nLetterValue =@"08";break;
        case 9:
            nLetterValue =@"09";break;
        case 10:
            nLetterValue =@"0A";break;
        case 11:
            nLetterValue =@"0B";break;
        case 12:
            nLetterValue =@"0C";break;
        case 13:
            nLetterValue =@"0D";break;
        case 14:
            nLetterValue =@"0E";break;
        case 15:
            nLetterValue =@"0F";break;
        default:
            nLetterValue = [self ToHexelse:tmpid];
    }
    
    return nLetterValue;
    
}
//10转16进制---------lv
- (NSString *)ToHexelse:(long long int)tmpid{
    NSString *str =@"";
    long long int ttmpig;
    NSString *nLetterValue;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue=[[NSString alloc]initWithFormat:@"%lld",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    return str;
}
//将传入的NSString类型转换成NSData并返回---------lv
- (NSData*)dataWithHexstring:(NSString *)hexstring{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for(idx = 0; idx + 2 <= hexstring.length; idx += 2){
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [hexstring substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}
#pragma mark --读取解析的数据类型
//16进制解析  字符串拆分成数组
- (NSMutableArray *)ArrFromHexString:(NSString *)tmpid{
    NSMutableArray *arr = [NSMutableArray array];
    if ([tmpid length]%2 != 0) {
        tmpid = [tmpid substringToIndex:tmpid.length - 1];
    }
    for (int i = 0; i < tmpid.length/2; i ++) {
        NSString *subTmpid = [tmpid substringWithRange:NSMakeRange(i*2, 2)];
        [arr addObject:subTmpid];
    }
    return arr;
}
//16进制解析  16转10进制字符串高位和低位
- (NSString *)strtoulWithStringHigh:(NSString *)highStr Low:(NSString *)lowStr{
    NSString *temp16 = [NSString stringWithFormat:@"%@%@",highStr,lowStr];
    NSString * temp10 = [NSString stringWithFormat:@"%lu",strtoul([temp16 UTF8String],0,16)];
    return temp10;
}
//16进制解析  16转10进制字符串
- (NSString *)strtoulWithString:(NSString *)tmpidStr{
    NSString * temp10 = [NSString stringWithFormat:@"%lu",strtoul([tmpidStr UTF8String],0,16)];
    return temp10;
}
//16进制字符串转10进制int类型数据---------lv
- (int)IntFromHexString:(NSString*)tmpid{
    
    int int_ch;
    
    unichar hex_char1 = [tmpid
                         characterAtIndex:0];
    ////两位16进制数中的第一位(高位*16)
    
    int int_ch1;
    
    if(hex_char1 >= '0'&& hex_char1 <='9')
        int_ch1 = (hex_char1-48)*16;
    //// 0 的Ascll - 48
    
    else if(hex_char1 >=
            'A'&& hex_char1 <='F')
        int_ch1 = (hex_char1-55)*16;
    //// A 的Ascll - 65
    
    else
        int_ch1 = (hex_char1-87)*16;
    //// a 的Ascll - 97
    
    unichar hex_char2 = [tmpid
                         characterAtIndex:1];
    ///两位16进制数中的第二位(低位)
    
    int int_ch2;
    
    if(hex_char2 >= '0'&& hex_char2 <='9')
        int_ch2 = (hex_char2-48);
    //// 0 的Ascll - 48
    
    else if(hex_char1 >=
            'A'&& hex_char1 <='F')
        int_ch2 = hex_char2-55;
    //// A 的Ascll - 65
    
    else
        int_ch2 = hex_char2-87;
    //// a 的Ascll - 97
    int_ch = int_ch1+int_ch2;
    
    return int_ch;
}
//16进制解析 将传入的NSData类型转换成NSString并返回------lv
- (NSString*)hexDatatoString:(NSData *)data{
    NSString* result;
    const unsigned char* dataBuffer = (const unsigned char*)[data bytes];
    if(!dataBuffer){
        return nil;
    }
    NSUInteger dataLength = [data length];
    NSMutableString* hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    for(int i = 0; i < dataLength; i++){
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    result = [NSString stringWithString:hexString];
    return result;
}
#pragma mark --写入命令的格式数据判断
//时间转年，月日
- (NSString *)hexStringWithDateString:(NSString *)dateString WithCommand:(NSInteger )command{
    NSString *hexString = @"";
    if (!dateString.length) {
        return hexString;
    }
    NSArray *dateArr = [dateString componentsSeparatedByString:@"-"];
    if (!dateArr.count) {
        return hexString;
    }
    if (dateArr.count < 6) {
        return hexString;
    }
    NSString *year = dateArr[0];
    long long yearhigh = [[year substringWithRange:NSMakeRange(0, 2)] longLongValue];
    long long yearlow = [[year substringWithRange:NSMakeRange(2, 2)] longLongValue];
    switch (command) {
        case 0:
            hexString = [[[[[self ToHex:(long long)HPLUSBluetoothCommandDate] stringByAppendingString:[self ToHex:yearhigh]]stringByAppendingString:[self ToHex:yearlow]] stringByAppendingString:[self ToHex:[dateArr[1] longLongValue]]] stringByAppendingString:[self ToHex:[dateArr[2] longLongValue]]];
            break;
        case 1:
            hexString = [[[[self ToHex:(long long)HPLUSBluetoothCommandTime] stringByAppendingString:[self ToHex:[dateArr[3] longLongValue]]] stringByAppendingString:[self ToHex:[dateArr[4] longLongValue]]] stringByAppendingString:[self ToHex:[dateArr[5] longLongValue]]];
            break;
            
        default:
            break;
    }
    
    return hexString;
}
//日期显示的格式
- (NSString *)stringFromCurrentDate{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
//判断输入的时间并转化类型
- (NSInteger )IntegerFromStringTime:(NSString *)time TimeTag:(NSInteger )tag{
    NSArray *arr = [time componentsSeparatedByString:@":"];
    NSInteger tempUInteger = 80;
    if (arr.count < 2) {
        NSLog(@"时间格式不正确");
        return tempUInteger;
    }
    
    if (tag == 0) {
        tempUInteger = [arr[0] integerValue];
        if (tempUInteger < 24 || tempUInteger == 255) {
            return tempUInteger;
        }
        tempUInteger = 80;
        return tempUInteger;
    }else if(tag == 1){
        tempUInteger = [arr[1] integerValue];
        if (tempUInteger < 60 || tempUInteger == 255) {
            return tempUInteger;
        }
        tempUInteger = 80;
        return tempUInteger;
    }else{
        return tempUInteger;
    }
}

#pragma mark --获取数据
- (void)GetHPLUSManagerDevices:(HPLUSManagerDevicesBlock)devices{
    self.HPLUSManagerDevicesBlock = devices;
    
}
- (void)GetHPLUSManagerTitle:(HPLUSManagerTitleBlock)stateTitle{
    self.HPLUSManagerTitleBlock = stateTitle;
}

- (void)GetHPLUSManagerRunData:(HPLUSManagerRunDataBlock)runModel{
    self.HPLUSManagerRunDataBlock = runModel;
}

- (void)GetHPLUSManagerRealData:(HPLUSManagerRealDataBlock)realModel{
    self.HPLUSManagerRealDataBlock = realModel;
}

- (void)GetHPLUSManagerSleepData:(HPLUSManagerSleepDataBlock)sleepModel{
    self.HPLUSManagerSleepDataBlock = sleepModel;
}

- (void)GetHPLUSManagerExerciseData:(HPLUSManagerExerciseDataBlock)exerciseModel{
    self.HPLUSManagerExerciseDataBlock = exerciseModel;
}


#pragma mark --NSCoding
- (HPLUSConnectModel *)UnarchiverWithkey:(NSString *)key{
    
    NSMutableData *data1 = [NSMutableData dataWithContentsOfFile:[self filePathWithKey:key]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data1];
    NSLog(@"---->%@",key);
    HPLUSConnectModel *model = [unarchiver decodeObjectForKey:key];
    return model;
}
- (void)ArchiveWithObject:(NSObject *)obj Forkey:(NSString *)key{
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archive = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archive encodeObject:obj forKey:key];
    [archive finishEncoding];
    [data writeToFile:[self filePathWithKey:key] atomically:YES]? NSLog(@"归档成功%@",key):NSLog(@"归档失败");
}
-(NSString *)filePathWithKey:(NSString *)key
{
    
    NSString * path =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * fileName =[path stringByAppendingPathComponent:key];
    NSLog(@"---->%@",fileName);
    return fileName;
}
#pragma mark --lazyload
- (NSMutableArray *)devices{
    if (!_devices) {
        _devices = [NSMutableArray arrayWithCapacity:0];
        [[HPLUSManager ShareManager] addObserver:self forKeyPath:@"devices" options:NSKeyValueObservingOptionNew context:nil];

    }
    return _devices;
}
#pragma mark --KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"devices"]) {
        NSLog(@"count = %zi",self.devices.count);
    }
}
@end
