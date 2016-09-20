//
//  CheckViewController.m
//  DrivingAssistant
//
//  Created by 赵萌智 on 16/3/17.
//  Copyright © 2016年 杨小珑. All rights reserved.
//

#import "CheckViewController.h"
#import "Header.h"
#import "MyCell.h"



@interface CheckViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *weekArr;
    MBProgressHUD *mb;
    NSMutableArray *headerArr;
    // 总数据
    NSMutableDictionary *mdic;
    //
    NSMutableDictionary *mmdic;
    //金额
    NSMutableDictionary *dddic;
    // 年份 头部滚动的情况
    NSMutableArray *yearArr;
    
    UILabel *labelYearLB;
    
    NSArray *array2;
    
    UILabel *_tishiLabel;
    
    NSString *  locationString;
}

@property(nonatomic,strong)UICollectionView *collection;

@end

@implementation CheckViewController

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
  
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
    [self.navigationController.navigationBar setTranslucent:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"保费账单";
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    [self.navigationController.navigationBar setTranslucent:NO];

    
    
    weekArr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    mdic = [[NSMutableDictionary alloc]init];
    mmdic = [[NSMutableDictionary alloc]init];
 
    [self loadviews];
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    locationString =[dateformatter stringFromDate:senddate];

    mb = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.labelText = @"加载中...";
    
    [self getData];
   
}

