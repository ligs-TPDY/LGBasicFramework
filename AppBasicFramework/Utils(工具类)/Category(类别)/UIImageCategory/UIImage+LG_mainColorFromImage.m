//
//  UIImage+LG_mainColorFromImage.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/7.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UIImage+LG_mainColorFromImage.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"
#import "Palette.h"
@implementation UIImage (LG_mainColorFromImage)
+ (void)mainColorFromImage:(NSString *)imageUrl View:(UIView *)view
{
    GLogVerbose(@"%@",imageUrl);
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString* key = [manager cacheKeyForURL:[NSURL URLWithString:imageUrl]];
    SDImageCache* cache = [SDImageCache sharedImageCache];
    UIImage *image = [cache imageFromDiskCacheForKey:key];
    
    Palette *palette = [[Palette alloc]initWithImage:image];
    [palette startToAnalyzeImage:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        
    }];
    [image getPaletteImageColor:^(PaletteColorModel *recommendColor, NSDictionary *allModeColorDic, NSError *error) {
        NSString *str = recommendColor.imageColorString;
        GLogVerbose(@"%@",str);
        view.backgroundColor = [UIColor colorWithHexString:str];
    }];
}

@end
