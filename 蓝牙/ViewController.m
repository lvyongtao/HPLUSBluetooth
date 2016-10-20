//
//  ViewController.m
//  蓝牙
//
//  Created by user on 16/3/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "ViewController.h"

unsigned int  TCcbytesValueToInt(Byte *bytesValue) {
    unsigned int  intV;
    intV = (unsigned int ) ( ((bytesValue[3] & 0xff)<<24)
                            |((bytesValue[2] & 0xff)<<16)
                            |((bytesValue[1] & 0xff)<<8)
                            |(bytesValue[0] & 0xff));
    return intV;
}



//@implementation HPLUSConnectModel
//
//- (void)encodeWithCoder:(NSCoder *)aCoder{
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.identifier forKey:@"identifier"];
//    [aCoder encodeBool:self.isConnected forKey:@"isConnected"];
//    [aCoder encodeInteger:self.rssi forKey:@"rssi"];
//}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.identifier = [aDecoder decodeObjectForKey:@"identifier"];
//        self.isConnected = [aDecoder decodeBoolForKey:@"isConnected"];
//        self.rssi = [aDecoder decodeIntegerForKey:@"rssi"];
//    }
//    return self;
//}
//
//@end
//
//@implementation HPLUSRunData
//- (HPLUSRunData *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate{
//    if (self = [super init]) {
//        _dateTime = dateTime;
//        _step = step;
//        _distance = distance;
//        _runCalories = runCalories;
//        _staticCalories = staticCalories;
//        _runTimes = runTimes;
//        _maxHeartRate = maxHeartRate;
//        _minHeartRate = minHeartRate;
//        NSLog(@"dateTime = %@,step = %@,distance = %@,runCalories = %@,staticCalories = %@,runTimes = %@,maxHeartRate = %@,minHeartRate = %@",dateTime,step,distance,runCalories,staticCalories,runTimes,maxHeartRate,minHeartRate);
//    }
//    return self;
//}
//+ (HPLUSRunData *)initWithDateTime:(NSString *)dateTime Step:(NSString *)step Distance:(NSString *)distance RunCalories:(NSString *)runCalories StaticCalories:(NSString *)staticCalories RunTimes:(NSString *)runTimes MaxHeartRate:(NSString *)maxHeartRate MinHeartRate:(NSString *)minHeartRate{
//    HPLUSRunData *model = [[HPLUSRunData alloc] initWithDateTime:dateTime Step:step Distance:distance RunCalories:runCalories StaticCalories:staticCalories RunTimes:runTimes MaxHeartRate:maxHeartRate MinHeartRate:minHeartRate];
//    return model;
//}
//
//@end
//
//
//@implementation HPLUSleepData
//
//- (HPLUSleepData *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate{
//    if (self = [super init]) {
//        _dateTime = dateTime;
//        _sleepDate = sleepDate;
//        _secondSleepDate = secondSleepDate;
//        _deepSleepDate = deepSleepDate;
//        _shallowSleepDate = shallowSleepDate;
//        _wakeUpTimes = wakeUpTimes;
//        _wakeUpDate = wakeUpDate;
//        _startDate = startDate;
//        NSLog(@"dateTime = %@,sleepDate = %@,secondSleepDate = %@,deepSleepDate = %@,shallowSleepDate = %@,wakeUpTimes = %@,wakeUpDate = %@,startDate = %@",dateTime,sleepDate,secondSleepDate,deepSleepDate,shallowSleepDate,wakeUpTimes,wakeUpDate,startDate);
//    }
//    return self;
//}
//
//+ (HPLUSleepData *)initWithDateTime:(NSString *)dateTime SleepDate:(NSString *)sleepDate SecondSleepDate:(NSString *)secondSleepDate DeepSleepDate:(NSString *)deepSleepDate ShallowSleepDate:(NSString *)shallowSleepDate WakeUpTimes:(NSString *)wakeUpTimes WakeUpDate:(NSString *)wakeUpDate StartDate:(NSString *)startDate{
//    HPLUSleepData *model = [[HPLUSleepData alloc] initWithDateTime:dateTime SleepDate:sleepDate SecondSleepDate:secondSleepDate DeepSleepDate:deepSleepDate ShallowSleepDate:shallowSleepDate WakeUpTimes:wakeUpTimes WakeUpDate:wakeUpDate StartDate:startDate];
//    return model;
//}
//
//@end
//
//
//@implementation RealRunData
//
//- (RealRunData *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate{
//    if (self = [super init]) {
//        _realStep = realStep;
//        _realDistance = realDistance;
//        _realCalories = realCalories;
//        _staticCalories = staticCalories;
//        _battery = battery;
//        _heartRate = heartRate;
//        NSLog(@"realStep = %@,realDistance = %@,realCalories =%@,staticCalories = %@,battery = %@,heartRate= %@",realStep,realDistance,realCalories,staticCalories,battery,heartRate);
//    }
//    return self;
//    
//}
//+ (RealRunData *)initWithRealStep:(NSString *)realStep RealDistance:(NSString *)realDistance RealCalories:(NSString *)realCalories StaticCalories:(NSString *)staticCalories Battery:(NSString *)battery HeartRate:(NSString *)heartRate{
//    RealRunData *model = [[RealRunData alloc] initWithRealStep:realStep RealDistance:realDistance RealCalories:realCalories StaticCalories:staticCalories Battery:battery HeartRate:heartRate];
//    return model;
//}
//
//@end









