//
//  PDZPLViewController.swift
//  PrinterDemo
//
//  Created by ldc on 2019/10/25.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDZPLViewController: PDBaseViewController {

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

        navigationItem.title = "ZPL function".localized
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        
        loadDataSource()
    }
    
    private func loadDataSource() {
        
        functions.removeAll()
        var item : PDSettingItem
        
        item = PDSettingItem.init(title: "Self-test page Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.printSelfTestPage))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Text Sample1".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testPrinterText1))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Text Sample2".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testPrinterText2))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Font Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testPrinterFont))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Barcode Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testAllBarcode))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Graphics Sample".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.printGraphics))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Bitmap Sample".localized, detailTitle: nil, target: self, selector: #selector(self.pushSystenPhoto))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Command File Print".localized, detailTitle: nil, target: self, selector: #selector(self.pickDocument))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Paper cutting sample".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testPaperCut))
        functions.append(item)
        
        item = PDSettingItem.init(title: "Stripper example".localized, detailTitle: nil, target: nil, selector: #selector(PDZPLTestFunctions.testStripper))
        functions.append(item)
        
        item = PDSettingItem.init(title: "RFID Sample".localized, detailTitle: nil, target: self, selector: #selector(self.testRFID))
        functions.append(item)
    }
    
    @objc private func testRFID() {
        navigationController?.pushViewController(PDRFIDViewController(with: .ZPL), animated: true)
    }

    //MARK:print image
    @objc func pushSystenPhoto() {
        
        let photoPickerVC = PDPhotoListViewController.init(with: PTCommandType.ZPL)
        navigationController?.pushViewController(photoPickerVC, animated: true)
    }
    
    @objc func pickDocument() {
        
        let picker = UIDocumentPickerViewController.init(documentTypes: ["public.data"], in: .import)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        self.present(picker, animated: true, completion: nil)
    }
}

extension PDZPLViewController: UIDocumentPickerDelegate {
    
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

extension PDZPLViewController : UITableViewDelegate,UITableViewDataSource {
    
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
                PDZPLTestFunctions.perform(selector)
            }
        }
    }
}
