//
//  PDTSPLTestFunctions.swift
//  PrinterDemo
//
//  Created by ios on 2019/10/29.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDTSPLTestFunctions: NSObject {

    @objc class func printSelfTestPage() {
        
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
        cmd.selfTest()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        
    }
    
    @objc class func printVectorText() {
        var fontArray = [String]()
        for i in 1...9 {
            fontArray.append("字体类型:\(i)")
        }
        let pickerView = PDPickerView.init(with: fontArray)
        PDAppWindow.addSubview(pickerView)
        pickerView.selectItemClosure = {(item) in
            var font = PTTSCTextVectorFontStyle.style9
            var x_multiplication = 1
            var y_multiplication = 1
            switch item {
                case "字体类型:1":
                    font = PTTSCTextVectorFontStyle.style1
                case "字体类型:2":
                    font = PTTSCTextVectorFontStyle.style2
                case "字体类型:3":
                    font = PTTSCTextVectorFontStyle.style3
                case "字体类型:4":
                    font = PTTSCTextVectorFontStyle.style4
                case "字体类型:5":
                    font = PTTSCTextVectorFontStyle.style5
                case "字体类型:6":
                    font = PTTSCTextVectorFontStyle.style6
                case "字体类型:7":
                    font = PTTSCTextVectorFontStyle.style7
                case "字体类型:8":
                    font = PTTSCTextVectorFontStyle.style8
                case "字体类型:9":
                    font = PTTSCTextVectorFontStyle.style9
                    x_multiplication = 40
                    y_multiplication = 40
                default:
                    font = PTTSCTextVectorFontStyle.style1
            }
            let cmd = PTCommandTSPL.init()
            cmd.setCLS()
            cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
            cmd.setPrintAreaSizeWithWidth(kUserDefaults.integer(forKey: PDPrintDots) / 8, height: 110)
            let _ = cmd.printAutoTextForVector(withXpos: 10, yPos: 10, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, safeHeight: 1000, width: kUserDefaults.integer(forKey: PDPrintDots) - 50, lineSpacing: 10, text: "天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。")
            cmd.print(withSets: 1, copies: 1)
            PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        }
    }
    
    @objc class func printDotMatrixText() {
        
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setPrintAreaSizeWithWidth(kUserDefaults.integer(forKey: PDPrintDots) / 8, height: 110)
        cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
        let _ = cmd.printAutoText(withXpos: 10, yPos: 10, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, safeHeight: 1000, width: kUserDefaults.integer(forKey: PDPrintDots) - 50, lineSpacing: 10, text: "天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。")
        cmd.print(withSets: 1, copies: 1)
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func printReverseSampleForVector() {
        
        var fontArray = [String]()
        for i in 1...9 {
            fontArray.append("字体类型:\(i)")
        }
        
        let pickerView = PDPickerView.init(with: fontArray)
        PDAppWindow.addSubview(pickerView)
        
        pickerView.selectItemClosure = {(item) in
            
            var font = PTTSCTextVectorFontStyle.style9
            var x_multiplication = 1
            var y_multiplication = 1
            switch item {
                case "字体类型:1":
                    font = PTTSCTextVectorFontStyle.style1
                case "字体类型:2":
                    font = PTTSCTextVectorFontStyle.style2
                case "字体类型:3":
                    font = PTTSCTextVectorFontStyle.style3
                case "字体类型:4":
                    font = PTTSCTextVectorFontStyle.style4
                case "字体类型:5":
                    font = PTTSCTextVectorFontStyle.style5
                case "字体类型:6":
                    font = PTTSCTextVectorFontStyle.style6
                case "字体类型:7":
                    font = PTTSCTextVectorFontStyle.style7
                case "字体类型:8":
                    font = PTTSCTextVectorFontStyle.style8
                case "字体类型:9":
                    font = PTTSCTextVectorFontStyle.style9
                    x_multiplication = 40
                    y_multiplication = 40
                default:
                    font = PTTSCTextVectorFontStyle.style1
            }
            
            let cmd = PTCommandTSPL.init()
            cmd.setCLS()
            cmd.setPrintDirection(PTTSCPrintDirection.reverse, mirror: PTTSCPrintStyle.normal)
            cmd.setPrintAreaSizeWithWidth(90, height: 110)
            cmd.appendTextForVector(withXpos: 50, yPos: 400, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "测试中文标题")
            cmd.appendTextForVector(withXpos: 60, yPos: 500, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Jimmy Wang")
            cmd.appendTextForVector(withXpos: 50, yPos: 550, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Perfect Go.")
            cmd.appendTextForVector(withXpos: 50, yPos: 600, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Technicl Service Manager")
            cmd.printQRcode(withXPos: 300, yPos: 400, eccLevel: PTTSCQRcodeEcclevel.H, cellWidth: PTTSCQRcodeWidth.width5, mode: PTTSCQRCodeMode.manual, rotation: PTTSCStyleRotation.rotation0, model: PTTSCQRCodeModel.M2, mask: PTTSCQRcodeMask.S0, context: "_http://www.perfect.tw/")
            cmd.print(withSets: 1, copies: 1)
            PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        }
    }
    
    @objc class func printReverseSampleForDotMatrix() {
        
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setPrintDirection(PTTSCPrintDirection.reverse, mirror: PTTSCPrintStyle.normal)
        cmd.setPrintAreaSizeWithWidth(90, height: 110)
        cmd.appendText(withXpos: 50, yPos: 400, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "测试中文标题")
        cmd.appendText(withXpos: 60, yPos: 500, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Jimmy Wang")
        cmd.appendText(withXpos: 50, yPos: 550, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Perfect Go.")
        cmd.appendText(withXpos: 50, yPos: 600, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Technicl Service Manager")
        cmd.printQRcode(withXPos: 300, yPos: 400, eccLevel: PTTSCQRcodeEcclevel.H, cellWidth: PTTSCQRcodeWidth.width5, mode: PTTSCQRCodeMode.manual, rotation: PTTSCStyleRotation.rotation0, model: PTTSCQRCodeModel.M2, mask: PTTSCQRcodeMask.S0, context: "_http://www.perfect.tw/")
        cmd.print(withSets: 1, copies: 1)
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func printPositiveSampleForVector() {
        
        var fontArray = [String]()
        for i in 1...9 {
            fontArray.append("字体类型:\(i)")
        }
        
        let pickerView = PDPickerView.init(with: fontArray)
        PDAppWindow.addSubview(pickerView)
        
        pickerView.selectItemClosure = {(item) in
            
            var font = PTTSCTextVectorFontStyle.style9
            var x_multiplication = 1
            var y_multiplication = 1
            switch item {
                
                case "字体类型:1":
                    font = PTTSCTextVectorFontStyle.style1
                case "字体类型:2":
                    font = PTTSCTextVectorFontStyle.style2
                case "字体类型:3":
                    font = PTTSCTextVectorFontStyle.style3
                case "字体类型:4":
                    font = PTTSCTextVectorFontStyle.style4
                case "字体类型:5":
                    font = PTTSCTextVectorFontStyle.style5
                case "字体类型:6":
                    font = PTTSCTextVectorFontStyle.style6
                case "字体类型:7":
                    font = PTTSCTextVectorFontStyle.style7
                case "字体类型:8":
                    font = PTTSCTextVectorFontStyle.style8
                case "字体类型:9":
                    font = PTTSCTextVectorFontStyle.style9
                    x_multiplication = 40
                    y_multiplication = 40
                default:
                    font = PTTSCTextVectorFontStyle.style1
            }
            
            let cmd = PTCommandTSPL.init()
            cmd.setCLS()
            cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
            cmd.setPrintAreaSizeWithWidth(90, height: 110)
            cmd.appendTextForVector(withXpos: 50, yPos: 400, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "测试中文标题")
            cmd.appendTextForVector(withXpos: 60, yPos: 500, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Jimmy Wang")
            cmd.appendTextForVector(withXpos: 50, yPos: 550, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Perfect Go.")
            cmd.appendTextForVector(withXpos: 50, yPos: 600, font: font, rotation: PTTSCStyleRotation.rotation0, xMultiplication: x_multiplication, yMultiplication: y_multiplication, text: "Technicl Service Manager")
            cmd.printQRcode(withXPos: 300, yPos: 400, eccLevel: PTTSCQRcodeEcclevel.H, cellWidth: PTTSCQRcodeWidth.width5, mode: PTTSCQRCodeMode.manual, rotation: PTTSCStyleRotation.rotation0, model: PTTSCQRCodeModel.M2, mask: PTTSCQRcodeMask.S0, context: "_http://www.perfect.tw/")
            cmd.print(withSets: 1, copies: 1)
            PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        }
    }
    
    @objc class func printPositiveSampleForDotMatrix() {
        
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
        cmd.setPrintAreaSizeWithWidth(90, height: 110)
        cmd.appendText(withXpos: 50, yPos: 400, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "测试中文标题")
        cmd.appendText(withXpos: 60, yPos: 500, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Jimmy Wang")
        cmd.appendText(withXpos: 50, yPos: 550, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Perfect Go.")
        cmd.appendText(withXpos: 50, yPos: 600, font: PTTSCTextFontStyle.style0, rotation: PTTSCStyleRotation.rotation0, xMultiplication: 1, yMultiplication: 1, text: "Technicl Service Manager")
        cmd.printQRcode(withXPos: 300, yPos: 400, eccLevel: PTTSCQRcodeEcclevel.H, cellWidth: PTTSCQRcodeWidth.width5, mode: PTTSCQRCodeMode.manual, rotation: PTTSCStyleRotation.rotation0, model: PTTSCQRCodeModel.M2, mask: PTTSCQRcodeMask.S0, context: "_http://www.perfect.tw/")
        cmd.print(withSets: 1, copies: 1)
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func getPrinterStatus() {
        
        let tspl = PTCommandTSPL.init()
        tspl.setCLS()
        tspl.getPrinterStatus()
        PTDispatcher.share().send(tspl.cmdData as Data)
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let data = data else { return }
            print(data.hexString)
            guard let statusData = data.read(to: UInt8.self) else { return }
            let message = PDPrinterTSPLStatusOptionSet.init(rawValue: statusData).description
            SVProgressHUD.showSuccess(withStatus: message)
        })
    }

    
    @objc class func printBarcode() {
        
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setPrintDirection(PTTSCPrintDirection.normal, mirror: PTTSCPrintStyle.normal)
        cmd.printQRcode(withXPos: 100, yPos: 100, eccLevel: PTTSCQRcodeEcclevel.H, cellWidth: PTTSCQRcodeWidth.width7, mode: PTTSCQRCodeMode.manual, rotation: PTTSCStyleRotation.rotation0, model: PTTSCQRCodeModel.M1, mask: PTTSCQRcodeMask.S1, context: "Hello World")
        cmd.printBarcode(withXPos: 100, yPos: 300, type: PTTSCBarcodeStyle.style128, height: 80, readable: PTTSCBarcodeReadbleStyle.human, rotation: PTTSCStyleRotation.rotation0, ratio: PTTSCBarcodeRatio.ratio1, context: "123456789")
        cmd.print(withSets: 1, copies: 1)
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func testModel1() {
        
        let label = PTLabel()
        var dict : [String:Any] = [:]
        
        dict["number"] = "021D-123-789"
        dict["barcode"] = "AFC7150124715012424"
        dict["receiver_name"] = "齐齐哈尔木鱼"
        dict["receiver_phone"] = "15605883677 0571-53992320"
        dict["receiver_address"] = "黑龙江齐齐哈尔市建华区文化大街42号齐齐哈尔大学计算机工程学院001班"
        dict["sender_name"] = "浙江杭州行者"
        dict["sender_phone"] = "18000989090 0571-53992320"
        dict["sender_address"] = "浙江省杭州市余杭区文一西路1001号阿里巴巴淘宝城5号办公楼5号小邮局"
        dict["Orderdetails1"] = "我是厦门高崎路飞机场金砖回忆"
        dict["Orderdetails2"] = "爱在哪 家在哪"
        dict["Orderdetails3"] = "永不放弃 风雨同舟"
        
        guard let filePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/TSPL_ZhongJi", ofType: "txt") else {return}
        let source = try! String.init(contentsOfFile: filePath)
        /// 如果这边不需要dict,dict传空的就行
        guard let data = label.getTemplateData(source, labelDict: dict) else {return}
        
        let cmd = PTCommandTSPL.init()
        guard let imgaePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/LOGO", ofType: "png") else {return}
        guard let imageLogo = UIImage.init(contentsOfFile: imgaePath)?.cgImage else {return}
        cmd.addBitmap(withXPos: 400, yPos: 32, mode: .OR, image: imageLogo, bitmapMode: .dithering, compress: .none)
        cmd.addBitmap(withXPos: 300, yPos: 842, mode: .OR, image: imageLogo, bitmapMode: .dithering, compress: .none)
        cmd.print(withSets: 1, copies: 1)
        
        var finalData = Data()
        finalData.append(data)
        finalData.append(cmd.cmdData as Data)
        PDManagerSendData.shared.sendDataToPeripheral(data: finalData, true)
    }
    
    @objc class func setReceiptSample() {
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setReceiptPaper()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func setLabelSample() {
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setLabelPaper()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func setBlackMarkSample() {
        let cmd = PTCommandTSPL.init()
        cmd.setCLS()
        cmd.setBlackMarkPaper()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
}