@interface ViewController ()<CBCentralManagerDelegate,CBPeripheralDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) CBPeripheral* myPeripheral;
@property (strong, nonatomic) CBCentralManager* myCentralManager;

//抖动的特征服务
@property (strong, nonatomic) CBCharacteristic *shakeCharacter;

//write read 的特征服务
@property (strong, nonatomic) CBCharacteristic *writeCharacter;
//Notify 的特征服务
@property (strong, nonatomic) CBCharacteristic *notifyCharacter;

//本地的特征服务
@property (strong, nonatomic) CBMutableCharacteristic *writeMutableCharact;

//连接失败定时器 10s
@property (strong, nonatomic) NSTimer *connectTimer;

//搜索超时定时器 60s
@property (strong, nonatomic) NSTimer *searchTimer;


@property (strong, nonatomic) NSMutableArray *devices;

@property (strong, nonatomic) CTCallCenter *callcenter;
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



//// 设备名
//#define DEVICENAME @"TW"
//// 服务UUID
//#define TRANSFER_SERVICE_UUID @"55FF"
//
////  特征UUID
//#define CHARACTERISTIC_SERVICE_UUID @"000033F1-0000-1000-8000-00805F9B34FB"
////  特征UUID
//#define CHARACTERISTIC_SERVICE_UUID_NOTIFY @"000033F2-0000-1000-8000-00805F9B34FB"

@implementation ViewController
#pragma mark --写入命令，同步数据

