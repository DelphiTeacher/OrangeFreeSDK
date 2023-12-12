//
//  PDCPCLTestFunctions.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/10.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDCPCLTestFunctions: NSObject {
    
    @objc static func testPrinterStatus() {
        let cmd = PTCommandCPCL.init()
        cmd.cpclGetPaperStatus()
        PTDispatcher.share()?.send(cmd.cmdData as Data)
        PTDispatcher.share().whenSendSuccess { _, _ in
            
        }
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let data = data else { return }
            if data.count == 1 {
                guard let statusData = data.read(to: UInt8.self) else { return }
                let message = PDPrinterCPCLStatusOptionSet.init(rawValue: statusData).description
                PDAppWindow.rootViewController!.bk_presentWarningAlertController(title: "Tips".localized, message: message, style: .default)
            }
        })
    }
    
    
    @objc static func printSelfTestPage() {
        let cmd = PTCommandCPCL.init()
        cmd.printSelfInspectionPage()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    @objc static func testPrinterFont() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1100, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font1, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 50, text: "保护环境，24x24world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font2, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 150, text: "保护环境，24x24world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font3, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 250, text: "保护环境，20x20world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font4, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 350, text: "保护环境，32x32world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font5, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 450, text: "保护环境，24x24world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font7, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 550, text: "保护环境，24x24world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 650, text: "保护环境，24x24world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font20, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 750, text: "保护环境，16x16world")
        //        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font28, fontSize: 0, x: 20, y: 850, text: "保护环境，28x28world")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font55, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 850, text: "保护环境，16x16world")
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    //MARK:4寸打印机不需要自动换行 底层有做
    @objc static func printText() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1000, quantity: 1)
        cmd.cpclPageWidth(832)
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._2, height: PTCPCLFontScale._2)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 10, y: 10, text: "天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。未醒之际，辗转留连，如丝之未尽，如藕之未断，却是更深的梦了。天何不老？天本无梦。")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 10, y: 600, text: "Apart from tears, only time could wear everything away. While feeling is being processed by time, conflicts would be reconciled as time goes by, just like a cup of tea that is being continuously diluted.")
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._1, height: PTCPCLFontScale._1)
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    //MARK:3寸打印机要自动换行
    @objc static func testCpclText() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1000, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        
        cmd.cpclAutoText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: 0, x: 10, y: 10, safeHeight: 1000, width: kUserDefaults.integer(forKey: PDPrintDots) - 100, lineSpacing: 10, fontScale: PTCPCLFontScale._1, text: "天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。未醒之际，辗转留连，如丝之未尽，如藕之未断，却是更深的梦了。天何不老？天本无梦。")
        
        cmd.cpclAutoText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: 0, x: 10, y: 400, safeHeight: 1000, width: kUserDefaults.integer(forKey: PDPrintDots) - 100, lineSpacing: 10, fontScale: PTCPCLFontScale._1, text: "Apart from tears, only time could wear everything away. While feeling is being processed by time, conflicts would be reconciled as time goes by, just like a cup of tea that is being continuously diluted.")
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    @objc static func testBarcode() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1200, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 10, text: "CODE128")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.code128, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 50, barcode: "123456789")
        cmd.cpclBarcodeTextOff()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 200, text: "UPCA")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.UPCA, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 240, barcode: "123456789012")
        cmd.cpclBarcodeTextOff()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 390, text: "UPCE")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.UPCE, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 430, barcode: "1234567")
        cmd.cpclBarcodeTextOff()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 580, text: "EAN8")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.EAN8, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 620, barcode: "12345670")
        cmd.cpclBarcodeTextOff()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 770, text: "CODE93")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.code93, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 810, barcode: "12345")
        cmd.cpclBarcodeTextOff()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 30, y: 950, text: "CODE39")
        cmd.cpclBarcodeText(withFont: PTCPCLTextFontName.font8, fontSize: 0, offset: 5)
        cmd.cpclBarcode(PTCPCLBarcodeStyle.code39, width: 2, ratio: PTCPCLBarcodeBarRatio.ratio3, height: 100, x: 30, y: 1000, barcode: "12345")
        cmd.cpclBarcodeTextOff()
        
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    @objc static func testQRcode() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 800, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        cmd.cpclBarcodeQRcode(withXPos: 10, yPos: 10, model: PTCPCLQRCodeModel.model1, unitWidth: PTCPCLQRCodeUnitWidth._5)
        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.H, characterMode: PTCPCLQRCodeDataInputMode.A, context: "http://47.105.90.207:8084/orderInfoNoToken?accounts=17c26178b8164c32918b348f5d892d3d&orderNumber=PO2021-04-170001")
        cmd.cpclBarcodeQRcodeEnd()
        
