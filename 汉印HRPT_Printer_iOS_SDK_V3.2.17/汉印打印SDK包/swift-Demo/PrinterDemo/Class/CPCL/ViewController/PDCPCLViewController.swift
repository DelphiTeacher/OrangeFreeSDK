//
//  PDCPCLViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import UniformTypeIdentifiers
import MobileCoreServices
import SVProgressHUD
import PrinterSDK

enum PDDocumentPickerView {
    case commandDocument
    case firmwareBin
}

public struct PDSettingItem {
    
    var title: String
    var detailTitle: String?
    weak var target: NSObject?
    var selector: Selector?
}

class PDCPCLViewController: PDBaseViewController {
    
    lazy var tableView : UITableView = {
        let temp = UITableView.init(frame: .zero, style: .plain)
        temp.delegate = self
        temp.dataSource = self
        temp.backgroundColor = .white
        temp.rowHeight = 50.0
        temp.showsVerticalScrollIndicator = false
        temp.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        return temp
    }()
    
    private var functions = [PDSettingItem]()
    var selectDocumentType = PDDocumentPickerView.commandDocument
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "CPCL function".localized
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        
        PTDispatcher.share().whenUpdatePrintState({ (state) in
            print(#line,"\(state)")
            if state == .success {
                SVProgressHUD.showSuccess(withStatus: "Print Success".localized)
                
            } else if state == PTPrintState.failureLidOpen {
                SVProgressHUD.showInfo(withStatus: "Print fail (LidOpe)".localized)
                
            } else if state == PTPrintState.failurePaperEmpty {
                SVProgressHUD.showInfo(withStatus: "Print fail (PaperEmpty)".localized)
            }
        })
        
        loadDataSource()
    }
    