//- (void)setDateAndTime{
//    NSString *dateString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:0];
//    NSString *timeString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:1];
//    NSData *dataDate = [self dataWithHexstring:dateString];
//    NSData *dateTime = [self dataWithHexstring:timeString];
////    if (self.myPeripheral && self.writeCharacter) {
////        [self actionWriteWithData:dataDate];
////        [self actionWriteWithData:dateTime];
////    }
//    if (self.myPeripheral && self.writeMutableCharact) {
//        self.writeMutableCharact.value = [self dataWithHexstring:[self ToHex:(long long)HPLUSBluetoothCommandDate]];
//        [self actionWriteWithData:dataDate];
//        [self actionWriteWithData:dateTime];
//    }
//}
//
//- (void)setBlueAge:(NSUInteger )age Height:(NSUInteger )height Weight:(NSUInteger )weight Sex:(NSUInteger )sex{
//    if (age >= 255 || height >= 255 || weight >= 255) {
//        NSLog(@"年龄,身高,体重参数设置不正确,重新设置");
//        return;
//    }
//    if (sex == 0 || sex == 1) {}else{
//        NSLog(@"性别参数设置错误,重新设置");
//        return;
//    }
//    NSString *ageStr = [[self ToHex:(long long)HPLUSBluetoothCommandAge] stringByAppendingString:[NSString stringWithFormat:@"%zi",age]];
//    NSString *heightStr = [[self ToHex:(long long)HPLUSBluetoothCommandHeight] stringByAppendingString:[NSString stringWithFormat:@"%zi",height]];
//    NSString *weightStr = [[self ToHex:(long long)HPLUSBluetoothCommandWeight] stringByAppendingString:[NSString stringWithFormat:@"%zi",weight]];
//    NSString *sexStr = [[self ToHex:(long long)HPLUSBluetoothCommandSex] stringByAppendingString:[NSString stringWithFormat:@"%zi",sex]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:ageStr]];
//        [self actionWriteWithData:[self dataWithHexstring:heightStr]];
//        [self actionWriteWithData:[self dataWithHexstring:weightStr]];
//        [self actionWriteWithData:[self dataWithHexstring:sexStr]];
//    }
//    
//    
//}
//
//- (void)setScreenLightTime:(NSUInteger )time{
//    NSString *timeStr = [[self ToHex:(long long)HPLUSBluetoothCommandScreenTime] stringByAppendingString:[self ToHex:(long long)time]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:timeStr]];
//    }
//}
//- (void)setHeartRate_On{
//
//    NSString *heartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingHearRateOn]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:heartRateStr]];
//    }
//}
//- (void)setHeartRate_Off{
//    NSString *heartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingHearRateOff]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:heartRateStr]];
//    }
//}
//- (void)setRealHeartRate_On{
//    NSString *realHeartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandRealHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingRealHearRateOn]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:realHeartRateStr]];
//    }
//
//}
//- (void)setRealHeartRate_Off{
//    NSString *realHeartRateStr = [[self ToHex:(long long)HPLUSBluetoothCommandRealHearRate] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingRealHearRateOff]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:realHeartRateStr]];
//    }
//
//}
//- (void)setSedentaryRemindStartTime:(NSString *)startTime EndTime:(NSString *)endTime{
//    NSInteger startHours = [self IntegerFromStringTime:startTime TimeTag:0];
//    NSInteger startMinutes = [self IntegerFromStringTime:startTime TimeTag:1];
//    
//    NSInteger endHours = [self IntegerFromStringTime:endTime TimeTag:0];
//    NSInteger endMinutes = [self IntegerFromStringTime:endTime TimeTag:1];
//    
//    
//    if (startHours == 80 || startMinutes == 80 || endHours == 80 || endMinutes == 80) {
//        NSLog(@"久坐提醒命令写入不正确");
//        return;
//    }
//    NSString *sedentaryStr = [[[[[self ToHex:(long long)HPLUSBluetoothCommandSedentaryRemind] stringByAppendingString:[self ToHex:(long long)startHours]] stringByAppendingString:[self ToHex:(long long)startMinutes]] stringByAppendingString:[self ToHex:(long long)endHours]] stringByAppendingString:[self ToHex:(long long)endMinutes]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:sedentaryStr]];
//    }
//}
//- (void)setSocialRemindType:(NSUInteger)type{
//    NSString *socoalStr = [[self ToHex:(long long)HPLUSBluetoothCommandSocialRemind] stringByAppendingString:[self ToHex:(long long)type]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:socoalStr]];
//    }
//}
//
//- (void)setPhoneRemind{
//    NSString *phoneStr = [[self ToHex:(long long)HPLUSBluetoothCommandPhoneRemind] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingPhone]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:phoneStr]];
//    }
//}
//- (void)setMessageRemind{
//    NSString *messageStr = [[self ToHex:(long long)HPLUSBluetoothCommandMessageRemind] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingMessage]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:messageStr]];
//    }
//}
//
//- (void)setAlarmClockWithTime:(NSString *)time{
//    NSInteger hours = [self IntegerFromStringTime:time TimeTag:0];
//    NSInteger minutes = [self IntegerFromStringTime:time TimeTag:1];
//    if (hours == 80 || minutes == 80) {
//        NSLog(@"闹钟命令写入不正确");
//        return;
//    }
//    NSString *alarmStr = [[[self ToHex:(long long)HPLUSBluetoothCommandAlarmClock] stringByAppendingString:[self ToHex:(long long)hours]] stringByAppendingString:[self ToHex:(long long)minutes]];;
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:alarmStr]];
//    }
//
//}
//
//- (void)setClearAllData{
//    NSString *clearStr = [[self ToHex:(long long)HPLUSBluetoothCommandClearAllData] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingClear]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:clearStr]];
//    }
//}
//
//- (void)setReBoot{
//    NSString *reBootStr = [[self ToHex:(long long)HPLUSBluetoothCommandReboot] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingreBoot]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:reBootStr]];
//    }
//    
//}
//- (void)setPowerOff{
//    NSString *powerOffStr = [[self ToHex:(long long)HPLUSBluetoothCommandPowerOff] stringByAppendingString:[self ToHex:(long long)HPLUSBluetoothSettingPowerOff]];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:powerOffStr]];
//    }
//}
//- (HPLUSRunData *)getRunDataCommand{
//    NSString *runDataStr = [self ToHex:(long long)HPLUSBluetoothCommandRunData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:runDataStr]];
//    }
//    
//    return nil;
//}
//- (HPLUSleepData *)getSleepDataCommand{
//    NSString *sleepDataStr = [self ToHex:(long long)HPLUSBluetoothCommandSleepData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:sleepDataStr]];
//    }
//    return nil;
//}
//- (RealRunData *)getRealRunDataCommand{
//    NSString *realRunDataStr = [self ToHex:(long long)HPLUSBluetoothCommandSleepData];
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:[self dataWithHexstring:realRunDataStr]];
//    }
//    return nil;
//}
#pragma mark --StoryBoard 触发的命令



- (IBAction)messagere:(UIButton *)sender {
    sender.selected =! sender.selected;
    if (sender.selected) {
        [[HPLUSManager ShareManager] setMessageRemind];
        self.title = @"开短信提醒";
    }else{
        self.title = @"关短信提醒";
    }
}

- (IBAction)phonere:(UIButton *)sender {
    sender.selected =! sender.selected;
    if (sender.selected) {
        [[HPLUSManager ShareManager] setPhoneRemind];
        self.title = @"开phone提醒";
    }else{
        self.title = @"关phone提醒";
    }
}

- (IBAction)weixinre:(UIButton *)sender {
    sender.selected =! sender.selected;
    if (sender.selected) {
        [[HPLUSManager ShareManager] setSocialRemindType:2];
        self.title = @"开weixin提醒";
    }else{
        self.title = @"关weixin提醒";
    }
}

- (IBAction)QQre:(UIButton *)sender {
    sender.selected =! sender.selected;
    if (sender.selected) {
        [[HPLUSManager ShareManager] setSocialRemindType:0];
        self.title = @"开qq提醒";
    }else{
        self.title = @"关qq提醒";
    }

}

- (IBAction)alldayHeartRate:(UIButton *)sender {
    sender.selected =! sender.selected;
    if (sender.selected) {
        [[HPLUSManager ShareManager] setHeartRate_On];
        self.title = @"开全天心率提醒";
    }else{
        [[HPLUSManager ShareManager] setHeartRate_Off];
        self.title = @"关全天心率提醒";
    }
}