-(void)loadviews
{
    // 周日期
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    view.backgroundColor = RGBA_Color(57, 201, 214, 1);
    [self.view addSubview:view];
    for (int i=0; i<7; i++) {
        UILabel *la  = [[UILabel alloc]initWithFrame:CGRectMake(WidthScale(12)+(i*WidthScale(55)), 5, 20, 20)];
        la.text = weekArr[i];
        la.textColor = [UIColor whiteColor];
        la.font = [UIFont systemFontOfSize:18];
        [view addSubview:la];
    }
    
  
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(ScreenWidth/7, 44);
    flow.minimumInteritemSpacing = 0.0;
    flow.minimumLineSpacing      = 0.0;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    flow.headerReferenceSize = CGSizeMake(ScreenWidth, 40);
    
    
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight-WidthScale(100)) collectionViewLayout:flow];
    _collection.delegate = self;
    _collection.dataSource = self;
    
    [_collection registerClass:[MyCell class] forCellWithReuseIdentifier:@"cellid"];
    
    [_collection registerClass:[Header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    _collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collection];

    labelYearLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, ScreenWidth, 20)];
    labelYearLB.textAlignment = NSTextAlignmentCenter;
    //labelYearLB.text = @"2016-03";
    labelYearLB.textColor = RGBA_Color(0, 0, 0, 1);
    labelYearLB.backgroundColor = [UIColor whiteColor];
    labelYearLB.alpha = 0.5;
    labelYearLB.hidden = YES;
    [self.view addSubview:labelYearLB];
    
}
-(void)getData
{
    
 
    NSMutableString *mstr = [[NSMutableString alloc]init];
    NSInteger countDay=1;
    
    [_tishiLabel removeFromSuperview];
   
//当前时间
    NSString *string = @"2016-01-01";
    if (string.length>10) {
    string  = [string substringToIndex:10];
        
        NSArray *arrr = [string componentsSeparatedByString:@"-"];
        
        for (NSString *aaa in arrr) {
            [mstr appendString:aaa];
        }
        
    }
    
    if (mstr.length>0) {
        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"YYYYMMdd"];
    
    NSDate *destDate= [dateFormatter dateFromString:mstr];
    
    NSDate *nowDate = [dateFormatter dateFromString:locationString];
    
    countDay += [modex getDaysFrom:destDate To:nowDate];
 
    }
    
    [mb hide:YES afterDelay:0.5];
       
    
                [mmdic setObject:@"0" forKey:@"20160106"];
                [mmdic setObject:@"12" forKey:@"20160111"];
                [mmdic setObject:@"12" forKey:@"20160122"];
                [mmdic setObject:@"12" forKey:@"20160113"];
                [mmdic setObject:@"12" forKey:@"20160114"];
                [mmdic setObject:@"13" forKey:@"20160118"];
                [mmdic setObject:@"14" forKey:@"20160104"];
                [mmdic setObject:@"15" forKey:@"20160124"];
                [mmdic setObject:@"12" forKey:@"20160101"];
                [mmdic setObject:@"12" forKey:@"20160102"];
                [mmdic setObject:@"12" forKey:@"20160103"];
                [mmdic setObject:@"12" forKey:@"20160104"];
                [mmdic setObject:@"13" forKey:@"20160108"];
                [mmdic setObject:@"14" forKey:@"20160124"];
                [mmdic setObject:@"15" forKey:@"20160123"];
                [mmdic setObject:@"12" forKey:@"20160211"];
                [mmdic setObject:@"12" forKey:@"20160222"];
                [mmdic setObject:@"12" forKey:@"20160213"];
                [mmdic setObject:@"12" forKey:@"20160214"];
                [mmdic setObject:@"13" forKey:@"20160218"];
                [mmdic setObject:@"14" forKey:@"20160204"];
                [mmdic setObject:@"15" forKey:@"20160224"];
                [mmdic setObject:@"12" forKey:@"20160311"];
                [mmdic setObject:@"12" forKey:@"20160322"];
                [mmdic setObject:@"12" forKey:@"20160313"];
                [mmdic setObject:@"12" forKey:@"20160314"];
                [mmdic setObject:@"13" forKey:@"20160318"];
                [mmdic setObject:@"14" forKey:@"20160304"];
                [mmdic setObject:@"15" forKey:@"20160324"];
             
    



    
                // 月-（天-金额）
                NSMutableSet *monerySet = [[NSMutableSet alloc]init];
                for (NSString *monery in mmdic) {
                    [monerySet addObject: [monery substringWithRange:NSMakeRange(0, 6)]];
                }
                
                NSMutableArray *monarr = [[NSMutableArray alloc]init];
                dddic = [[NSMutableDictionary alloc]init];
                if ([monerySet count]>1) {
                    NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:NO]];
                    
                    NSArray *sortSetArray = [monerySet sortedArrayUsingDescriptors:sortDesc];
                    [monarr addObjectsFromArray:sortSetArray];
                    
                }else{
                    [monarr addObject:[monerySet anyObject]];
                }
                

                
                for (NSString *mkey in monarr) {
                    
                    
                  
                    NSMutableDictionary *dddddic = [[NSMutableDictionary alloc]init];
                    for (NSString *mmkye in [mmdic allKeys]) {
                        
                       NSString *substr = [mmkye substringWithRange:NSMakeRange(0, 6)];
                        if ([mkey isEqualToString:substr]) {
                            
                            [dddddic setObject:[mmdic objectForKey:mmkye] forKey:mmkye];
                           
                        }

                    }
                    [dddic setObject:dddddic forKey:mkey];
                    
                }
                

                // 月---天
                NSMutableSet *dateSet = [[NSMutableSet alloc]init];

    
                [dateSet addObject:@"201601"];
                [dateSet addObject:@"201602"];
                [dateSet addObject:@"201603"];
    
                if ([dateSet count]>1) {
                    
                    // 将集合排序
                NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:NO]];
                    
                NSArray *sortSetArray = [dateSet sortedArrayUsingDescriptors:sortDesc];
                    
                headerArr = [[NSMutableArray alloc]initWithArray:sortSetArray];
                
                    
                }else{
                    headerArr = [[NSMutableArray alloc]init];
                    [headerArr addObject:[dateSet anyObject]];
                    
                }
                

                for (NSString *head in headerArr) {
    
                   NSMutableArray *dayArr = [[NSMutableArray alloc]init];
                    NSMutableString *heads = [[NSMutableString alloc]initWithString:head];
                    
                    [heads insertString:@"-" atIndex:4];
                    
                    NSInteger nn = [modex totaldaysInThisMonth:[modex dateFromString:heads]];

                    NSInteger nnn = [modex firstWeekdayInThisMonth:[modex dateFromString:heads]];
                    switch (nnn) {
                        case 1:
                            [dayArr addObject:@""];
                            break;
                        case 2:
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            break;
                        case 3:
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            break;
                        case 4:
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            break;
                        case 5:
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            break;
                        case 6:
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            [dayArr addObject:@""];
                            break;
                        default:
                            break;
                    }

                    
                    for (int i=1; i<=nn; i++) {
                        
                        [dayArr addObject:[NSString stringWithFormat:@"%d",i]];
                    }
                    
                    [mdic setObject:dayArr forKey:heads];
                   
                   
                }


            
            
            
            NSArray *arr11 = [mdic allKeys];
            NSMutableArray *arr1 = [[NSMutableArray alloc]init];
            for (NSString *ss in arr11) {
                
                NSMutableString *mss = [[NSMutableString alloc]initWithString:ss];
                
                [mss deleteCharactersInRange:NSMakeRange(4, 1)];
                
                [arr1 addObject:mss];
                
            }
            
            
            NSComparator cmptr = ^(id obj1, id obj2){
                if ([obj1 floatValue] < [obj2 floatValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                if ([obj1 floatValue] > [obj2 floatValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            };
            array2 = [arr1 sortedArrayUsingComparator:cmptr];
            [_collection reloadData];
            
    
            
            
            
            
            


}




#pragma mark-UICollection
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    Header *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    NSArray *arr = [mdic allKeys];
    NSMutableArray *arr1 = [[NSMutableArray alloc]init];
    for (NSString *ss in arr) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:ss];
        
        [mss deleteCharactersInRange:NSMakeRange(4, 1)];
        
        [arr1 addObject:mss];
        
    }
    
    
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    NSArray *array = [arr1 sortedArrayUsingComparator:cmptr];
    
    

    NSString *key = [array objectAtIndex:indexPath.section];

    NSMutableString *mkey = [[NSMutableString alloc]initWithString:key];
    [mkey deleteCharactersInRange:NSMakeRange(0, 5)];
    


    switch ([mkey intValue]) {
        case  1:
             view.label.text = @"一月";
            break;
        case  2:
            view.label.text = @"二月";
            break;
        case  3:
            view.label.text = @"三月";
            break;
        case  4:
            view.label.text = @"四月";
            break;
        case  5:
            view.label.text = @"五月";
            break;
        case  6:
            view.label.text = @"六月";
            break;
        case  7:
            view.label.text = @"七月";
            break;
        case  8:
            view.label.text = @"八月";
            break;
        case  9:
            view.label.text = @"九月";
            break;
        case  10:
            view.label.text = @"十月";
            break;
        case  11:
            view.label.text = @"十一月";
            break;
        default:
            view.label.text = @"十二月";
            break;
    }

    NSMutableString *mkey1 = [[NSMutableString alloc]initWithString:key];
    //[mkey1 deleteCharactersInRange:NSMakeRange(4, 1)];
    float countt=0.0;
    for (NSString *monkey in dddic) {
        
        if ([monkey isEqualToString:mkey1]) {
            
            for (NSString *sss in [[dddic objectForKey:monkey] allKeys]) {
                
               countt+= [[[dddic objectForKey:monkey] objectForKey:sss] floatValue];
            }
        }
        
            view.countString.text = [NSString stringWithFormat:@"%.2lf 元",countt];
        view.countString.textAlignment = NSTextAlignmentRight;
    }
    
    
 
   
    return view;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [mdic count];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr = [mdic allKeys];
    
    
    
    NSMutableArray *arr1 = [[NSMutableArray alloc]init];
    for (NSString *ss in arr) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:ss];
        
        [mss deleteCharactersInRange:NSMakeRange(4, 1)];
        
        [arr1 addObject:mss];
        
    }
    
    
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    NSArray *array = [arr1 sortedArrayUsingComparator:cmptr];
    
    
    
    NSMutableArray *marray = [[NSMutableArray alloc]init];
    
    for (NSString *sss in array) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:sss];
        
        [mss insertString:@"-" atIndex:4];
        
        [marray addObject:mss];
        
    }
    return [[mdic objectForKey:[marray objectAtIndex:section]] count];
    
    //return [[mdic objectForKey:[[mdic allKeys]objectAtIndex:section]] count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    
    
    NSArray *arr = [mdic allKeys];
    

    
    NSMutableArray *arr1 = [[NSMutableArray alloc]init];
    for (NSString *ss in arr) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:ss];
        
        [mss deleteCharactersInRange:NSMakeRange(4, 1)];
        
        [arr1 addObject:mss];
        
    }
    
   
    
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };

    NSArray *array = [arr1 sortedArrayUsingComparator:cmptr];
    
    
    
    NSMutableArray *marray = [[NSMutableArray alloc]init];
    
    for (NSString *sss in array) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:sss];
        
        [mss insertString:@"-" atIndex:4];
        
        [marray addObject:mss];

    }

    cell.label.text = [[mdic objectForKey:[marray objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];

   // cell.label.backgroundColor = [UIColor orangeColor];
    
    // 几号
    NSString *dayString = [[mdic objectForKey:[marray objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    
    NSMutableString *m = [[NSMutableString alloc]initWithString:dayString];
    if (dayString.length==1) {
        [m insertString:@"0" atIndex:0];
    }
    

    

    for (NSString *mokey in [dddic allKeys]) {
        NSMutableString *mmmokey = [[NSMutableString alloc]initWithString:mokey];
        
        
        NSString *key = [marray objectAtIndex:indexPath.section];
        NSMutableString *mkey = [[NSMutableString alloc]initWithString:key];
        [mkey deleteCharactersInRange:NSMakeRange(4, 1)];
        
        if ([mkey isEqualToString:mmmokey]) {
            [mmmokey appendString:m];
            cell.label1.adjustsFontSizeToFitWidth = YES;
            
             cell.label1.text =  [[dddic objectForKey:mokey] objectForKey:mmmokey];
           
           // cell.label1.backgroundColor = [UIColor yellowColor];
            if (cell.label1.text.length<1) {
                cell.label.textColor = RGBA_Color(195, 195, 195, 1);
            }else{
                cell.label.textColor = RGBA_Color(116, 116, 116, 1);
                 cell.label1.text =  [NSString stringWithFormat:@"%ld",[[[dddic objectForKey:mokey] objectForKey:mmmokey] integerValue]];
            }
            
            if ([locationString isEqualToString:mmmokey]) {
             
                cell.TodayImage.alpha = 1;
            }else{
                cell.TodayImage.alpha = 0;
            }
           
           
        }
        
    }
    

  
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    NSArray *arr = [mdic allKeys];
    
    
    
    NSMutableArray *arr1 = [[NSMutableArray alloc]init];
    for (NSString *ss in arr) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:ss];
        
        [mss deleteCharactersInRange:NSMakeRange(4, 1)];
        
        [arr1 addObject:mss];
        
    }
    
    
    
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    
    NSArray *array = [arr1 sortedArrayUsingComparator:cmptr];
    
    
    
    NSMutableArray *marray = [[NSMutableArray alloc]init];
    
    for (NSString *sss in array) {
        
        NSMutableString *mss = [[NSMutableString alloc]initWithString:sss];
        
        [mss insertString:@"-" atIndex:4];
        
        [marray addObject:mss];
        
    }
    

    
    // 几号
    NSString *dayString = [[mdic objectForKey:[marray objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    
    NSMutableString *m = [[NSMutableString alloc]initWithString:dayString];
    if (dayString.length==1) {
        [m insertString:@"0" atIndex:0];
    }
    
    
    
    
    for (NSString *mokey in [dddic allKeys]) {
        NSMutableString *mmmokey = [[NSMutableString alloc]initWithString:mokey];
        
        
        NSString *key = [marray objectAtIndex:indexPath.section];
        NSMutableString *mkey = [[NSMutableString alloc]initWithString:key];
        [mkey deleteCharactersInRange:NSMakeRange(4, 1)];
        
        if ([mkey isEqualToString:mmmokey]) {
            [mmmokey appendString:m];
           
            NSLog(@"%@======%@",mokey,mmmokey);
        NSString *mmmmm =  [[dddic objectForKey:mokey] objectForKey:mmmokey];
            
            if ([mmmmm length]>0) {
                
                NSLog(@"今天的保费是:%@",mmmmm);
                
            }else{
                NSLog(@"no");
            }

            
        }
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//滑动过程中
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    UICollectionView *ta = (UICollectionView *)scrollView;
    
    CGFloat scrValue = ta.bounds.origin.y;
    
    NSInteger md = scrValue/240;
    
    
    if (scrValue>=1) {
        labelYearLB.text = [array2 objectAtIndex:md];
       // NSLog(@"1");
        labelYearLB.hidden = NO;
    }else{
       // NSLog(@"2");
        labelYearLB.hidden = YES;
    }
    
}





@end
