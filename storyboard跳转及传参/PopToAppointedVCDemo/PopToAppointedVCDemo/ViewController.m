//
//  ViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//


#define LRWeakSelf(type)  __weak typeof(type) weak##type = type //##表示连接，把weak和self连接
#define LRToast(str) [NSString stringWithFormat:@"%@",@#str]//新用法，代替@“”



#import "ViewController.h"
#import "FirstViewController.h"
#import "UIViewController+CustomTracker.h"
#import "NSString+ForbidEmoji.h"
#import "sys/utsname.h"
#import "AppDelegate.h"
#import "AdLaunchScreenViewController.h"
#import "LaunchView.h"

static NSString *kStoreAppId = @"647753529";

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    UIView *_adLaunchView;
    UIWindow * tempWindow;
}
@end

@implementation ViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initAdView) name:@"active" object:nil];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"123abc");
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //输出结果：ACDB；如果dispatch_after放到dispatch_get_global_queue队列则输出结果为：ACDB或ACBD
    NSLog(@"A");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           NSLog(@"B   ----- ");
       });
        NSLog(@"C");
    });
    NSLog(@"D");
    
    
    //NSString *str = 0;//不会报错,打印出来是nil
    //NSString *str1 = @"0";
    //NSLog(@"-----%@------%@",str,str1);
    //NSString *dateStr = [NSString stringWithFormat:@"%@",[self getNowDateFromatAnDate:[NSDate date]]];
    //NSString *weekStr = [self weekdayStringFromDate:[NSDate date]];
    //NSLog(@"str = %@   week = %@",dateStr,weekStr);
    //AppDelegate *dele = [UIApplication sharedApplication].delegate;
    //if ([dele.window isEqual:self.view.window]) {//判断当前view所在的window是否和keywindow一样
        
    //}
    
    // Do any additional setup after loading the view, typically from a nib.
    //[self initAdView];
    //NSLog(@"123abc");
    //[self deviceInfo];
    //[self otherInit];
    
}

- (BOOL)isContaintString:(NSString *)containString forDestination:(NSString *)destinationString
{
    //在str1这个字符串中搜索containString，判断有没有
    //rangeOfString 前面的参数是要被搜索的字符串，后面的是要搜索的字符
    //NSNotFound 表示请求操作的某个内容或者item没有发现，或者不存在
    if ([destinationString rangeOfString:containString options:NSCaseInsensitiveSearch].location != NSNotFound) {
        NSLog(@"这个字符串中有containString");
        return YES;
    }else{
        return NO;
    }
    
}

/**
 *  @author Cherry, 2016-01-25 14:49:47
 *
 *  @brief 匹配银行卡对应的银行
 *
 *  @param banknumber 银行卡号
 *
 *  @return 返回所属银行
 */
