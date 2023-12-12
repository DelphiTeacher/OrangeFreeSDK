//
//  PDTSPLViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/10/29.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDTSPLViewController: PDBaseViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TSPL function".localized
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        
        loadDataSource()
    }
    
    private func loadDataSource() {
        
        functions.removeAll()
        var item : PDSettingItem
        
        item = PDSettingItem.init(title: "Self-test page Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printSelfTestPage))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Vector text Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printVectorText))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Dot Matrix text Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printDotMatrixText))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Positive Sample(Vector)".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printPositiveSampleForVector))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Reverse Sample(Vector)".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printReverseSampleForVector))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Positive Sample(DotMatrix)".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printPositiveSampleForDotMatrix))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Reverse Sample(DotMatrix)".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printReverseSampleForDotMatrix))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Device Status Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.getPrinterStatus))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Barcode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.printBarcode))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Bitmap Sample".localized, detailTitle: nil, target: self, selector: #selector(self.pushSystenPhoto))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Command File Print".localized, detailTitle: nil, target: self, selector: #selector(self.selectDocument))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Model Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.testModel1))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set Receipt Paper".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.setReceiptSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set Label Paper".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.setLabelSample))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Set Black Mark Paper".localized, detailTitle: nil, target: nil, selector: #selector(PDTSPLTestFunctions.setBlackMarkSample))
        functions.append(item)
    }
    

}

extension PDTSPLViewController : UITableViewDelegate,UITableViewDataSource {
    
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
                PDTSPLTestFunctions.perform(selector)
            }
        }
    }
}

extension PDTSPLViewController {
    
    //MARK:print image
    @objc func pushSystenPhoto() {
        
        let photoPickerVC = PDPhotoListViewController.init(with: PTCommandType.TSPL)
        navigationController?.pushViewController(photoPickerVC, animated: true)
    }
    
    @objc func selectDocument() {
        
        let picker = UIDocumentPickerViewController.init(documentTypes: ["public.data"], in: .import)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        if #available(iOS 11.0, *) {
            picker.allowsMultipleSelection = false
        }
        self.present(picker, animated: true, completion: nil)
    }
}

extension PDTSPLViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        
        sendData(from: url)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        sendData(from: urls[0])
    }
    
    func sendData(from url: URL) -> Void {
        
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
    }
}

struct PDPrinterTSPLStatusOptionSet : OptionSet,CustomStringConvertible {
    
    var rawValue: UInt8
    typealias RawValue = UInt8
    
    static let headOpen = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<0)
    static let paperJam = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<1)
    static let noPaper = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<2)
//    static let noRibbon = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<3)
    static let pause = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<4)
    static let printing = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<5)
    static let coverOpened = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<6)
    static let high = PDPrinterTSPLStatusOptionSet.init(rawValue: 1<<7)
    
    var description: String {
        
        var messages = [String]()
        if contains(.headOpen) {
            messages.append("Open".localized)
        }
        
        if contains(.paperJam) {
            messages.append("Paper jam".localized)
        }
        
        if contains(.noPaper) {
            messages.append("Out of paper".localized)
        }
        
        if contains(.pause) {
            messages.append("Pause".localized)
        }
        
        if contains(.printing) {
            messages.append("Printing".localized)
        }

        if contains(.coverOpened) {
            messages.append("Open".localized)
        }

        if contains(.high) {
            messages.append("High".localized)
        }
        
        if messages.count == 0 {
            messages.append("Ready".localized)
        }
        return  messages.joined(separator: "--")
    }
}
