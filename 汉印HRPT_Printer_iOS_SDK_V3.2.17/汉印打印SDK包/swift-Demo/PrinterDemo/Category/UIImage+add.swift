//
//  UIImage+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
    var pixelWidth: CGFloat {
        
        return self.size.width*self.scale
    }
    
    var pixelHeight: CGFloat {
        
        return self.size.height*self.scale
    }
    
    var hasAlpha: Bool {
        
        if let cgImage = cgImage {
            
            switch cgImage.alphaInfo {
            case .none, .noneSkipLast, .noneSkipFirst:
                return false
            default:
                return true
            }
        }else {
            return true
        }
    }
}

public extension UIImage {
    
    /// 图片剪切
    ///
    /// - Parameter pixelRect: 截切位置大小
    /// - Returns: 剪切结果
    func crop(pixelRect: CGRect) -> UIImage {
        
        let drawRect = CGRect.init(x: -pixelRect.origin.x, y: -pixelRect.origin.y, width: pixelWidth, height: pixelHeight)
        //MARK: UIGraphicsBeginImageContextWithOptions size为非整数时，画布大小会向上取整
        UIGraphicsBeginImageContextWithOptions(pixelRect.size, true, 1)
        // 当rect.size为非整数时，绘制区域会向下取整
        self.draw(in: drawRect)
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    /// 将图片剪切至某个宽高比，取出中间部分
    ///
    /// - Parameter aspectRatio: 宽高比
    /// - Returns: 剪切结果
    func crop(aspectRatio: CGFloat) -> UIImage {
        
        let imageAspectRatio = pixelWidth/pixelHeight
        if imageAspectRatio == aspectRatio {
            return self
        }
        var contentRect = CGRect.zero
        if imageAspectRatio > aspectRatio {
            contentRect.size.height = pixelHeight
            contentRect.size.width = pixelHeight*aspectRatio
        }else {
            contentRect.size.width = pixelWidth
            contentRect.size.height = pixelWidth/aspectRatio
        }
        contentRect.origin.x = (pixelWidth - contentRect.width)/2
        contentRect.origin.y = (pixelHeight - contentRect.height)/2
        return crop(pixelRect: contentRect)
    }
    
    /// 修改图片大小
    ///
    /// - Parameter size: 修改的大小
    /// - Returns: 修改后图片
    func resize(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    /// 将图片旋转90度
    ///
    /// - Parameter clockwise: 是否顺时针旋转
    /// - Returns: 旋转后图片
    func rotate90(clockwise: Bool) -> UIImage {
        
        let size = CGSize.init(width: pixelHeight, height: pixelWidth)
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        let ctx = UIGraphicsGetCurrentContext()!
        if clockwise {
            ctx.translateBy(x: size.width, y: 0)
            ctx.rotate(by: CGFloat.pi/2)
        }else {
            ctx.translateBy(x: 0, y: size.height)
            ctx.rotate(by: -CGFloat.pi/2)
        }
        draw(in: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: pixelWidth, height: pixelHeight)))
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    /// 将图片填充到某个宽高比的单色背景图片，居中填充，填充时保留原图片的宽高比
    ///
    /// - Parameters:
    ///   - aspectRatio: 结果图片宽高比
    ///   - color: 背景颜色，默认白色
    /// - Returns: 填充后的图片
    func fillIn(aspectRatio: CGFloat, background color: UIColor = UIColor.white) -> UIImage {
        
        if pixelWidth/pixelHeight == aspectRatio {
            return self
        }
        var size = CGSize.zero
        if pixelWidth/pixelHeight > aspectRatio {
            size.width = pixelWidth
            size.height = pixelWidth/aspectRatio
        }else {
            size.height = pixelHeight
            size.width = pixelHeight*aspectRatio
        }
        let insetX = (size.width - pixelWidth)/2
        let insetY = (size.height - pixelHeight)/2
        var drawRect = CGRect.init(origin: CGPoint.zero, size: size)
        drawRect = drawRect.insetBy(dx: insetX, dy: insetY)
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        color.setFill()
        UIRectFill(CGRect.init(origin: CGPoint.zero, size: size))
        draw(in: drawRect)
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    /// 将原图分别绘制到指定区域
    ///
    /// - Parameters:
    ///   - size: 结果图片大小
    ///   - rects: 绘制区域数组
    ///   - color: 背景色
    ///   - extraDrawClosure: 额外的绘制closure
    /// - Returns: 绘制结果
    func drawIn(
        destination size: CGSize,
        rects:[CGRect],
        background color: UIColor = UIColor.white,
        extraDrawClosure: ((_: CGContext) -> Void)? = nil)
        -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.setFill()
        UIRectFill(CGRect.init(origin: CGPoint.zero, size: size))
        for rect in rects {
            draw(in: rect)
        }
        let ctx = UIGraphicsGetCurrentContext()!
        extraDrawClosure?(ctx)
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
}
