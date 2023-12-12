//
//  PDESCViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/10/28.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import SVProgressHUD
import PrinterSDK
import UniformTypeIdentifiers
import MobileCoreServices

class PDESCViewController: PDBaseViewController {
    
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
        
        navigationItem.title = "ESC function".localized
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        
        loadDataSource()
    }
    
    private func loadDataSource() {
        
        functions.removeAll()
        var item : PDSettingItem
        
        item = PDSettingItem.init(title: "Custom text Sample".localized, detailTitle: nil, target: self, selector: #selector(pushAutoTextVC))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Self-test page Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.printSelfTestPage))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Device Status Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.getPrinterStatus))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Barcode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.printBarcode))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Page Mode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.testPageModeSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Bill Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.testBillSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Bitmap Sample".localized, detailTitle: nil, target: self, selector: #selector(self.pushSystenPhoto))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Command File Print".localized, detailTitle: nil, target: self, selector: #selector(self.selectDocument))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Printer firmware upgrade".localized, detailTitle: nil, target: self, selector: #selector(self.updateDeviceFirmware))
        functions.append(item)
        
        item = PDSettingItem.init(title: "POS Bill Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.testPOSPrinterSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "POS Image Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.testPOSImageSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set the siyuan bold(Chinese)".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.setSesFontForChinese))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set the siyuan bold(English)".localized, detailTitle: nil, target: nil, selector: #selector(PDESCTestFunctions.setSesFontForEnglish))
        functions.append(item)
    }
    
}

extension PDESCViewController : UITableViewDelegate,UITableViewDataSource {
    
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
                PDESCTestFunctions.perform(selector)
            }
        }
    }
}

extension PDESCViewController {
    
    @objc func pushAutoTextVC() {
        
        self.navigationController?.pushViewController(PDPrintTextViewController(with: PTCommandType.ESC), animated: true)
    }
    
    //MARK:print image
    @objc func pushSystenPhoto() {
        
        let photoPickerVC = PDPhotoListViewController.init(with: PTCommandType.ESC)
        navigationController?.pushViewController(photoPickerVC, animated: true)
    }
    
    @objc func selectDocument() {
        
        self.selectDocumentType = PDDocumentPickerView.commandDocument
        let picker = UIDocumentPickerViewController.init(documentTypes: ["public.data"], in: .import)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        if #available(iOS 11.0, *) {
            picker.allowsMultipleSelection = false
        } else {
            // Fallback on earlier versions
        }
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

extension PDESCViewController: UIDocumentPickerDelegate {
    
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
                        guard let utf_string = String.init(data: data, encoding: String.Encoding.ascii) else {
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