-(NSString *)backbankenameWithBanknumber:(NSString *)banknumber{
    
    NSString *bankNumber = [banknumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSDictionary *dic;
    NSString *bank = @"";
    NSString *bank1 = @"";
    NSString *bank2 = @"";
    NSString *bankname;
    bank1 = [bankNumber substringToIndex:5];
    bank = [bankNumber substringToIndex:6];
    bank2 = [bankNumber substringToIndex:8];
    if (!dic) {
        dic = @{@"402791":@"工商银行",@"427028":@"工商银行",@"427038":@"工商银行",@"548259":@"工商银行",@"620200":@"工商银行",@"620302":@"工商银行",@"620402":@"工商银行",@"620403":@"工商银行",@"620404":@"工商银行",@"620405":@"工商银行",@"620406":@"工商银行",@"620407":@"工商银行",@"620408":@"工商银行",@"620409":@"工商银行",@"620410":@"工商银行",@"620411":@"工商银行",@"620412":@"工商银行",@"620502":@"工商银行",@"620503":@"工商银行",@"620512":@"工商银行",@"620602":@"工商银行",@"620604":@"工商银行",@"620607":@"工商银行",@"620609":@"工商银行",@"620611":@"工商银行",@"620612":@"工商银行",@"620704":@"工商银行",@"620706":@"工商银行",@"620707":@"工商银行",@"620708":@"工商银行",@"620709":@"工商银行",@"620710":@"工商银行",@"620711":@"工商银行",@"620712":@"工商银行",@"620713":@"工商银行",@"620714":@"工商银行",@"620802":@"工商银行",@"620904":@"工商银行",@"620905":@"工商银行",@"621101":@"工商银行",@"621102":@"工商银行",@"621103":@"工商银行",@"621105":@"工商银行",@"621106":@"工商银行",@"621107":@"工商银行",@"621202":@"工商银行",@"621203":@"工商银行",@"621204":@"工商银行",@"621205":@"工商银行",@"621206":@"工商银行",@"621207":@"工商银行",@"621208":@"工商银行",@"621209":@"工商银行",@"621210":@"工商银行",@"621211":@"工商银行",@"621302":@"工商银行",@"621303":@"工商银行",@"621304":@"工商银行",@"621305":@"工商银行",@"621306":@"工商银行",@"621307":@"工商银行",@"621308":@"工商银行",@"621309":@"工商银行",@"621311":@"工商银行",@"621313":@"工商银行",@"621315":@"工商银行",@"621317":@"工商银行",@"621402":@"工商银行",@"621404":@"工商银行",@"621405":@"工商银行",@"621406":@"工商银行",@"621407":@"工商银行",@"621408":@"工商银行",@"621409":@"工商银行",@"621410":@"工商银行",@"621502":@"工商银行",@"621511":@"工商银行",@"621602":@"工商银行",@"621603":@"工商银行",@"621604":@"工商银行",@"621605":@"工商银行",@"621606":@"工商银行",@"621607":@"工商银行",@"621608":@"工商银行",@"621609":@"工商银行",@"621610":@"工商银行",@"621611":@"工商银行",@"621612":@"工商银行",@"621613":@"工商银行",@"621614":@"工商银行",@"621615":@"工商银行",@"621616":@"工商银行",@"621617":@"工商银行",@"621804":@"工商银行",@"621807":@"工商银行",@"621813":@"工商银行",@"621814":@"工商银行",@"621817":@"工商银行",@"621901":@"工商银行",@"621903":@"工商银行",@"621904":@"工商银行",@"621905":@"工商银行",@"621906":@"工商银行",@"621907":@"工商银行",@"621908":@"工商银行",@"621909":@"工商银行",@"621910":@"工商银行",@"621911":@"工商银行",@"621912":@"工商银行",@"621913":@"工商银行",@"621914":@"工商银行",@"621915":@"工商银行",@"622002":@"工商银行",@"622003":@"工商银行",@"622004":@"工商银行",@"622005":@"工商银行",@"622006":@"工商银行",@"622007":@"工商银行",@"622008":@"工商银行",@"622009":@"工商银行",@"622010":@"工商银行",@"622011":@"工商银行",@"622012":@"工商银行",@"622013":@"工商银行",@"622014":@"工商银行",@"622015":@"工商银行",@"622016":@"工商银行",@"622017":@"工商银行",@"622018":@"工商银行",@"622019":@"工商银行",@"622020":@"工商银行",@"622102":@"工商银行",@"622103":@"工商银行",@"622104":@"工商银行",@"622105":@"工商银行",@"622110":@"工商银行",@"622111":@"工商银行",@"622114":@"工商银行",@"622302":@"工商银行",@"622303":@"工商银行",@"622304":@"工商银行",@"622305":@"工商银行",@"622306":@"工商银行",@"622307":@"工商银行",@"622308":@"工商银行",@"622309":@"工商银行",@"622313":@"工商银行",@"622314":@"工商银行",@"622315":@"工商银行",@"622317":@"工商银行",@"622402":@"工商银行",@"622403":@"工商银行",@"622404":@"工商银行",@"622502":@"工商银行",@"622504":@"工商银行",@"622505":@"工商银行",@"622509":@"工商银行",@"622510":@"工商银行",@"622513":@"工商银行",@"622517":@"工商银行",@"622604":@"工商银行",@"622605":@"工商银行",@"622606":@"工商银行",@"622703":@"工商银行",@"622706":@"工商银行",@"622715":@"工商银行",@"622806":@"工商银行",@"622902":@"工商银行",@"622903":@"工商银行",@"622904":@"工商银行",@"623002":@"工商银行",@"623006":@"工商银行",@"623008":@"工商银行",@"623011":@"工商银行",@"623012":@"工商银行",@"623014":@"工商银行",@"623015":@"工商银行",@"623100":@"工商银行",@"623202":@"工商银行",@"623301":@"工商银行",@"623400":@"工商银行",@"623500":@"工商银行",@"623602":@"工商银行",@"623700":@"工商银行",@"623803":@"工商银行",@"623901":@"工商银行",@"624000":@"工商银行",@"624100":@"工商银行",@"624200":@"工商银行",@"624301":@"工商银行",@"624402":@"工商银行",@"620058":@"工商银行",@"620516":@"工商银行",@"621225":@"工商银行",@"621226":@"工商银行",@"621227":@"工商银行",@"621281":@"工商银行",@"621288":@"工商银行",@"621721":@"工商银行",@"621722":@"工商银行",@"621723":@"工商银行",@"622200":@"工商银行",@"622202":@"工商银行",@"622203":@"工商银行",@"622208":@"工商银行",@"900000":@"工商银行",@"900010":@"工商银行",@"620086":@"工商银行",@"621558":@"工商银行",@"621559":@"工商银行",@"621618":@"工商银行",@"621670":@"工商银行",@"623062":@"工商银行",@"421349":@"建设银行",@"434061":@"建设银行",@"434062":@"建设银行",@"524094":@"建设银行",@"526410":@"建设银行",@"552245":@"建设银行",@"621080":@"建设银行",@"621082":@"建设银行",@"621466":@"建设银行",@"621488":@"建设银行",@"621499":@"建设银行",@"622966":@"建设银行",@"622988":@"建设银行",@"436742":@"建设银行",@"589970":@"建设银行",@"620060":@"建设银行",@"621081":@"建设银行",@"621284":@"建设银行",@"621467":@"建设银行",@"621598":@"建设银行",@"621621":@"建设银行",@"621700":@"建设银行",@"622280":@"建设银行",@"622700":@"建设银行",@"436742":@"建设银行",@"622280":@"建设银行",@"623211":@"建设银行",@"620059":@"农业银行",@"621282":@"农业银行",@"621336":@"农业银行",@"621619":@"农业银行",@"621671":@"农业银行",@"622821":@"农业银行",@"622822":@"农业银行",@"622823":@"农业银行",@"622824":@"农业银行",@"622825":@"农业银行",@"622826":@"农业银行",@"622827":@"农业银行",@"622828":@"农业银行",@"622840":@"农业银行",@"622841":@"农业银行",@"622843":@"农业银行",@"622844":@"农业银行",@"622845":@"农业银行",@"622846":@"农业银行",@"622847":@"农业银行",@"622848":@"农业银行",@"622849":@"农业银行",@"623018":@"农业银行",@"623206":@"农业银行",@"621626":@"平安银行",@"623058":@"平安银行",@"602907":@"平安银行",@"622298":@"平安银行",@"622986":@"平安银行",@"622989":@"平安银行",@"627066":@"平安银行",@"627067":@"平安银行",@"627068":@"平安银行",@"627069":@"平安银行",@"412962":@"发展银行",@"412963":@"发展银行",@"415752":@"发展银行",@"415753":@"发展银行",@"622535":@"发展银行",@"622536":@"发展银行",@"622538":@"发展银行",@"622539":@"发展银行",@"622983":@"发展银行",@"998800":@"发展银行",@"690755":@"招商银行",@"402658":@"招商银行",@"410062":@"招商银行",@"468203":@"招商银行",@"512425":@"招商银行",@"524011":@"招商银行",@"621286":@"招商银行",@"622580":@"招商银行",@"622588":@"招商银行",@"622598":@"招商银行",@"622609":@"招商银行",@"690755":@"招商银行",@"433670":@"中信银行",@"433671":@"中信银行",@"433680":@"中信银行",@"442729":@"中信银行",@"442730":@"中信银行",@"620082":@"中信银行",@"621767":@"中信银行",@"621768":@"中信银行",@"621770":@"中信银行",@"621771":@"中信银行",@"621772":@"中信银行",@"621773":@"中信银行",@"622690":@"中信银行",@"622691":@"中信银行",@"622692":@"中信银行",@"622696":@"中信银行",@"622698":@"中信银行",@"622998":@"中信银行",@"622999":@"中信银行",@"968807":@"中信银行",@"968808":@"中信银行",@"968809":@"中信银行",@"620085":@"广大银行",@"620518":@"广大银行",@"621489":@"广大银行",@"621492":@"广大银行",@"622660":@"广大银行",@"622661":@"广大银行",@"622662":@"广大银行",@"622663":@"广大银行",@"622664":@"广大银行",@"622665":@"广大银行",@"622666":@"广大银行",@"622667":@"广大银行",@"622668":@"广大银行",@"622669":@"广大银行",@"622670":@"广大银行",@"622671":@"广大银行",@"622672":@"广大银行",@"622673":@"广大银行",@"622674":@"广大银行",@"620535":@"广大银行",@"622516":@"浦发银行",@"622517":@"浦发银行",@"622518":@"浦发银行",@"622521":@"浦发银行",@"622522":@"浦发银行",@"622523":@"浦发银行",@"984301":@"浦发银行",@"984303":@"浦发银行",@"621352":@"浦发银行",@"621793":@"浦发银行",@"621795":@"浦发银行",@"621796":@"浦发银行",@"621351":@"浦发银行",@"621390":@"浦发银行",@"621792":@"浦发银行",@"621791":@"浦发银行",@"84301":@"浦发银行",@"84336":@"浦发银行",@"84373":@"浦发银行",@"84385":@"浦发银行",@"84390":@"浦发银行",@"87000":@"浦发银行",@"87010":@"浦发银行",@"87030":@"浦发银行",@"87040":@"浦发银行",@"84380":@"浦发银行",@"84361":@"浦发银行",@"87050":@"浦发银行",@"84342":@"浦发银行",@"415599":@"民生银行",@"421393":@"民生银行",@"421865":@"民生银行",@"427570":@"民生银行",@"427571":@"民生银行",@"472067":@"民生银行",@"472068":@"民生银行",@"622615":@"民生银行",@"622616":@"民生银行",@"622617":@"民生银行",@"622618":@"民生银行",@"622619":@"民生银行",@"622620":@"民生银行",@"622622":@"民生银行",@"601428":@"交通银行",@"405512":@"交通银行",@"622258":@"交通银行",@"622259":@"交通银行",@"622260":@"交通银行",@"622261":@"交通银行",@"622262":@"交通银行",@"621056":@"交通银行",@"621335":@"交通银行",@"621096":@"邮政储蓄银行",@"621098":@"邮政储蓄银行",@"622150":@"邮政储蓄银行",@"622151":@"邮政储蓄银行",@"622181":@"邮政储蓄银行",@"622188":@"邮政储蓄银行",@"955100":@"邮政储蓄银行",@"621095":@"邮政储蓄银行",@"620062":@"邮政储蓄银行",@"621285":@"邮政储蓄银行",@"621798":@"邮政储蓄银行",@"621799":@"邮政储蓄银行",@"621797":@"邮政储蓄银行",@"620529":@"邮政储蓄银行",@"622199":@"邮政储蓄银行",@"62215049":@"邮政储蓄银行",@"62215050":@"邮政储蓄银行",@"62215051":@"邮政储蓄银行",@"62218850":@"邮政储蓄银行",@"62218851":@"邮政储蓄银行",@"62218849":@"邮政储蓄银行",@"621622":@"邮政储蓄银行",@"621599":@"邮政储蓄银行",@"623219":@"邮政储蓄银行",@"621674":@"邮政储蓄银行",@"623218":@"邮政储蓄银行",@"621660":@"中国银行",@"621661":@"中国银行",@"621662":@"中国银行",@"621663":@"中国银行",@"621665":@"中国银行",@"621667":@"中国银行",@"621668":@"中国银行",@"621669":@"中国银行",@"621666":@"中国银行",@"456351":@"中国银行",@"601382":@"中国银行",@"621256":@"中国银行",@"621212":@"中国银行",@"621283":@"中国银行",@"620061":@"中国银行",@"621725":@"中国银行",@"621330":@"中国银行",@"621331":@"中国银行",@"621332":@"中国银行",@"621333":@"中国银行",@"621297":@"中国银行",@"621568":@"中国银行",@"621569":@"中国银行",@"621672":@"中国银行",@"623208":@"中国银行",@"621620":@"中国银行",@"621756":@"中国银行",@"621757":@"中国银行",@"621758":@"中国银行",@"621759":@"中国银行",@"621785":@"中国银行",@"621786":@"中国银行",@"621787":@"中国银行",@"621788":@"中国银行",@"621789":@"中国银行",@"621790":@"中国银行"};
    }
    
    for (NSString *s in [dic allKeys]) {
        if ([bank1 isEqualToString:s]||[bank isEqualToString:s]||[bank2 isEqualToString:s]) {
            //            bankname = [dic objectForKey:s];
            bankname = dic[s];
            NSLog(@"bankname%@",bankname);
            break ;
        }else{
            [self.inputTF becomeFirstResponder];
            bankname = @"银行卡输入有误";
        }
    }
    
    return bankname;
}

/*
    检测银行卡是否符合规则
 */
- (BOOL) checkCardNo:(NSString*) cardNo{
    cardNo = [cardNo stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!cardNo || cardNo.length == 0) {
        [self.inputTF becomeFirstResponder];
        self.inputTV.text = @"请输入银行卡号";
        return NO;
    }
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

/**
 *  @author cherry
 *
 *  获取源日期与现在日期的差值
 *
 *  @param anyDate 源日期
 *
 *  @return 返回现在日期
 */
- (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT-0800"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

/**
 *  @author Cherry, 2016-01-25 14:50:56
 *
 *  @brief 根据日期获取星期信息
 *
 *  @param inputDate 指定日期
 *
 *  @return 返回星期几
 */
- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    //NSTimeZone* timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT-0800"];
    //NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

-(void)initAdView
{
    NSLog(@"----initAdView方法调用-%@----", self);
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    AdLaunchScreenViewController *adLaunchViewVC = [[AdLaunchScreenViewController alloc]initWithNibName:@"LaunchView" bundle:nil];
    _adLaunchView = adLaunchViewVC.view;
    _adLaunchView.frame = delegate.window.frame;
    [_adLaunchView setNeedsLayout];
    [delegate.window addSubview:_adLaunchView];
    //[self.view bringSubviewToFront:adLaunchView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.5 animations:^{
            _adLaunchView.alpha = 0;
        } completion:^(BOOL finished) {
            [_adLaunchView removeFromSuperview];
            
        }];
    });
    
}

