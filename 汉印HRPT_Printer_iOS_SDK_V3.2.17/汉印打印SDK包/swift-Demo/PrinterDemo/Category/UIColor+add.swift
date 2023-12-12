//
//  UIColor+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIColor {
    
    static let theme = UIColor.color(hexString: "#ea5036")
    static let darkDividing = UIColor.color(hexString: "#E6E6E6")
    static let lightDividing = UIColor.color(hexString: "#F2F2F2")
    //不可点击颜色
    static let disableColor = UIColor.color(hexString: "#EBB9B0")
    //电量字体颜色
    static let electicColor = UIColor.color(hexString: "#B3B3B3")
    //标题及重要文字信息颜色
    static let titleColor = UIColor.color(hexString: "#1A1A1A")
    
    //文件名称颜色
    static let fileNameColor = UIColor.color(hexString: "#333333")
    
    //用于普通级段落、其他选项
    static let normalColor = UIColor.color(hexString: "#666666")
    //用于辅助、次要的文字信息
    static let minorColor = UIColor.color(hexString: "#999999")
    
    func image() -> UIImage {
        
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func image(_ width:CGFloat, _ height:CGFloat) -> UIImage {
        
        let rect = CGRect.init(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    static func color(hexString:String, alpha:CGFloat? = 1.0) -> UIColor {
        
        var cString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            
            let index = cString.index(after: cString.startIndex)
            cString = String.init(cString[index..<cString.endIndex])
        }
        
        if cString.count != 6 {
            return UIColor.white
        }
        
        let rRange = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString[..<rRange]
        
        let gRange1 = cString.index(cString.startIndex, offsetBy: 2)
        let gRange2 = cString.index(cString.startIndex, offsetBy: 4)
        let gString = cString[gRange1..<gRange2]
        
        let bRange = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString[bRange..<cString.endIndex]
        
        var r : CUnsignedInt = 0
        var g : CUnsignedInt = 0
        var b : CUnsignedInt = 0
        Scanner.init(string: String.init(rString)).scanHexInt32(&r)
        Scanner.init(string: String.init(gString)).scanHexInt32(&g)
        Scanner.init(string: String.init(bString)).scanHexInt32(&b)
        
        return UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha!)
    }
    
    /// 使用一个32位非负整数初始化颜色，格式为RGBA,如0x123456ff red: 0x12 green:0x34 blue:0x56 alpha 0xff
    ///
    /// - Parameters:
    ///   - number: 颜色对应的整数
    convenience init(number: UInt32) {
        
        let red = CGFloat(UInt8(number >> 24))/255.0
        let green = CGFloat(UInt8(number >> 16 & 0xff))/255.0
        let blue = CGFloat(UInt8(number >> 8 & 0xff))/255.0
        let alpha = CGFloat(UInt8(number & 0xff))/255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static var random: UIColor {
        
        let temp = arc4random() | 0x000000ff
        return UIColor.init(number: temp)
    }
}

extension UITextView {
    // MARK: - 在键盘上添加完成按钮
    func addBackView() {
        let toolView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40))
        toolView.backgroundColor = .white
        let finishBtn = UIButton(frame: CGRect(x: kScreenWidth - 60, y: 5, width: 50, height: 30))
        finishBtn.setTitleColor(UIColor.theme, for: .normal)
        finishBtn.setTitle("完成", for: UIControl.State.normal)
        finishBtn.addTarget(self, action: #selector(self.resignFirstResponder), for: UIControl.Event.touchUpInside)
        toolView.addSubview(finishBtn)
        self.inputAccessoryView = toolView
    }
    
}


