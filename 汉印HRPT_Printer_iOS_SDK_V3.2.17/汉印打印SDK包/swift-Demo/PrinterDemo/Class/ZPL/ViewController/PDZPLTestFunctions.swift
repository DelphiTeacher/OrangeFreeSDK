//
//  PDZPLTestFunctions.swift
//  PrinterDemo
//
//  Created by ldc on 2019/10/25.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDZPLTestFunctions: NSObject {
    
    @objc class func printSelfTestPage() {
        
        let cmd = PTCommandZPL()
        cmd.printSelfTest()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }

    @objc class func testAllBarcode() {
        
        let cmd = PTCommandZPL()
        
        cmd.xa_FormatStart()
        
        //连续纸需要设置标签长度，标签纸可不用
        cmd.ll_LabelLength(1800)
        cmd.pw_PrintWidth(700)
        
        //b0
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 10)
        cmd.b0_BacodeAztec(with: .R, magnificationFactor: 7, isContainECIC: .N, errorAndSymbol: 0, isMenuSymbol: .N, appendSymbolNumber: 1, appendOptionalID: "0")
        cmd.fd_FieldData(" 7. This is testing label 7")

        //b1
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 200)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b1_BacodeCode11(with: .N, checkDigit: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")


        //b2
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 400)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b3_BacodeCode39(with: .N, checkDigit: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123ABC")

        //b8
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 600)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b8_BacodeEAN8(with: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("1234567")

//        be
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 800)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.be_BacodeEAN13(with: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("12345678")

//        bi
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 1000)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.bi_BacodeIndustrial2of5(with: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")


//        bj
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 1200)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.bj_BacodeStandard2of5(with: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")

        
        //bl
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 1400)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.bl_BacodeLOGMARS(with: .N, barcodeHeight: 100, printInterpretationLineAboveCode: .N)
        cmd.fd_FieldData("12AB")
        
        
        //bs
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 1600)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.bs_BacodeUPCEANExtensions(with: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("12345")
        cmd.xz_FormatEnd()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func testPrinterText1() {
        let cmd = PTCommandZPL()
        
        cmd.xa_FormatStart()

        //连续纸需要设置标签长度，标签纸可不用
        cmd.ll_LabelLength(700)
        cmd.pw_PrintWidth(700)
        
        cmd.a_SetFont(with: PTZplOrientation.N, height: 50, width: 50, location: PTZplFileLocation.E)
        cmd.fo_FieldOrigin(withXAxis: 100, yAxis: 100)
        cmd.fd_FieldData("中国福建省厦门市")
        cmd.fs_FieldSeparator()
        
        cmd.a_SetFont(with: PTZplOrientation.N, height: 50, width: 50, location: PTZplFileLocation.E)
        cmd.fo_FieldOrigin(withXAxis: 100, yAxis: 200)
        cmd.fd_FieldData("This uses E:SIMSUN.TTF")
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 100, yAxis: 300)
        cmd.a_SetFont(with: PTZplOrientation.N, height: 40, width: 40, location: PTZplFileLocation.E)
        cmd.fd_FieldData("众志成城，奋勇向前")
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 100, yAxis: 400)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b1_BacodeCode11(with: .N, checkDigit: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")
        
        cmd.xz_FormatEnd()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func testPrinterText2() {
                
        guard let filePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/ZPLTest", ofType: "txt") else {return}
        let source = try! String.init(contentsOfFile: filePath)
        let data = PTEncode.encodeData(with: source)!
 
        //修改图片尺寸
        let getImageIcon = UIImage.init(named: "zpl_get_icon")!
        let receiveImageIcon = UIImage.init(named: "zpl_receiver_icon")!
        let emsImageIcon = UIImage.init(named: "zpl_ems_icon")!
        let staImageIcon = UIImage.init(named: "zpl_sta_icon")!
        
        let cmd = PTCommandZPL()
        /// 下载
        cmd.dg_DownloadGraphics(with: getImageIcon.cgImage!, bitmapMode: .binary, compress: .LZO, deviceLocation: PTZplFileLocation.R, imageName: "izpl_get", extension: "GRF")
        cmd.dg_DownloadGraphics(with: receiveImageIcon.cgImage!, bitmapMode: .binary, compress: .LZO, deviceLocation: PTZplFileLocation.R, imageName: "izpl_receive", extension: "GRF")
        cmd.dg_DownloadGraphics(with: emsImageIcon.cgImage!, bitmapMode: .binary, compress: .LZO, deviceLocation: PTZplFileLocation.R, imageName: "izpl_ems", extension: "GRF")
        cmd.dg_DownloadGraphics(with: staImageIcon.cgImage!, bitmapMode: .binary, compress: .LZO, deviceLocation: PTZplFileLocation.R, imageName: "izpl_sta", extension: "GRF")
        
        cmd.xa_FormatStart()
        //模板数据这XA和XZ之间拼接
        cmd.cmdData.append(data)
        
        //将缓存区的图片打印出来
        cmd.fo_FieldOrigin(withXAxis: 55, yAxis: 43)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_get", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 40, yAxis: 385)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_receive", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 40, yAxis: 815)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_receive", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 45, yAxis: 709)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_ems", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 600, yAxis: 600)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_sta", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        
        cmd.fo_FieldOrigin(withXAxis: 600, yAxis: 1080)
        cmd.xg_RecallGraphic(withSourceDevice: PTZplFileLocation.R, imageName: "izpl_sta", extension: "GRF", xAxisMagnification: 1, yAxisMagnification: 1)
        cmd.fs_FieldSeparator()
        cmd.xz_FormatEnd()
        
        /// 删除缓存区的图片
        cmd.xa_FormatStart()
        cmd.id_ImageDelete(withObjectLocation: PTZplFileLocation.R, objectName: "izpl_get", extension: "GRF")
        cmd.id_ImageDelete(withObjectLocation: PTZplFileLocation.R, objectName: "izpl_receive", extension: "GRF")
        cmd.id_ImageDelete(withObjectLocation: PTZplFileLocation.R, objectName: "izpl_ems", extension: "GRF")
        cmd.id_ImageDelete(withObjectLocation: PTZplFileLocation.R, objectName: "izpl_sta", extension: "GRF")
        cmd.xz_FormatEnd()
        
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func testPrinterFont() {
        
        let cmd = PTCommandZPL()
        cmd.xa_FormatStart()
        
        let fonts: [PTZplFont] = [
            .font0,
            .font1,
            .fontA,
            .fontB,
            .fontC,
            .fontD,
            .fontE,
            .fontF,
            .fontG,
            .fontH,
            .fontI,
        ]
        
        var position = 20
        var size = 20
        var text: String
        for i in 0..<fonts.count {
            if i == 7 {
                cmd.xz_FormatEnd()
                cmd.xa_FormatStart()
                position = 20
            }
            cmd.fo_FieldOrigin(withXAxis: 20, yAxis: position)
            cmd.a_SetFont(.font0, fieldOrientation: .N, characterHeight: size, width: size)
            let font = fonts[i]
            let des = "font\(String.init(data: Data.init(repeating: font.rawValue, count: 1), encoding: .ascii)!)"
            text = "\(des) \(size) \(size)"
            cmd.fd_FieldData(text)
            position += size + 10
            size += 10
        }
        
        cmd.xz_FormatEnd()
        
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc class func printGraphics() {
        
        let cmd  = PTCommandZPL()
        
        //矩形
        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gb_GraphicBox(withWidth: 300, height: 200, thickness: 10, lineColor: .black, cornorRoundingDegree: 0)
        cmd.xz_FormatEnd()
        
        //竖线
        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gb_GraphicBox(withWidth: 0, height: 203, thickness: 20, lineColor: .black, cornorRoundingDegree: 0)
        cmd.xz_FormatEnd()
        //横线
        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gb_GraphicBox(withWidth: 203, height: 0, thickness: 20, lineColor: .black, cornorRoundingDegree: 0)
        cmd.xz_FormatEnd()

        //圆角矩形
        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gb_GraphicBox(withWidth: 300, height: 200, thickness: 10, lineColor: .black, cornorRoundingDegree: 5)
        cmd.xz_FormatEnd()

        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gc_GraphicCircle(withDiameter: 250, thickness: 10, lineColor: .black)
        cmd.xz_FormatEnd()

        cmd.xa_FormatStart()
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 50)
        cmd.gb_GraphicBox(withWidth: 350, height: 203, thickness: 10, lineColor: .black, cornorRoundingDegree: 0)
        cmd.fo_FieldOrigin(withXAxis: 155, yAxis: 110)
        cmd.gd_GraphicDiagonalLine(withWidth: 330, height: 183, thickness: 10, lineColor: .black, orientation: .leaningRight)
        cmd.xz_FormatEnd()
        
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc static func testPaperCut() {
        let cmd = PTCommandZPL()
        
        cmd.xa_FormatStart()
        
        //连续纸需要设置标签长度，标签纸可不用
        cmd.ll_LabelLength(800)
        cmd.pw_PrintWidth(700)
        
        //b0
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 10)
        cmd.b0_BacodeAztec(with: .R, magnificationFactor: 7, isContainECIC: .N, errorAndSymbol: 0, isMenuSymbol: .N, appendSymbolNumber: 1, appendOptionalID: "0")
        cmd.fd_FieldData(" 7. This is testing label 7")

        //b1
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 200)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b1_BacodeCode11(with: .N, checkDigit: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")


        //b2
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 400)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b3_BacodeCode39(with: .N, checkDigit: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123ABC")

        //b8
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 600)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b8_BacodeEAN8(with: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("1234567")
        
        cmd.pq_PrintQuantity(1, pauseValue: 1, replicateValue: 1, overrided: PTZplBool.Y)
        
        cmd.xz_FormatEnd()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc static func testStripper() {
        let cmd = PTCommandZPL()
        
        cmd.xa_FormatStart()
        cmd.pq_PrintQuantity(5)
        //连续纸需要设置标签长度，标签纸可不用
        cmd.ll_LabelLength(800)
        cmd.pw_PrintWidth(700)
        
        //b0
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 10)
        cmd.b0_BacodeAztec(with: .R, magnificationFactor: 7, isContainECIC: .N, errorAndSymbol: 0, isMenuSymbol: .N, appendSymbolNumber: 1, appendOptionalID: "0")
        cmd.fd_FieldData(" 7. This is testing label 7")

        //b1
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 200)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b1_BacodeCode11(with: .N, checkDigit: .N, barcodeHeight: 150, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123456")


        //b2
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 400)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b3_BacodeCode39(with: .N, checkDigit: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("123ABC")

        //b8
        cmd.fo_FieldOrigin(withXAxis: 50, yAxis: 600)
        cmd.by_BarcodeFieldDefault(withModuleWidth: 3)
        cmd.b8_BacodeEAN8(with: .N, barcodeHeight: 100, interpretationLine: .Y, aboveCode: .N)
        cmd.fd_FieldData("1234567")
        
        cmd.mm_SetPrintMode(PTZplPrintMode.P, preStripping: .N)
        
        cmd.xz_FormatEnd()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
}