-(void)overleapAction
{
    //[UIView setAnimationsEnabled:NO];
    [_adLaunchView.layer removeAllAnimations];
    _adLaunchView.alpha = 0;
    [_adLaunchView removeFromSuperview];
}

-(void)clickToAppstore
{
    //https://itunes.apple.com/us/app/id%@?ls=1&mt=8
    //itms-apps://itunes.apple.com/us/app/id%@?mt=8
    //
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://appstore.com/%@", kStoreAppId]];
    [[UIApplication sharedApplication] openURL:url];
}

-(void)otherInit
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged) name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEditChanged) name:UITextViewTextDidChangeNotification object:nil];
    NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten", nil];
    NSLog(@"before=%@",tempArray);
    /*数组remove中间一段元素,其余元素下标重新排列*/
    [tempArray removeObjectsInRange:NSMakeRange(0, 3)];
    NSLog(@"after=%@",tempArray);
    [tempArray addObject:@"add1"];
    
    NSLog(@"add1=%@    first=%@",tempArray,[tempArray objectAtIndex:1]);
    //    NSInteger index = [];
    
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    //    [dict setValue:nil forKey:@"qw"];
    //    [dict setValue:@"abc" forKey:nil];//key不能为空,否则崩溃
    //    NSString *nullStr = [dict objectForKey:nil];//key不可为空
    //    NSString *valueStr = [dict objectForKey:@"qw"];
    //    //断言错误,满足时会闪退
    //    NSAssert(valueStr != nil, @"nil");
}

