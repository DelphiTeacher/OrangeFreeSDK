//
//  PTBitmapManager.h
//  PrinterSDK
//
//  Created by ios on 2021/12/9.
//  Copyright © 2021 Mellow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PTBitmapCompressMode) {
    /*! *\~chinese 不压缩 *\~english None */
    PTBitmapCompressModeNone = 0,
    /*! *\~chinese LZO压缩算法 *\~english LZO compress */
    PTBitmapCompressModeLZO = 48
};

typedef NS_ENUM(NSInteger, PTBitmapMode) {
    /*! *\~chinese 黑白二值图像 *\~english Binary */
    PTBitmapModeBinary = 0,
    /*! *\~chinese 扩散抖动 *\~english Diffusion dithering algorithm */
    PTBitmapModeDithering = 1,
    /*! *\~chinese 聚集抖动算法 *\~english Aggregate dithering algorithm */
    PTBitmapModeCluster = 2
};

@interface PTBitmapManager : NSObject

/// 生成二值抖动图片数据
/// @param image 图片
/// @param mode 图片效果，这边如果选择灰阶模式，那么则默认SDK处理图片
/// @param compress 压缩模式
/// @param package 是否需要分包
/// @param reverse 数据是否要反转，eg:TSPL的图片需要反转
+ (NSData *)generateGenralDataWithImage:(UIImage *)image mode:(PTBitmapMode)mode compress:(PTBitmapCompressMode)compress package:(BOOL)package reverse:(BOOL)reverse;

/// 预览图
/// @param image 原图图片
/// @param mode 预览的图片模式
+ (UIImage *)generateRenderingWithImage:(UIImage *)image mode:(PTBitmapMode)mode;


/// 生成位图数据(该数据需要指令类的对应接口再处理，不可直接下发)
/// @param image 图片
/// @param mode 图片效果
+ (NSData *)generateBitmapDataWithImage:(UIImage *)image mode:(PTBitmapMode)mode;

/// 锐化后的图片
/// @param image 原图图片
+ (UIImage *)imageToSharpen:(UIImage *)image;


/// 生成透明图片
/// @param image 原图图片
+ (UIImage *)imageToTransparent:(UIImage *)image;


/// 自定义阈值的黑白图数据
+ (NSData *)printableBinaryData:(UIImage *)image threshold:(Byte)threshold compress:(PTBitmapCompressMode)compress reverse:(BOOL)reverse;


/// 去掉四周白色区域图片数据
+ (CGRect)contentInImage:(UIImage *)image;

/// 裁剪图片
+ (UIImage *)cropImage:(UIImage *)image pixelRect:(CGRect)pixelRect;


@end

NS_ASSUME_NONNULL_END
