//
//  Data+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import Foundation

public extension Data {
    
    /// 移除第0开始的字节
    func removeZeroAtEnd() -> Data {
        if let index = self.firstIndex(of: 0) {
            if index == 0 {
                return Data()
            }else {
                return Data(self[0...index-1])
            }
        }
        return self
    }
    
    /// 对应的十六进制字符串，每个字节转为两个十六进制字符，字节间用空格隔开
    var hexString: String  {

        return hex.joined(separator: " ")
    }
    
    var rfid_hexString : String {
        return self.map({ String.init(format: "%02x", $0)}).joined(separator: "")
    }
    
    func read<T>(to type: T.Type, offset: Int = 0) -> T? {
        
        guard offset >= 0 else { return nil }
        let size = MemoryLayout<T>.stride
        if offset + size > count {
            return nil
        }
        let bytes = (self as NSData).bytes + offset
        let pointer = bytes.bindMemory(to: type, capacity: 1)
        return pointer.pointee
    }
    
    var hex: [String] {
        
        return self.map({String.init(format: "%02x", $0)})
    }
    
    // BOM:
    // 00 00 fe ff  utf32-BE
    // ff fe 00 00  utf32-LE
    // ef bb bf     utf8
    // fe ff        utf16-BE
    // ff fe        utf16-LE
    // without BOM  utf8
    var txt: String? {
        
        var content = self
        var encoding = String.Encoding.utf8
        if count >= 4 {
            switch (self[0], self[1], self[2], self[3]) {
            case (0x0, 0x0, 0xfe, 0xff):
                content.removeSubrange(0..<4)
                encoding = .utf32BigEndian
            case (0xff, 0xfe, 0x0, 0x0):
                content.removeSubrange(0..<4)
                encoding = .utf32LittleEndian
            case (0xef, 0xbb, 0xbf, _):
                content.removeSubrange(0..<3)
                encoding = .utf8
            case (0xfe, 0xff, _, _):
                content.removeSubrange(0..<2)
                encoding = .utf16BigEndian
            case (0xff, 0xfe, _, _):
                content.removeSubrange(0..<2)
                encoding = .utf16LittleEndian
            default:
                break
            }
        }else if count >= 2 {
            switch (self[0], self[1]) {
            case (0xef, 0xbb):
                if count >= 3 && self[2] == 0xbf {
                    content.removeSubrange(0..<3)
                }
            case (0xfe, 0xff):
                content.removeSubrange(0..<2)
                encoding = .utf16BigEndian
            case (0xff, 0xfe):
                content.removeSubrange(0..<2)
                encoding = .utf16LittleEndian
            default:
                break
            }
        }
        if let txt = String.init(data: content, encoding: encoding) {
            return txt
        }else {
            return nil
        }
    }
}
