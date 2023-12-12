//
//  PDESCTestFunctions.swift
//  PrinterDemo
//
//  Created by ios on 2019/10/28.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDESCTestFunctions: NSObject {

    
    @objc class func printSelfTestPage() {
        
        let esc = PTCommandESC.init()
        esc.printSelfTest()
        PDManagerSendData.shared.sendDataToPeripheral(data: esc.getCommandData(), true)
        
    }
    
    @objc class func getPrinterStatus() {
        
        let esc = PTCommandESC.init()
        esc.getPrinterStatus()
        PTDispatcher.share()?.send(esc.getCommandData())
        PTDispatcher.share().whenSendSuccess { _, _ in
            
        }
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let tempData = data else { return }
            let byte = [UInt8](tempData)
            var status = ""
            
            if byte[0] & 4 == 4 {
                status += "Cover opened".localized
            }else {
                status += "Cover closed".localized
            }
            
            if byte[1] & 96 == 96 {
                status += "Out of paper".localized
            }else {
                status += "Paper remaining".localized
            }
            PDAppWindow.rootViewController!.bk_presentWarningAlertController(title: "Tips".localized, message: status, style: .default)
        })
        
    }
    
    
    @objc class func printBarcode() {
                
        let esc = PTCommandESC.init()
        esc.initializePrinter()
        
        esc.appendText("UPCA:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_UPCA, data: "075678164125", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("UPCE:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_UPCE, data: "01230000045", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("EAN8:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_EAN8, data: "04210009", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("EAN13:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_EAN13, data: "6901028075831", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("CODE39:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_CODE39, data: "123456789", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("TIF:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_ITF, data: "9876543210", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("CODEBAR:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_CODEBAR, data: "A40156B", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("CODE93:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_CODE93, data: "TEST93", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("CODE128:", mode: ESCText.normal)
        esc.append(ESCBarcode.B_CODE128, data: "{A123456789012", justification: 0, width: 2, height: 60, hri: 2)
        esc.appendText("\n", mode: ESCText.normal)
        
        esc.appendText("QR code:", mode: ESCText.normal)
        esc.appendQRCodeData("hello world", justification: 0, leftMargin: 10, eccLevel: 48, model: 49, size: 5)
        
        PDManagerSendData.shared.sendDataToPeripheral(data: esc.getCommandData(), true)
    }
    
    @objc class func testPageModeSample() {
        
        let esc = PTCommandESC.init()
        
        esc.initializePrinter()
        esc.setPageMode()
        esc.pageSetPrintArea(withXPos: 0, yPos: 0, width: 400, height: 500)
        
        esc.pageSetPrintDirection(0)
        esc.setAbsolutePosition(10)
        esc.pageSetAbsoluteYPos(10)
        esc.appendQRCodeData("1234567890", justification: 0, leftMargin: 150, eccLevel: 48, model: 49, size: 5)
        
        esc.pageSetPrintDirection(0)
        esc.setAbsolutePosition(200)
        esc.pageSetAbsoluteYPos(10)
        esc.appendQRCodeData("1234567890", justification: 0, leftMargin: 150, eccLevel: 48, model: 49, size: 5)
        
        esc.printAndReturnStandardMode()
        esc.cancelPrint()
        
        /// pos 标签定位
//        esc.positionNextLabel()
        PDManagerSendData.shared.sendDataToPeripheral(data: esc.getCommandData(), true)
    }
    
    @objc class func testBillSample() {
        
        let esc = PTCommandESC.init()
        
        esc.initializePrinter()
        esc.appendText("TEST TITLE\n\n", mode: ESCText.doubleWidth)
        
        let companyMessage = "2F,8#,Gaoqi Nan Shi'er Road\n(Aide Industiral Park)\nXiamen,China 361006\n\nTel:+(86)-(0)592-5885993,5756958\nWebsite:http://www.prttech.com\n\n"
        esc.appendText(companyMessage, mode: ESCText.normal)
        
        var receiptText = ""
        receiptText.append("------------------------------\n")
        receiptText.append("           NO.1008            \n")
        receiptText.append("\(Date.init())\n")
        receiptText.append("------------------------------\n")
        receiptText.append("MPT-II          1      $700.00\n")
        receiptText.append("MPT-III         1      $700.00\n")
        receiptText.append("LPQ58           1      $800.00\n")
        receiptText.append("BLE1            1      $800.00\n")
        receiptText.append("BLE123          1      $900.00\n")
        receiptText.append("POS80A          1      $900.00\n")
        receiptText.append("POS80B          1      $950.00\n")
        receiptText.append("POS80C          1      $950.00\n")
        receiptText.append("SMP-R381        1      $850.00\n")
        receiptText.append("SMP-R385        1      $850.00\n")
        receiptText.append("SMP-R386        1      $850.00\n")
        receiptText.append("MPT-II          1      $700.00\n")
        receiptText.append("MPT-III         1      $700.00\n")
        receiptText.append("LPQ58           1      $800.00\n")
        receiptText.append("BLE-14          1      $800.00\n")
        receiptText.append("BLE-23          1      $900.00\n")
        receiptText.append("E300            1      $900.00\n")
        receiptText.append("E200            1      $900.00\n")
        receiptText.append("T300            1      $900.00\n")
        receiptText.append("POS80C          1      $900.00\n")
        receiptText.append("POS80E          1      $900.00\n")
        receiptText.append("POS808          1      $900.00\n")
        receiptText.append("POS801          1      $900.00\n")
        receiptText.append("------------------------------\n\n")
        receiptText.append("Total                $18500.00\n")
        receiptText.append("-------------------------------\n\n")
        esc.appendText(receiptText, mode: ESCText.normal)
        
        esc.append(ESCBarcode.B_UPCA, data: "075678164125", justification: 0, width: 3, height: 30, hri: 2)
        esc.appendQRCodeData("https://itunes.apple.com/lookup?id=1472096775", justification: 0, leftMargin: 0, eccLevel: 48, model: 49, size: 10)
        
        var copyright = ""
        copyright.append("\(Date.init())\n")
        copyright.append("POS Editor:V1.2.0\n")
        copyright.append("Copyright 2018 POS Editor.\n")
        copyright.append("All rights reserved\n\n\n\n")
        esc.appendText(copyright, mode: ESCText.normal)
        
        esc.setFullCutWithDistance(100)
        PDManagerSendData.shared.sendDataToPeripheral(data: esc.getCommandData(), true)
    }
    
    @objc class func testPOSPrinterSample() {
        
        let esc = PTCommandESC.init()
        
        esc.initializePrinter()
        esc.appendText("Test POS Printer First\n\n", mode: ESCText.doubleWidth)
        
        var receiptText = ""
        receiptText.append("TP801----------------$900.00\n")
        receiptText.append("TP802----------------$900.00\n")
        receiptText.append("TP808----------------$900.00\n")
        receiptText.append("TP809----------------$900.00\n")
        receiptText.append("TP805----------------$900.00\n")
        receiptText.append("TP806----------------$900.00\n")
        esc.appendText(receiptText, mode: ESCText.normal)
        
        esc.append(ESCBarcode.B_UPCA, data: "075678164125", justification: 0, width: 3, height: 30, hri: 2)
        //cut
        esc.setFullCutWithDistance(100)
        
        esc.appendText("\n\n")
        esc.appendText("Test POS Printer Second\n\n", mode: ESCText.doubleWidth)
        var copyright = ""
        copyright.append("Apple------------------$900.00\n")
        copyright.append("Apricot----------------$900.00\n")
        copyright.append("Avocado----------------$900.00\n")
        copyright.append("Banana-----------------$900.00\n")
        copyright.append("Cherry-----------------$900.00\n")
        copyright.append("Coconut----------------$900.00\n")
        esc.appendText(copyright, mode: ESCText.normal)
        //cut
        esc.setFullCutWithDistance(100)
        
        //open cashdrawer
        esc.kickCashdrawer(0)
        
        PDManagerSendData.shared.sendDataToPeripheral(data: esc.getCommandData(), true)
    }
    
    @objc class func testPOSImageSample() {
        
        guard let imgaePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/cainiao", ofType: "jpg") else {return}
        guard let cgTemp = UIImage.init(contentsOfFile: imgaePath)?.cgImage else {return}
        
        let cmd = PTCommandESC.init()
        cmd.appendRasterImage(cgTemp, mode: .binary, compress: .LZO, package: true)
        
        //如果打印机开启了黑标侦测和黑标自动定位后切刀功能，那么加上这条自动定位再切刀就有效果
        //自动定位
        cmd.setPrinterAutomaticPosition()
        //全切
        cmd.setFullCut()
//        cmd.setPartialCut()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.getCommandData(), true)
    }
    
    @objc class func setSesFontForChinese() {
        let fontSizes = ["33","34","35"]
        let pick = PDPickerView.init(with: fontSizes)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {(code) in
            guard let size = Int(code) else { return }
            let cmd = PTCommandESC.init()
            cmd.setChineseSesBlackFontWithSize(size)
            PDManagerSendData.shared.sendDataToPeripheral(data: cmd.getCommandData(), true)
        }
    }
    
    @objc class func setSesFontForEnglish() {
        let fontSizes = ["33","34","35"]
        let pick = PDPickerView.init(with: fontSizes)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {(code) in
            guard let size = Int(code) else { return }
            let cmd = PTCommandESC.init()
            cmd.setEnglishSesBlackFontWithSize(size)
            PDManagerSendData.shared.sendDataToPeripheral(data: cmd.getCommandData(), true)
        }
    }
    
    
}