- (IBAction)clearalldata:(UIButton *)sender {
    self.title = @"ClearAllData";
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] setClearAllData];
//    }
}

- (IBAction)syncTime:(id)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] setDateAndTime];
        [[HPLUSManager ShareManager] setBlueAge:23 Height:178 Weight:65 Sex:0];
//    }
}
- (IBAction)getdata:(id)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] getRunDataCommand];
        [[HPLUSManager ShareManager] getSleepDataCommand];
//    }
}

- (IBAction)restart:(UIButton *)sender {
    
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] setReBoot];
//    }
}
- (IBAction)poweroff:(id)sender {
//    if (self.myPeripheral && self.writeCharacter) {
//        [self setPhoneRemind];
        [[HPLUSManager ShareManager] setMessageRemind];
//        [self setPowerOff];
//    }
}
- (IBAction)heartrate:(UIButton *)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        sender.selected =! sender.selected;
        if (sender.selected) {
            [[HPLUSManager ShareManager] setRealHeartRate_Off];
            self.title = @"心率检测关";
        }else{
            [[HPLUSManager ShareManager] setRealHeartRate_On];
            self.title = @"心率检测开";
        }
        
//    }
}
- (IBAction)screenLightTime:(id)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] setScreenLightTime:40];
//    }
}
- (IBAction)alarmClock:(UIButton *)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        sender.selected =! sender.selected;
        if (sender.selected) {
            [[HPLUSManager ShareManager] setAlarmClockWithTime:@"14:20"];
            self.title = @"开闹钟";
        }else{
            [[HPLUSManager ShareManager] setAlarmClockWithTime:@"255:255"];
            self.title = @"关闹钟";
        }
//    }
}
- (IBAction)sitRemind:(id)sender {
//    if (self.myPeripheral && self.writeCharacter) {
        [[HPLUSManager ShareManager] setSedentaryRemindStartTime:@"09:00" EndTime:@"17:00" TheIntervalTime:1];
//    }
}


- (IBAction)shake:(UIButton *)sender {
    //10-->16-->data
    //364e2b24 02bd01c1 05e00709 0a51009d 2e000000 运动数据
    //1ae00709 07000000 00f5003b 01010001 00162a  睡眠数据
    //33000000 000000f9 003600ff 000000 实时更新数据
    //byte-->data
    Byte byte1[19] = {0x36,0x4E,0x2B,0x24,0x02,0xBD,0x01,0xC1,0x05,0xe0,0x07,0x09,0x0a,0x51,0x00,0x9d,0x2e,0x00,0x00};
    NSData *rundata = [NSData dataWithBytes:byte1 length:19];
    Byte byte2[19] = {0x1a,0xe0,0x07,0x09,0x07,0x00,0x00,0x00,0x00,0xf5,0x00,0x3b,0x01,0x01,0x00,0x01,0x00,0x16,0x2a};
    Byte byte3[14] = {0x33,0x00,0x00,0x00,0x00,0x00,0x00,0xf9,0x00,0x36,0x00,0xff,0x00,0x00};
    //0x
    NSData *sleepdata = [NSData dataWithBytes:byte2 length:19];
    NSData *runnotifydata = [NSData dataWithBytes:byte3 length:14];
    NSLog(@"rundata = %@\nsleepdata = %@\nrunnotifydata = %@",rundata,sleepdata,runnotifydata);
    //data-->16
//    NSString *runStr = [self hexDatatoString:rundata];
//    NSString *sleepStr = [self hexDatatoString:sleepdata];
//    NSString *runnotifyStr = [self hexDatatoString:runnotifydata];
//    NSLog(@"runStr = %@\nsleepStr = %@",runStr,sleepStr);
    //16-->10
//    NSString *run = [self convertHexStrToString:runStr];
//    NSArray *run = [self ArrFromHexString:runStr];
//    NSArray *sleep = [self ArrFromHexString:sleepStr];
//    NSArray *notify = [self ArrFromHexString:runnotifyStr];
//    NSLog(@"run = %@\nsleep = %@\nnotify = %@",run,sleep,notify);
    

//   unsigned long run12 = strtoul([@"4e" UTF8String], 0, 16);
    
    
//    [self getSleepDataCommand];
//    [self getRunDataCommand];
    
    
    
    
    
    
    
//    NSString *dateString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:0];
//    NSString *timeString = [self hexStringWithDateString:[self stringFromCurrentDate] WithCommand:1];
    
//    NSString *dateString = [self hexStringWithDateString:@"2016-10-13-15-26-00" WithCommand:0];
//    NSString *timeString = [self hexStringWithDateString:@"2016-10-13-15-26-00" WithCommand:1];
//    NSLog(@"dateString = %@,timeString = %@",dateString,timeString);
    
    
//    NSData *dataDate = [self dataWithHexstring:dateString];
//    NSData *dateTime = [self dataWithHexstring:timeString];
//    
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:dataDate];
//        [self actionWriteWithData:dateTime];
//    }
//    Byte byte1[5] = {0x08,0x14,0x10,0x0A,0x0D};//设置日期 20161013
//    Byte byte2[4] = {0x09,0x0F,0x1A,0x00};//设置时间 15:26:00
//    
//    NSData *dateData = [NSData dataWithBytes:byte1 length:5];
//    NSData *timeData = [NSData dataWithBytes:byte2 length:4];
    
