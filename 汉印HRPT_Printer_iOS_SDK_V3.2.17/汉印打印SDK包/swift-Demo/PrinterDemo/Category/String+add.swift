//
//  String+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import Foundation
import UIKit
import CommonCrypto

public enum AKError: Error {
    case hexStringToDataOverflowoutCharacter
    case irregularHexString
}

public extension String {
    
    /// 获取字符串绘制高度
    ///
    /// - Parameters:
    ///   - width: 绘制区域宽度
    ///   - font: 绘制字体
    /// - Returns: 绘制的高度
    func drawHeight(with width: CGFloat, font: UIFont) -> CGFloat {
        
        let size = CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude)
        let rect = (self as NSString).boundingRect(with: size, options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil)
        return ceil(rect.height) + 1
    }
    
    /// 获取字符串单行绘制宽度
    ///
    /// - Parameter font: 字体
    /// - Returns: 返回宽度
    func drawWidth(with font: UIFont) -> CGFloat {
        
        let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: font.lineHeight)
        let rect = (self as NSString).boundingRect(with: size, options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil)
        return ceil(rect.width) + 1
    }
    
    /// 16进制字符串转data
    func hexadecimal() -> Data? {
        
        var data = Data(capacity: String.init().count / 2)
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        guard data.count > 0 else { return nil }
        return data
    }
    
    /// 将十六进制字符串转为数据流,必须为 12 34 ef ab 这种格式，每组为两个十六进制字符，中间用空格隔开
    ///
    /// - Returns: 数据流
    /// - Throws: 字符串存在非十六进制字符错误
    func hexStringToData() throws -> Data {
        
        var data = Data()
        var temp = self.replacingOccurrences(of: "\n", with: "")
        temp = temp.replacingOccurrences(of: "\r", with: "")
        temp = temp.replacingOccurrences(of: " ", with: "")
        for i in 0..<temp.count/2 {
            let sub = (temp as NSString).substring(with: NSRange.init(location: 2*i, length: 2))
            if let result = UInt8(sub,radix: 16) {
                data.append(result)
            }else {
                throw AKError.hexStringToDataOverflowoutCharacter
            }
        }
        return data
    }
    
    /// 16进制字符串转data
    func hexadecimalStringToData() -> Data? {
        
        if self.isEmpty {
            return nil
        }
        var temp = self.replacingOccurrences(of: "\n", with: "")
        temp = temp.replacingOccurrences(of: "\r", with: "")
        temp = temp.replacingOccurrences(of: " ", with: "")
        var data = Data()
        for i in 0..<temp.count/2 {
            let sub = (temp as NSString).substring(with: NSRange(location: 2*i, length: 2))
            if let result = UInt8.init(sub, radix: 16) {
                data.append(result)
            }
        }
        return data
    }
    
    func filterCharacters() -> String {

        var result = ""
        for cha in self {
            let predicateStr: String = "^[A-Za-z0-9-:.]{1}$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", predicateStr)
            if predicate.evaluate(with: String(cha)) {
                result.append(cha)
            }
        }
        return result
    }
}

public extension String {
    
    //是否是规则的十六进制字符串，"12 54 ef"格式
    var isRegularHexString: Bool {
        
        let regularString = "^[ \\n\\r]*([0-9a-fA-F]{2}[ \\n\\r]+)*([0-9a-fA-F]{2})*$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", regularString)
        return predicate.evaluate(with: self)
    }
    
    var isPhoneNo: Bool {
        
        let pattern = "^((13[0-9])|(14[579])|(15[0-3,5-9])|166|(17[0-1,3,5-9])|(18[0-9])|(19[89]))\\d{8}$"
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
    
    var isIp: Bool {
        let numPre = "(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)"
        let rex = String.init(format: "^(%@.){3}%@$", numPre, numPre)
        let predicate = NSPredicate.init(format: "SELF MATCHES %@", rex)
        return predicate.evaluate(with: self)
    }
}

public extension String {
    
    var md5: String {
        
        return encryptionString(type: .md5)
    }
    
    var sha1: String {
        
        return encryptionString(type: .sha1)
    }
    
    private enum Encryption {
        case md5, sha1
    }
    
    private func encryptionString(type: Encryption) -> String {
        
        var length: Int
        switch type {
        case .md5:
            length = Int(CC_MD5_DIGEST_LENGTH)
        case .sha1:
            length = Int(CC_SHA1_DIGEST_LENGTH)
        }
        let digest = UnsafeMutablePointer<UInt8>.allocate(capacity: length)
        let data = self.data(using: String.Encoding.utf8)!
        switch type {
        case .md5:
            _ = CC_MD5((data as NSData).bytes, CC_LONG.init(data.count), digest)
        case .sha1:
            _ = CC_SHA1((data as NSData).bytes, CC_LONG.init(data.count), digest)
        }
        let digestData = Data.init(bytes: digest, count: length)
        return digestData.hex.joined()
    }
}

public extension String {
    
    subscript(i: ClosedRange<Int>) -> Substring {
        
        let start = self.index(self.startIndex, offsetBy: i.lowerBound)
        let end = self.index(self.startIndex, offsetBy: i.upperBound)
        return self[start...end]
    }
}

//语言国际化
public extension String {
    
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
    
}