//        cmd.cpclBarcodeQRcode(withXPos: 10, yPos: 200, model: PTCPCLQRCodeModel.model1, unitWidth: PTCPCLQRCodeUnitWidth._10)
//        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.Q, characterMode: PTCPCLQRCodeDataInputMode.A, context: "123456789")
//        cmd.cpclBarcodeQRcodeEnd()
//
//        cmd.cpclBarcodeQRcode(withXPos: 10, yPos: 500, model: PTCPCLQRCodeModel.model1, unitWidth: PTCPCLQRCodeUnitWidth._15)
//        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.M, characterMode: PTCPCLQRCodeDataInputMode.A, context: "123456789")
//        cmd.cpclBarcodeQRcodeEnd()
//
//        cmd.cpclBarcodeQRcode(withXPos: 10, yPos: 900, model: PTCPCLQRCodeModel.model1, unitWidth: PTCPCLQRCodeUnitWidth._17)
//        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.L, characterMode: PTCPCLQRCodeDataInputMode.A, context: "123456789")
//        cmd.cpclBarcodeQRcodeEnd()
        
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    //MARK:A400 A300S打印机设置纸张类型
    @objc static func testPaperType() {
        
        let paperArray = ["Continuous paper".localized,"Label".localized,"2 inch black label".localized,"3 inch black label".localized,"4 inch black label".localized]
        let pickerView = PDPickerView.init(with: paperArray)
        PDAppWindow.addSubview(pickerView)
        
        pickerView.selectItemClosure = { (item) in
            let cmd = PTCommandCPCL.init()
            if item == "Continuous paper".localized {
                cmd.setPrinterPaperTypeFor4Inch(PTCPCLNewPaperType.paperContinuoue)
            }else if item == "Label".localized {
                cmd.setPrinterPaperTypeFor4Inch(PTCPCLNewPaperType.paperLabel)
            }else if item == "2 inch black label".localized {
                cmd.setPrinterPaperTypeFor4Inch(PTCPCLNewPaperType.blackMarkInch2)
            }else if item == "3 inch black label".localized {
                cmd.setPrinterPaperTypeFor4Inch(PTCPCLNewPaperType.blackMarkInch3)
            }else if item == "4 inch black label".localized {
                cmd.setPrinterPaperTypeFor4Inch(PTCPCLNewPaperType.blackMarkInch4)
            }
            
            PTDispatcher.share()?.send(cmd.cmdData as Data)
            PTDispatcher.share()?.whenReceiveData({ (data) in
                
                guard let tempData = data else { return }
                if tempData.first == 1 {
                    SVProgressHUD.showSuccess(withStatus: "Setup succeeded".localized)
                }else {
                    SVProgressHUD.showError(withStatus: "Setup failed".localized)
                }
            })
        }
    }
    
    
    //MARK:3寸打印机设置纸张类型
    @objc static func testPaperTypeFor3Inch() {
        
        let paperArray = ["Continuous paper".localized,"Label".localized,"Back black mark".localized,"Front black mark".localized,"2 inch black label".localized,"3 inch black label".localized]
        let pickerView = PDPickerView.init(with: paperArray)
        PDAppWindow.addSubview(pickerView)
        
        pickerView.selectItemClosure = { (item) in
            let cmd = PTCommandCPCL.init()
            if item == "Continuous paper".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.continuoue)
            }else if item == "Label".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.label)
                
            }else if item == "2 inch black label".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.blackMarkInch2)
                
            }else if item == "3 inch black label".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.blackMarkInch3)
                
            }else if item == "Back black mark".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.backBlackMark)
                
            }else if item == "Front black mark".localized {
                cmd.cpclPaperType(with: PTCPCLPaperType.frontBlackMark)
            }
            
            PTDispatcher.share()?.send(cmd.cmdData as Data)
            PTDispatcher.share()?.whenReceiveData({ (data) in
                
                guard let tempData = data else { return }
                if tempData.first == 1 {
                    SVProgressHUD.showSuccess(withStatus: "Setup succeeded".localized)
                }else {
                    SVProgressHUD.showError(withStatus: "Setup failed".localized)
                }
            })
        }
    }
    
    
    @objc static func printBackGroundText() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1000, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        cmd.cpclCenter()
        
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._2, height: PTCPCLFontScale._2)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 0, y: 50, text: "blackness50")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 0, y: 400, text: "blackness150")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 0, y: 700, text: "blackness200")
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._1, height: PTCPCLFontScale._1)
        
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._10, height: PTCPCLFontScale._10)
        cmd.cpclSetBackgroundBlacknessValue(50)
        cmd.cpclBackText(withFont: PTCPCLTextFontName.font8, rotate: PTCPCLStyleRotation.rotation0, fontSize: 1, xPos: 0, yPos: 0, text: "508")
        cmd.cpclSetBackgroundBlacknessValue(150)
        cmd.cpclBackText(withFont: PTCPCLTextFontName.font8, rotate: PTCPCLStyleRotation.rotation0, fontSize: 1, xPos: 0, yPos: 300, text: "508")
        cmd.cpclSetBackgroundBlacknessValue(200)
        cmd.cpclBackText(withFont: PTCPCLTextFontName.font8, rotate: PTCPCLStyleRotation.rotation0, fontSize: 1, xPos: 0, yPos: 600, text: "508")
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._1, height: PTCPCLFontScale._1)
        cmd.cpclSetBackgroundBlacknessValue(0)
        
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    
    //模板
    @objc static func testCpclModel() {
        
        let label = PTLabel()
        var dict : [String:Any] = [:]
        
        dict["barcode"] = "363604310467"
        dict["distributing"] = "上海 上海市 长宁区"
        dict["receiver_name"] = "申大通"
        dict["receiver_phone"] = "13826514987"
        dict["receiver_address1"] = "上海市宝山区共和新路4719弄共"
        dict["receiver_address2"] = "和小区12号306室"
        dict["sender_name"] = "快小宝"
        dict["sender_phone"] = "13826514987"
        dict["sender_address1"] = "上海市长宁区北瞿路1178号（鑫达商务楼）"
        dict["sender_address2"] = "1号楼305室"
        
        guard let filePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/CPCL_ShenTong", ofType: "txt") else {return}
        let source = try! String.init(contentsOfFile: filePath)
        guard let data = label.getTemplateData(source, labelDict: dict) else {return}
        
        let cmd = PTCommandCPCL.init()
        guard let imgaePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/logo_sto", ofType: "png") else {return}
        guard let imageLogo = UIImage.init(contentsOfFile: imgaePath)?.cgImage else {return}
        cmd.cpclPrintBitmap(withXPos: 10, yPos: 10, image: imageLogo, bitmapMode: PTBitmapMode.binary, compress: PTBitmapCompressMode.none, isPackage: true)
        cmd.cpclPrintBitmap(withXPos: 10, yPos: 706, image: imageLogo, bitmapMode: PTBitmapMode.binary, compress: PTBitmapCompressMode.none, isPackage: true)
        cmd.cpclPrintBitmap(withXPos: 10, yPos: 1010, image: imageLogo, bitmapMode: PTBitmapMode.binary, compress: PTBitmapCompressMode.none, isPackage: true)
        
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        
        cmd.cpclPrint()
        
        var finalData = Data()
        finalData.append(data)
        finalData.append(cmd.cmdData as Data)
        
        PDManagerSendData.shared.sendDataToPeripheral(data: finalData, true)
    }
    
    @objc static func getPrinterSN() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclGetPrinterSN()
        PTDispatcher.share().send(cmd.cmdData as Data)
        PTDispatcher.share().whenSendSuccess { _, _ in
            
        }
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let tempData = data else { return }
            guard let tempSerial = String.init(data: tempData.removeZeroAtEnd(), encoding: .ascii) else { return }
            PDAppWindow.rootViewController!.bk_presentWarningAlertController(title: "Tips".localized, message: tempSerial, style: .default)
        })
    }
    
    @objc static func getPrinterFirmwareVersion() {
        
        let cmd = PTCommandCPCL.init()
        cmd.getFirmwareVersion()
        PTDispatcher.share().send(cmd.cmdData as Data)
        PTDispatcher.share().whenSendSuccess { _, _ in
            
        }
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let tempData = data else { return }
            guard let tempVer = String.init(data: tempData.removeZeroAtEnd(), encoding: .ascii) else { return }
            PDAppWindow.rootViewController!.bk_presentWarningAlertController(title: "Tips".localized, message: tempVer, style: .default)
        })
    }
    
    
    @objc static func testZTOSample() {
        
        let cmd = PTCommandCPCL()
        
        let boxThickness = 3
        let boxWidth = 575
        
        // 中通模式这边必须设置true，默认是false
        cmd.isZTO = false
        
        /// init label
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1030, quantity: 1)
        
        /// BOX 1
        cmd.cpclSetMag(withWidth: PTCPCLFontScale._1, height: PTCPCLFontScale._1)
        cmd.cpclBox(withXPos: 0, yPos: 0, xEnd: boxWidth, yEnd: 300, thickness: boxThickness)
        cmd.cpclLine(withXPos: 0, yPos: 64, xEnd: boxWidth, yEnd: 64, thickness: 2)
        cmd.cpclLine(withXPos: 0, yPos: 184, xEnd: boxWidth, yEnd: 184, thickness: 2)
        cmd.cpclLine(withXPos: 0, yPos: 264, xEnd: boxWidth, yEnd: 264, thickness: 2)
        cmd.cpclSetBold(PTCPCLTextBold.bold1)
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 24, y: 18, text: "HLWC PRINTER")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 410, y: 24, text: "Payment:")
        cmd.cpclSetBold(PTCPCLTextBold.bold0)
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font1, fontSize: PTCPCLTextFontSize.size0, x: 16, y: 88, text: "021D-CP93-X789")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 16, y: 200, text: "Xiamen, Fujian, China")
        cmd.cpclSetBold(PTCPCLTextBold.bold1)
        
        /// Barcode
        cmd.cpclBox(withXPos: 0, yPos: 330, xEnd: boxWidth, yEnd: 660, thickness: boxThickness)
        cmd.cpclCenter()
        cmd.cpclBarcode(PTCPCLBarcodeStyle.code128, width: 1, ratio: PTCPCLBarcodeBarRatio.ratio2, height: 120, x: 0, y: 360, barcode: "1234567890")
        cmd.cpclSetBold(PTCPCLTextBold.bold1)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font1, fontSize: PTCPCLTextFontSize.size0, x: 0, y: 510, text: "1234567890")
        cmd.cpclSetBold(PTCPCLTextBold.bold0)
        cmd.cpclLeft()
        cmd.cpclLine(withXPos: 0, yPos: 540, xEnd: boxWidth, yEnd: 540, thickness: 2)
        
        /// QRCode
        cmd.cpclBarcodeQRcode(withXPos: 100, yPos: 542, model: PTCPCLQRCodeModel.model2, unitWidth: PTCPCLQRCodeUnitWidth._5)
        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.M, characterMode: PTCPCLQRCodeDataInputMode.A, context: "HLWC PRINTER")
        cmd.cpclBarcodeQRcodeEnd()
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 320, y: 600, text: "HLWC PRINTER")
        //
        cmd.cpclBox(withXPos: 0, yPos: 700, xEnd: 575, yEnd: 1030, thickness: boxThickness)
        cmd.cpclLine(withXPos: 0, yPos: 840, xEnd: boxWidth, yEnd: 840, thickness: 2)
        cmd.cpclLine(withXPos: 0, yPos: 970, xEnd: boxWidth, yEnd: 970, thickness: 2)
        cmd.cpclLine(withXPos: 40, yPos: 700, xEnd: 40, yEnd: 970, thickness: 2)
        
        
        cmd.cpclSetBold(PTCPCLTextBold.bold1)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 710, text: "Xiamen 15605883677 0571-53992320")
        cmd.cpclSetBold(PTCPCLTextBold.bold0)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 755, text: "Room 702, 7th Building Hengda Garden, East District")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 790, text: "Xiamen, Fujian, China 361012")
        
        cmd.cpclSetBold(PTCPCLTextBold.bold1)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 850, text: "Qingdao 18000980909 0571-88948809")
        cmd.cpclSetBold(PTCPCLTextBold.bold0)
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 890, text: "NO. 204, Building NO. 1 Kaiping Road")
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 48, y: 930, text: "Qingdao, Shandong, China 266042 ")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 320, y: 980, text: "signature:")
        
        /*! *\~chinese 定位到下一标签，标签纸模式下启用该指令 *\~english Navigate to the next label, enable the command in tab mode */
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        
    }
    
    @objc static func getDeviceModel() {
        let cmd = PTCommandCPCL.init()
        cmd.cpclGetPrinterModel()
        PTDispatcher.share()?.send(cmd.cmdData as Data)
        PTDispatcher.share().whenSendSuccess { _, _ in
            
        }
        PTDispatcher.share()?.whenReceiveData({ (data) in
            guard let data = data else { return }
            guard let tempName = String.init(data: data.removeZeroAtEnd(), encoding: .ascii) else { return }
            PDAppWindow.rootViewController!.bk_presentWarningAlertController(title: "Tips".localized, message: tempName, style: .default)
        })
    }
    
    @objc static func testFontSizeParameterForPrintText() {
        
        let cmd = PTCommandCPCL.init()
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: 1100, quantity: 1)
        cmd.cpclPageWidth(kUserDefaults.integer(forKey: PDPrintDots))
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size0, x: 20, y: 50, text: "保护环境，size0")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size1, x: 20, y: 150, text: "保护环境，size1")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size2, x: 20, y: 250, text: "保护环境，size2")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size3, x: 20, y: 350, text: "保护环境，size3")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size4, x: 20, y: 450, text: "保护环境，size4")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size5, x: 20, y: 550, text: "保护环境，size5")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size6, x: 20, y: 650, text: "保护环境，size6")
        
        cmd.cpclText(withRotate: PTCPCLStyleRotation.rotation0, font: PTCPCLTextFontName.font8, fontSize: PTCPCLTextFontSize.size7, x: 20, y: 750, text: "保护环境，size7")
        
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
    }
    
    @objc static func updateA300LFirmware() {
        
        guard let filePath = Bundle.main.path(forResource: "PDPrinterResource.bundle/HMA300L_V1.1.60_CNGG", ofType: "bin") else {return}
        guard let bleData = NSData.init(contentsOfFile: filePath) as Data? else { return }
        PDManagerSendData.shared.updateFirmware(bleData)
    }
}