//    if (self.myPeripheral && self.writeCharacter) {
//        [self actionWriteWithData:dateData];
//        [self actionWriteWithData:timeData];
//    }
    
//    NSLog(@"LvdataDate = %@,dateTime = %@",dataDate,dateTime);
//    NSLog(@"YodateData = %@,timeData = %@",dateData,timeData);
    
//    if (self.myPeripheral && self.shakeCharacter) {
//        
//        Byte zd[1] = {0};
//        NSData *theData = [NSData dataWithBytes:zd length:1];
//        [self.myPeripheral writeValue:theData forCharacteristic:self.shakeCharacter type:CBCharacteristicWriteWithoutResponse];
//        self.title = @"设备停止抖动...";
//    }
}
- (IBAction)stopShake:(UIButton *)sender {
//    self.commandType = HPLUSBluetoothCommandPowerOff;
    if (self.myPeripheral && self.writeCharacter) {
//        switch (self.commandType) {
//            case HPLUSBluetoothCommandDate:
//               
//                break;
//            case HPLUSBluetoothCommandNo:
//                
//                break;
//            case HPLUSBluetoothCommandPowerOff:
//                [self actionWrite];
//                break;
//            case HPLUSBluetoothCommandReboot:
//
//                break;
//            case HPLUSBluetoothCommandClearAllData:
//
//                break;
//            case HPLUSBluetoothCommandSedentaryRemind:
// 
//                break;
//                
//            default:
//                break;
//        }

    }
    
    
    
    
    if (self.myPeripheral && self.shakeCharacter) {
        
        
        Byte zd[1] = {2};
        NSData *theData = [NSData dataWithBytes:zd length:1];
        [self.myPeripheral writeValue:theData forCharacteristic:self.shakeCharacter type:CBCharacteristicWriteWithoutResponse];
        self.title = @"设备开始抖动...";
    }
    
}
- (IBAction)disConnect:(UIButton *)sender {
    [[HPLUSManager ShareManager] disconnectPeripheral];
//    [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[nsinde]] withRowAnimation:UITableViewRowAnimationLeft];
//    if(self.myPeripheral){
//        [self.myCentralManager cancelPeripheralConnection:self.myPeripheral];
//        self.myPeripheral = nil;
//        self.shakeCharacter = nil;
//        self.title = @"设备连接已断开";
//    }
}
- (IBAction)startSearch:(UIButton *)sender {
    [[HPLUSManager ShareManager] initCentralManager];
//    if (!self.myCentralManager) {
//        //设置代理
//        self.myCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
//        self.title = @"蓝牙设备管理";
//    }else{
//        [self centralManagerDidUpdateState:self.myCentralManager];
//    }
    
}
- (void)actionWrite{
//    Byte byte[2] = {0xA5,0x5A};//重启
//    Byte byte[2] = {0x5B,0x5A};//关机
//    Byte byte[2] = {0xD8,0x5A};//清除所有数据
    
    
    
//    Byte byte1[5] = {0x1E,0x09,0x00,0x12,0x00};//久坐提醒开始时间09:00 结束时间 18:00
//    Byte byte2[3] = {0x0C,0x10,0x00};//闹钟功能 16:00
//    Byte byte3[2] = {0x0C,0x0A};//开心率监测  10->开 255->关 0xFF
//    Byte byte4[2] = {0x07,0xAA};//短信提醒
//    Byte byte5[2] = {0x06,0xAA};//电话提醒
//    Byte byte6[2] = {0x31,0x01};//社交提醒 社交类型。 0x01->QQ ; 0x02->微信; 0x03->Facebook;  0x04->Twitter。
//    [self actionWriteCommandWith:byte1 length:5];
//    [self actionWriteCommandWith:byte2 length:3];
//    [self actionWriteCommandWith:byte3 length:2];
//    [self actionWriteCommandWith:byte4 length:2];
//    [self actionWriteCommandWith:byte5 length:2];
//    [self actionWriteCommandWith:byte6 length:2];
    
//    Byte byte1[1] = {0x17};//获取版本号  182302缺少数据的解析
//    [self actionWriteCommandWith:byte1 length:1];
    
    
//    Byte byte2[1] = {0x15};//获取运动数据
//    Byte byte3[1] = {0x19};//获取睡眠数据
//    [self actionWriteCommandWith:byte2 length:1];
//    [self actionWriteCommandWith:byte3 length:1];
    
//    Byte byte[2] = {0x0B,0x1E};//设置屏保时间  30s
//    [self actionWriteCommandWith:byte length:2];
    
//    Byte byte1[2] = {0x2D,0x00};//设置性别 0x00->男性, 0x01->女性
//    Byte byte2[2] = {0x2C,0x00};//设置年龄 25岁
//    Byte byte3[2] = {0x04,0xAF};//设置身高 175cm
//    Byte byte4[2] = {0x05,0x41};//设置体重 65kg
//    [self actionWriteCommandWith:byte1 length:2];
//    [self actionWriteCommandWith:byte2 length:2];
//    [self actionWriteCommandWith:byte3 length:2];
//    [self actionWriteCommandWith:byte4 length:2];
    
    Byte byte1[5] = {0x08,0x14,0x10,0x0A,0x0D};//设置日期 20161013
    
//    Byte byte2[4] = {0x09,0x0F,0x1A,0x00};//设置时间 15:26:00
    [self actionWriteCommandWith:byte1 length:5];
//    [self actionWriteCommandWith:byte2 length:4];
}