/**
 *  @author Cherry, 2016-01-25 14:52:30
 *
 *  @brief 获取设备信息
 */
-(void)deviceInfo
{
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    //手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    NSLog(@"手机型号: %@",phoneModel );
    //地方型号  （国际化区域名称）
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    NSLog(@"国际化区域名称: %@",localPhoneModel );
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"当前应用名称：%@",appCurName);
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"当前应用软件版本:%@",appCurVersion);
    // 当前应用版本号码   int类型
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
}

/**
 *  @author Cherry, 2016-01-25 14:53:23
 *
 *  @brief 获取机型信息
 *
 *  @return 所属机型
 */
- (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    NSLog(@"NOTE: Unknown device type: %@", platform);
    return platform;
}

/**
 *  @author Cherry, 2016-01-13 10:41:07
 *
 *  @brief 通过storyboard连线push,调用此方法传参
 *
 *  @param segue  哪个storyboard
 *  @param sender 参数
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取push到的控制器
    UIViewController *firstVC = segue.destinationViewController;
    if ([firstVC respondsToSelector:@selector(setContent:)]) {
        //为push的那个控制器属性赋值   forKey:@"content"-其中key为属性名
        [firstVC setValue:self.inputTF.text forKey:@"content"];
    }
}

/**
 *  @author Cherry, 2016-01-13 10:46:20
 *
 *  @brief storyboard通过连线返回,区别从哪里返回
 *
 *  @param segue 当前storyboard
 */