    private func loadDataSource() {
        
        functions.removeAll()
        var item : PDSettingItem
        
        item = PDSettingItem.init(title: "Upgrade Cainiao A300L firmware".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.updateA300LFirmware))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Custom text Sample".localized, detailTitle: nil, target: self, selector: #selector(pushAutoTextVC))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Device Status Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testPrinterStatus))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Self-test page Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.printSelfTestPage))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Printer serial number".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.getPrinterSN))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Printer firmware version number".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.getPrinterFirmwareVersion))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Font Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testPrinterFont))
        functions.append(item)
        
        //区分A400 A300S的机子和3寸机子
        if kUserDefaults.integer(forKey: PDPrintDots) == 832 {
            item = PDSettingItem.init(title: "Text Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.printText))
            functions.append(item)
            
            item = PDSettingItem.init(title: "Set Paper Type Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testPaperType))
            functions.append(item)
        }else {
            item = PDSettingItem.init(title: "Text Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testCpclText))
            functions.append(item)
    
        }
        
        item = PDSettingItem.init(title: "Barcode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testBarcode))
        functions.append(item)
        
        item = PDSettingItem.init(title: "QRcode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testQRcode))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Bitmap Sample".localized, detailTitle: nil, target: self, selector: #selector(self.pushSystenPhoto))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Background Text Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.printBackGroundText))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Express template".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testCpclModel))
        functions.append(item)
        
        item = PDSettingItem.init(title: "ZTO Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testZTOSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Command File Print".localized, detailTitle: nil, target: self, selector: #selector(self.selectDocument))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Printer firmware upgrade".localized, detailTitle: nil, target: self, selector: #selector(self.updateDeviceFirmware))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set QRCode version".localized, detailTitle: nil, target: self, selector: #selector(self.pushQRCodeVC))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Get Device Model(BMAU32S series)".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.getDeviceModel))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Size parameter test for print text(BMAU32S series)".localized, detailTitle: nil, target: nil, selector: #selector(PDCPCLTestFunctions.testFontSizeParameterForPrintText))
        functions.append(item)
        
        item = PDSettingItem.init(title: "RFID Sample".localized, detailTitle: nil, target: self, selector: #selector(self.testRFID))
        functions.append(item)
    }
    
}

extension PDCPCLViewController {
    
    @objc private func testRFID() {
        navigationController?.pushViewController(PDRFIDViewController(with: .CPCL), animated: true)
    }
    
    @objc func pushAutoTextVC() {
        self.navigationController?.pushViewController(PDPrintTextViewController(with: PTCommandType.CPCL), animated: true)
    }
    
    @objc func pushQRCodeVC() {
        self.navigationController?.pushViewController(PDQRCodeVersionViewController(), animated: true)
    }
    
    //MARK:print image
    @objc func pushSystenPhoto() {
        
        let photoPickerVC = PDPhotoListViewController.init(with: PTCommandType.CPCL)
        navigationController?.pushViewController(photoPickerVC, animated: true)
    }
    
    @objc func selectDocument() {
        self.selectDocumentType = PDDocumentPickerView.commandDocument
        let picker = UIDocumentPickerViewController.init(documentTypes: ["public.data"], in: .import)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func updateDeviceFirmware() {
        UIAlertController.showActionAlert("Tips".localized, message: "This function is only for some models, please confirm whether your printer supports the function, if it supports, please select the printer firmware to upgrade".localized, confirm: "OK".localized) { (_) in
            self.selectDocumentType = PDDocumentPickerView.firmwareBin
            var picker: UIDocumentPickerViewController
            if #available(iOS 14, *) {
                picker = UIDocumentPickerViewController.init(
                    forOpeningContentTypes: [
                        UTType.init(tag: "bin", tagClass: UTTagClass.filenameExtension, conformingTo: UTType.data)!
                    ], asCopy: true)
            }else {
                picker = UIDocumentPickerViewController.init(documentTypes: ["public.data"], in: .import)
            }
            picker.delegate = self
            picker.navigationController?.navigationBar.isTranslucent = false
            picker.modalPresentationStyle = .fullScreen
            picker.modalTransitionStyle = .crossDissolve
            self.present(picker, animated: true, completion: nil)
        }
    }
}

extension PDCPCLViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        
        sendData(from: url)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        sendData(from: urls[0])
    }
    
    func sendData(from url: URL) -> Void {
        
        switch self.selectDocumentType {
            case .commandDocument:
                let alertControl = UIAlertController(title: "Tips".localized, message: "Please select the mode of sending data".localized, preferredStyle: UIAlertController.Style.alert)
                alertControl.addTextField { (textTF) in
                    textTF.placeholder = "Please enter the number of copies".localized
                }
                
                let cancel = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel, handler: nil)
                let strConfirm = UIAlertAction(title: "Text mode".localized, style: UIAlertAction.Style.default) { [weak alertControl](_) in
                    guard let alert = alertControl else { return }
                    guard let position = alert.textFields?.first, var temp = position.text else { return }
                    if temp.isEmpty {
                        temp = "1"
                    }
                    
                    if let resultInt = Int(temp) {
                        
                        guard let data = try? Data.init(contentsOf: url) else {
                            SVProgressHUD.showError(withStatus: "Get File failed".localized)
                            return
                        }
                        guard let utf_string = PTEncode.decodeString(with: data) else {
                            SVProgressHUD.showInfo(withStatus: "The file is not supported".localized)
                            return
                        }
                        guard let fileData = PTEncode.encodeData(with: utf_string) else {
                            SVProgressHUD.showInfo(withStatus: "The file is not supported".localized)
                            return
                        }
                        var sendData = Data()
                        for _ in 0..<resultInt {
                            sendData.append(fileData)
                        }
                        PDManagerSendData.shared.sendCommandData(sendData)
                    }else {
                        SVProgressHUD.showError(withStatus: "Incorrect input, please re-enter".localized)
                    }
                }
                
                let hexConfirm = UIAlertAction(title: "Hex mode".localized, style: UIAlertAction.Style.default) { [weak alertControl](_) in
                    guard let alert = alertControl else { return }
                    guard let position = alert.textFields?.first, var temp = position.text else { return }
                    if temp.isEmpty {
                        temp = "1"
                    }
                    
                    if let resultInt = Int(temp) {
                        
                        guard let data = try? Data.init(contentsOf: url) else {
                            SVProgressHUD.showError(withStatus: "Get File failed".localized)
                            return
                        }
                        guard let utf_string = PTEncode.decodeString(with: data) else {
                            SVProgressHUD.showInfo(withStatus: "The file is not supported".localized)
                            return
                        }
                        guard let fileData = utf_string.hexadecimalStringToData() else {
                            SVProgressHUD.showInfo(withStatus: "Irregular HEX data".localized)
                            return
                        }
                        var sendData = Data()
                        for _ in 0..<resultInt {
                            sendData.append(fileData)
                        }
                        PDManagerSendData.shared.sendCommandData(sendData)
                    }else {
                        SVProgressHUD.showError(withStatus: "Incorrect input, please re-enter".localized)
                    }
                }
                
                alertControl.addAction(strConfirm)
                alertControl.addAction(hexConfirm)
                alertControl.addAction(cancel)
                self.present(alertControl, animated: true, completion: nil)
            
            case .firmwareBin:
                UIAlertController.showActionAlert("Tips".localized, message: "Are you sure to upgrade the printer firmware?".localized, confirm: "OK".localized) { (_) in
                    
                    guard let deviceData = try? Data.init(contentsOf: url) else {
                        SVProgressHUD.showError(withStatus: "Get File failed".localized)
                        return
                    }
                    PDManagerSendData.shared.updateFirmware(deviceData)
            }
        }
    }
}

extension PDCPCLViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "iden")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "iden")
        }
        cell?.textLabel?.text = functions[indexPath.row].title
        cell?.textLabel?.textColor = UIColor.black
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let action = functions[indexPath.row]
        if let target = action.target {
            if let selector = action.selector {
                target.perform(selector)
            }
        }else {
            if let selector = action.selector {
                PDCPCLTestFunctions.perform(selector)
            }
        }
    }
}

//Printer Status
struct PDPrinterCPCLStatusOptionSet : OptionSet,CustomStringConvertible {
    
    var rawValue: UInt8
    typealias RawValue = UInt8
    
    static let busy = PDPrinterCPCLStatusOptionSet.init(rawValue: 1<<0)
    static let paperEnd = PDPrinterCPCLStatusOptionSet.init(rawValue: 1<<1)
    static let openCover = PDPrinterCPCLStatusOptionSet.init(rawValue: 1<<2)
    static let lowVoltage = PDPrinterCPCLStatusOptionSet.init(rawValue: 1<<3)
    
    var description: String {
        
        var messages = [String]()
        if contains(.busy) {
            messages.append("Busy".localized)
        }
        
        if contains(.paperEnd) {
            messages.append("Out of paper".localized)
        }
        
        if contains(.openCover) {
            messages.append("Open".localized)
        }
        
        if contains(.lowVoltage) {
            messages.append("Battery is Low".localized)
        }
        
        if messages.count == 0 {
            messages.append("Ready".localized)
        }
        return  messages.joined(separator: "--")
    }
}


