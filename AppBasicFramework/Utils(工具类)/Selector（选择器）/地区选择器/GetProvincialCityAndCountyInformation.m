//
//  GetProvincialCityAndCountyInformation.m
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "GetProvincialCityAndCountyInformation.h"
#import "ClickAreaModel.h"
#import "ClickAreaModelForCity.h"
#import "ClickAreaModelForCounties.h"
@interface GetProvincialCityAndCountyInformation ()

@property (nonatomic,strong) NSMutableArray *mutArrForProvincial;
@property (nonatomic,strong) NSMutableArray *mutArrForCountiesTow;
@property (nonatomic,strong) NSMutableArray *mutArrForCitiesTow;
@property (nonatomic,strong) NSMutableArray *mutArrForAll;

@end

@implementation GetProvincialCityAndCountyInformation


#pragma mark - --读取本地的Plist文件，获取全国省市县的信息--
//省市县三级信息联动的数据模型和结构建设，属于比较典型，且容易出错的结构，以后需回顾，并总结
-(NSMutableArray *)requestProvincialCitiesAndCounties
{
    
    self.mutArrForAll = [[NSMutableArray alloc]init];
    self.mutArrForCitiesTow = [[NSMutableArray alloc]init];
    self.mutArrForCountiesTow = [[NSMutableArray alloc]init];
    self.mutArrForProvincial = [[NSMutableArray alloc]init];
    
    
    //读取本地的文件获得字典
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"districtMGE" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    //解析数据
    NSArray *arrayForProvince = dictionary[@"Division"];
    for (NSInteger i=0; i<arrayForProvince.count; i++)
    {
        NSDictionary *dictionaryForProvince = arrayForProvince[i];
        //取出一个省的名字
        ClickAreaModel *modelForProvince = [ClickAreaModel clickAreaModel:dictionaryForProvince];
        //将存储该省名字的模型存放在数组中（当循环完成时，该数组中存放了中国所有省的名字）（根据下标，获取对应的省）
        [self.mutArrForProvincial addObject: modelForProvince];
        
        NSArray *arrayForCity = dictionaryForProvince[@"DivisionSub"];
        //存储一个省中所有的市的名字
        NSArray *array1 = @[];
        NSMutableArray *mutArrForCitiesOne = [[NSMutableArray alloc]initWithArray:array1];
        
        NSArray *array2 = @[];
        NSMutableArray *mutArrFor = [[NSMutableArray alloc]initWithArray:array2];
        for (NSInteger j=0; j<arrayForCity.count; j++)
        {
            NSDictionary *dicForCity = arrayForCity[j];
            //取出一个省中一个市的名字
            ClickAreaModelForCity *modelForCity = [ClickAreaModelForCity clickAreaModelForCity:dicForCity];
            //将存储该市名字的模型存储到字典中（当循环完成时，该数组中存放了一个省对应的所有市的名字）
            [mutArrForCitiesOne addObject:modelForCity];
            
            
            
            NSArray *arrayForCounty = dicForCity[@"DivisionSub"];
            //存储一个市中所有的县的名字
            NSArray *array3 = @[];
            NSMutableArray *mutArrForCountiesOne = [[NSMutableArray alloc]initWithArray:array3];
            
            for (NSInteger m=0; m<arrayForCounty.count; m++)
            {
                NSDictionary *dicForCounty = arrayForCounty[m];
                //取出一个市中一个县的名字
                ClickAreaModelForCounties *modelForCounty = [ClickAreaModelForCounties clickAreaModelForCounties:dicForCounty];
                //（循环完成时，存储了该市所有的县的名字）
                [mutArrForCountiesOne addObject:modelForCounty];
            }
            //（循环完成后，存储一个省中所有市对应的县）
            [mutArrFor addObject:mutArrForCountiesOne];
        }
        //存储所有省中所有市对应的县（取数据时，先由省的坐标获得对应的省，再由省中市额下标获得对应的市，最后获得该市的所有县）
        [self.mutArrForCountiesTow addObject:mutArrFor];
        
        
        
        //循环完成后，按顺序存储了每个省中市的名字（取数据时，首先由省的下标获得对应的省，然后获得该省对应的市）
        [self.mutArrForCitiesTow addObject:mutArrForCitiesOne];
        
    }
    
    [self.mutArrForAll addObject:self.mutArrForProvincial];
    
    [self.mutArrForAll addObject:self.mutArrForCitiesTow];
    
    [self.mutArrForAll addObject:self.mutArrForCountiesTow];
    
    return self.mutArrForAll;
}



@end