- (IBAction)unwindToRootViewController:(UIStoryboardSegue *)segue {
    UIViewController *sourceVC = segue.destinationViewController;
    
    NSLog(@"unwindSegue %@     source VC  = %@", segue , [sourceVC class]);
}

-(void)textFieldChanged
{
    [self.inputTF setText:[self.inputTF.text disable_emoji:self.inputTF.text]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self checkCardNo:textField.text]) {
        self.inputTV.text= [self backbankenameWithBanknumber:textField.text];
    }else{
        self.inputTV.text = @"银行卡输入有误";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 四位加一个空格
    //if ([string isEqualToString:@""]) { // 删除字符
        //if ((textField.text.length - 2) % 5 == 0) {
            //textField.text = [textField.text substringToIndex:textField.text.length - 1];
        //}
        //return YES;
    //} else {
        //if (textField.text.length % 5 == 0) {
            //textField.text = [NSString stringWithFormat:@"%@ ", textField.text];
        //}
    //}
    //if (textField.text.length > 23) {
        //return NO;
    //}
    //return YES;
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    NSString *tempStr = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (tempStr.length > 19) {
        return NO;
    }
    
    [textField setText:newString];
    
    return NO;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self isContaintString:@"\n" forDestination:textView.text]) {
        textView.text = [textView.text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSLog(@"test string = %@",textView.text);
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text stringContainsEmoji:textView.text]) {
        
        NSRange textRange = [textView selectedRange];
        [textView setText:[textView.text disable_emoji:textView.text]];
        [textView setSelectedRange:textRange];
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *theText = textView.text;
    if (text.length == 0) {
        return YES;
    }
    // 先拼接字符串
    NSMutableString *mutalbleString = nil;
    if (theText.length > 0) {
        mutalbleString = [[NSMutableString alloc]initWithString:theText];
        if (range.location < theText.length) {
            [mutalbleString insertString:text atIndex:range.location];
        }else {
            [mutalbleString appendString:text];
        }
    }else {
        mutalbleString = [[NSMutableString alloc]initWithString:text];
    }
    
    if (mutalbleString.length > 100) {
        textView.text = [mutalbleString substringToIndex:100];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"字符个数不能大于100" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

/**
 *  @author Cherry, 2016-01-26 10:26:06
 *
 *  @brief 限制字数,选择备选框的字,而不是键盘输入
 */
- (void)textViewEditChanged{
    NSString *toBeString = self.inputTV.text;
    //NYLog(@"----%@",toBeString);
    UITextRange *selectedRange = [self.inputTV markedTextRange];
    //获取高亮部分
    UITextPosition *position = [self.inputTV positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
        if (toBeString.length > 100) {
            self.inputTV.text = [toBeString substringToIndex:100];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"字符个数不能大于100" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
