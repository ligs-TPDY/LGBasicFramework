//
//  QrCodeGenerated.m
//  HuaRJProject
//
//  Created by apple on 17/4/26.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "QrCodeGenerated.h"

@implementation QrCodeGenerated

+ (UIImage *)QrCodeGeneratedWithURL:(NSString *)url
{
    // 1.实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复滤镜的默认属性 (因为滤镜有可能保存上一次的属性)
    [filter setDefaults];
    
    // 3.将字符串转换成NSdata
    NSData *data  = [url dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4.通过KVO设置滤镜, 传入data, 将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5.生成二维码
    CIImage *outputImage = [filter outputImage];
    
    UIImage *image = [QrCodeGenerated createNonInterpolatedUIImageFormCIImage:outputImage withSize:500.0];
    
    return image;
}
/**
 * 根据CIImage生成指定大小的UIImage
 *
 * @param image CIImage
 * @param size 图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
@end