- (void)actionWriteWithData:(NSData *)commandData{
    [self.myPeripheral writeValue:commandData forCharacteristic:self.writeCharacter type:CBCharacteristicWriteWithResponse];
}
- (void)actionWriteCommandWith:(const void *)byte length:(NSUInteger )length{
    
    NSData *commandData = [NSData dataWithBytes:byte length:length];
    [self.myPeripheral writeValue:commandData forCharacteristic:self.writeCharacter type:CBCharacteristicWriteWithResponse];
}
#pragma mark --lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    callback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo){
//        
//    };
    
    self.callcenter = [[CTCallCenter alloc] init];
    self.callcenter.callEventHandler = ^(CTCall *call){
        if ([call.callState isEqualToString:@"CTCallStateDialing"]) {
            NSLog(@"CTCallStateDialing callid = %@,calldesc = %@",call.callID,call.description);
            //正在呼叫状态
        }
        if ([call.callState isEqualToString:@"CTCallStateDisconnected"]) {
            NSLog(@"CTCallStateDisconnected callid = %@",call.callID);
            //断开连接状态
        }
        if ([call.callState isEqualToString:@"CTCallStateIncoming"]) {
            NSLog(@"CTCallStateIncoming callid = %@,calldesc = %@",call.callID,call.description);
            //断开连接状态
        }
        if ([call.callState isEqualToString:@"CTCallStateConnected"]) {
            NSLog(@"CTCallStateConnected callid = %@",call.callID);
            //断开连接状态
        }
    };
    
    [HPLUSManager ShareManager].HPLUSManagerDevicesBlock = ^(NSMutableArray *arr){
        self.devices = arr;
        NSLog(@"arr = %@",arr);
        [self.myTableView reloadData];
    };
    
    [HPLUSManager ShareManager].HPLUSManagerRealDataBlock = ^(RealRunData *model){
        self.realLable.text = [NSString stringWithFormat:@"realStep = %@,realDistance = %@,realCalories =%@,staticCalories = %@,battery = %@,heartRate= %@",model.realStep,model.realDistance,model.realCalories,model.staticCalories,model.battery,model.heartRate];
    };
    
    [HPLUSManager ShareManager].HPLUSManagerTitleBlock = ^(NSString *text){
        self.msgLable.text = text;
    };
    
    
    
//    [[HPLUSManager ShareManager] addObserver:self forKeyPath:@"devices" options:NSKeyValueObservingOptionNew context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

//#pragma mark --蓝牙设备
//检查蓝牙状态
/*
 
 

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
//                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:[NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:@"prefs:root=Bluetooth"]] completionHandler:^(BOOL success) {
//                            
//                            }];
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
        if (peiii != nil) {
            NSLog(@"系统存储的配对设备 = %@",peiii);
            if (self.devices.count) {
                [self.devices removeAllObjects];
            }
            [self.devices addObject:peiii];
            [self.myTableView reloadData];
        }else{
            NSLog(@"无系统存储的设备");
            //重连已连接的设备
            CBPeripheral *pe = [self retrievePeripheral:TRANSFER_SERVICE_UUID];
            if (pe != nil)  {
                if (self.devices.count) {
                    [self.devices removeAllObjects];
                }
                [self.devices addObject:pe];
                [self.myTableView reloadData];
                NSLog(@"已经连接系统中的配对设备 = %@",pe);
            }else{
                NSLog(@"搜索新的设备");
            }
        }
    }
    
    [self.myCentralManager scanForPeripheralsWithServices:nil options:nil];

    
    _searchTimer = [NSTimer scheduledTimerWithTimeInterval:60.f target:self selector:@selector(searchTimeout:) userInfo:self.myPeripheral repeats:NO];
}
- (CBPeripheral *)retrievePeripheral:(NSString *)uuidString{
    NSUUID *nsUUID = [[NSUUID UUID] initWithUUIDString:uuidString];
    if(nsUUID){
        NSArray *peripheralArray = [self.myCentralManager retrievePeripheralsWithIdentifiers:@[nsUUID]];
        if([peripheralArray count] > 0){
            for(CBPeripheral *peripheral in peripheralArray){
                NSLog(@"Connecting to Peripheral - %@", peripheral);
                if (peripheral.state == CBPeripheralStateDisconnected) {
                    [self.myCentralManager connectPeripheral:peripheral options:nil];
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
                        [self.myCentralManager connectPeripheral:peripheral options:nil];
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
//    if ([peripheral.name hasPrefix:DEVICENAME]) {
    if (peripheral.name.length) {
        if (self.devices.count > 0) {
            if (![self.devices containsObject:peripheral]) {
                NSLog(@"查找到设备name = %@, identifier = %@,Data = %@",peripheral.name,peripheral.identifier,advertisementData);
                [self.devices addObject:peripheral];
                [self.myTableView reloadData];
            }
        }else{
            [self.devices addObject:peripheral];
            NSLog(@"查找到设备name = %@, identifier = %@,data = %@",peripheral.name,peripheral.identifier,advertisementData);
            [self.myTableView reloadData];
        }
    }
//        }
    if ([peripheral.name hasPrefix:DEVICENAME]) {
        
        if (self.myPeripheral != peripheral) {
//            [self connectWithPeripheral:peripheral];
        }
//        NSLog(@"查找到设备%@===%@",peripheral.name,advertisementData);

    }
}

- (void)connectWithPeripheral:(CBPeripheral *)peripheral{
    self.myPeripheral = peripheral;
    //连接指定的设备
    self.title = @"发现HPLUS手环，开始连接...";
//    [central connectPeripheral:self.myPeripheral options:nil];
    
    [self.myCentralManager connectPeripheral:self.myPeripheral options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnConnectionKey]];
    
    _connectTimer = [NSTimer scheduledTimerWithTimeInterval:10.f target:self selector:@selector(connectTimeout:) userInfo:self.myPeripheral repeats:NO];
    [self.myCentralManager stopScan];
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
    [_connectTimer invalidate];
    [self.myCentralManager stopScan];
    
    HPLUSConnectModel *model = [[HPLUSConnectModel alloc] init];
    model.name = peripheral.name;
    model.identifier = peripheral.identifier.UUIDString;
    if (peripheral.state == CBPeripheralStateDisconnected) {
        model.isConnected = NO;
    }else if(peripheral.state == CBPeripheralStateConnected){
         model.isConnected = YES;
    }else{
        model.isConnected = NO;
    }
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
    self.title = @"连接已断开,重新连接中";
    self.msgLable.text = @"null";
}
//连接蓝牙设备失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"连接蓝牙设备失败！%@ %@",[peripheral name],[error localizedDescription]);
    self.title = @"连接失败";
    self.msgLable.text = @"fail=%@",[peripheral name];
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
    self.msgLable.text = [peripheral.name stringByAppendingString:[NSString stringWithFormat:@"\n%@",peripheral.services]];
    
    for (CBService *service in peripheral.services) {
        NSLog(@"uuidstring = %@",service.UUID.UUIDString);
        [peripheral discoverCharacteristics:nil forService:service];
        //判断service的UUID
//        if ([service.UUID.UUIDString isEqual:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]]) {
////            NSLog(@"特征服务 ＝ %@",[CBUUID UUIDWithString:CHARACTERISTIC_SERVICE_UUID]);
//            [peripheral discoverCharacteristics:nil forService:service];
//        }else{
//             NSLog(@"特征服务 ＝ %@",[CBUUID UUIDWithString:CHARACTERISTIC_SERVICE_UUID]);
//        }
  
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
            self.writeMutableCharact = [[CBMutableCharacteristic alloc] initWithType:characteristic.UUID properties:characteristic.properties value:nil permissions:CBAttributePermissionsWriteable|CBAttributePermissionsReadable];
//            [self setDateAndTime];
//            [self setBlueAge:23 Height:178 Weight:65 Sex:0];
//            [self setPhoneRemind];
//            [self setMessageRemind];
//            [self getRunDataCommand];
//            [self getSleepDataCommand];
//            [peripheral readValueForCharacteristic:characteristic];
        }else if([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_SERVICE_UUID_NOTIFY]){
            NSLog(@"lv UUID_NOTIFY");
            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
//            [peripheral readValueForCharacteristic:characteristic];
            self.notifyCharacter = characteristic;
        }else{
            NSLog(@"lv other  characteristic=%@",service.UUID);
        }
        
        
        
        
//        if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_1]) {
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_2]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_3]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_4]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Step]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Battery]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Shake]){
//            self.shakeCharacter = characteristic;
//        }else if ([characteristic.UUID.UUIDString isEqualToString:CHARA_UUIDSTRING_Device]){
//            [peripheral readValueForCharacteristic:characteristic];
//            
//        }
        
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
//        NSLog(@"characteristic = %@",characteristic);
    }else{
//        [peripheral readValueForCharacteristic:characteristic];
//        NSLog(@"Notification stopped on %@.  Disconnecting", characteristic);
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
            [HPLUSRunData initWithDateTime:[NSString stringWithFormat:@"%@-%@-%@",[self strtoulWithStringHigh:run[10] Low:run[9]],[self strtoulWithString:run[11]],[self strtoulWithString:run[12]]] Step:[self strtoulWithStringHigh:run[2] Low:run[1]] Distance:[self strtoulWithStringHigh:run[4] Low:run[3]] RunCalories:[self strtoulWithStringHigh:run[6] Low:run[5]] StaticCalories:[self strtoulWithStringHigh:run[8] Low:run[7]] RunTimes:[self strtoulWithStringHigh:run[14] Low:run[13]] MaxHeartRate:[self strtoulWithString:run[15]] MinHeartRate:[self strtoulWithString:run[16]]];
            
//            NSLog(@"run = %@",run);
        }else if ([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingSleepData]]){
            NSString *sleepStr = [self hexDatatoString:characteristic.value];
            NSArray *sleep = [self ArrFromHexString:sleepStr];
            if (sleep.count < 19) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            NSLog(@"sleep value = %@",characteristic.value);
            [HPLUSleepData initWithDateTime:[NSString stringWithFormat:@"%@-%@-%@",[self strtoulWithStringHigh:sleep[2] Low:sleep[1]],[self strtoulWithString:sleep[3]],[self strtoulWithString:sleep[4]]] SleepDate:[self strtoulWithStringHigh:sleep[6] Low:sleep[5]] SecondSleepDate:[self strtoulWithStringHigh:sleep[8] Low:sleep[7]] DeepSleepDate:[self strtoulWithStringHigh:sleep[10] Low:sleep[9]] ShallowSleepDate:[self strtoulWithStringHigh:sleep[12] Low:sleep[11]] WakeUpTimes:[NSString stringWithFormat:@"%@:%@",[self strtoulWithString:sleep[14]],[self strtoulWithString:sleep[13]]] WakeUpDate:[self strtoulWithStringHigh:sleep[16] Low:sleep[15]] StartDate:[NSString stringWithFormat:@"%@:%@",[self strtoulWithString:sleep[17]],[self strtoulWithString:sleep[18]]]];
//            NSLog(@"sleep = %@",sleep);
        }else if ([hexString isEqualToString:[self ToHex:(long long)HPLUSBluetoothSettingRealTimeData]]){
            NSString *runnotifyStr = [self hexDatatoString:characteristic.value];
            NSArray *notify = [self ArrFromHexString:runnotifyStr];
            if (notify.count < 14) {
                NSLog(@"同步数据解析不正确");
                return;
            }
            NSLog(@"notify value = %@",characteristic.value);
            [RealRunData initWithRealStep:[self strtoulWithStringHigh:notify[2] Low:notify[1]] RealDistance:[self strtoulWithStringHigh:notify[4] Low:notify[3]] RealCalories:[self strtoulWithStringHigh:notify[6] Low:notify[5]] StaticCalories:[self strtoulWithStringHigh:notify[8] Low:notify[7]] Battery:[NSString stringWithFormat:@"%@%%",[self strtoulWithString:notify[9]]] HeartRate:[self strtoulWithString:notify[11]]];
//            NSLog(@"notify = %@",notify);
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
 
#pragma mark --10转16进制
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
//16进制解析  字符串拆分成数组
- (NSMutableArray *)ArrFromHexString:(NSString *)tmpid{
    NSMutableArray *arr = [NSMutableArray array];
    if ([tmpid length]%2 != 0) {
//        NSLog(@"解析的数据格式不正确lenght = %d",tmpid.length);
        tmpid = [tmpid substringToIndex:tmpid.length - 1];
    }
    for (int i = 0; i < tmpid.length/2; i ++) {
        NSString *subTmpid = [tmpid substringWithRange:NSMakeRange(i*2, 2)];
//        int tempInt = [self IntFromHexString:subTmpid];
//        NSString * temp10 = [NSString stringWithFormat:@"%lu",strtoul([subTmpid UTF8String],0,16)];
//        [arr addObject:temp10];
            [arr addObject:subTmpid];
//        [arr addObject:[NSString stringWithFormat:@"%d",tempInt]];
    }
    return arr;
}
//16进制解析  16转10进制字符串高位和低位
- (NSString *)strtoulWithStringHigh:(NSString *)highStr Low:(NSString *)lowStr{
    NSString *temp16 = [NSString stringWithFormat:@"%@%@",highStr,lowStr];
    NSString * temp10 = [NSString stringWithFormat:@"%lu",strtoul([temp16 UTF8String],0,16)];
//    NSLog(@"temp10 = %@",temp10);
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
#pragma mark --command detail
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
 */
#pragma mark --lazyload
- (NSMutableArray *)devices{
    if (!_devices) {
        _devices = [[NSMutableArray alloc] init];
    }
    return _devices;
}

#pragma mark --UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellid"];
    }
    CBPeripheral *peripheral = [self.devices objectAtIndex:indexPath.row];
    cell.textLabel.text = peripheral.name;
    cell.detailTextLabel.text = [peripheral.RSSI stringValue];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.devices.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

     CBPeripheral *peripheral = [self.devices objectAtIndex:indexPath.row];
    switch (peripheral.state) {
        case CBPeripheralStateDisconnected:
            NSLog(@"CBPeripheralStateDisconnected");
            [[HPLUSManager ShareManager] connectWithPeripheral:peripheral];
            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        case CBPeripheralStateConnecting:
            NSLog(@"CBPeripheralStateConnecting");
            break;
        case CBPeripheralStateConnected:
            NSLog(@"CBPeripheralStateConnected");
            [[HPLUSManager ShareManager] cancleConnectWithPeripheral:peripheral];
            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        case CBPeripheralStateDisconnecting:
            NSLog(@"CBPeripheralStateDisconnecting");
            break;
            
        default:
            break;
    }
    
}


#pragma mark --NSCoding
/*
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
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
