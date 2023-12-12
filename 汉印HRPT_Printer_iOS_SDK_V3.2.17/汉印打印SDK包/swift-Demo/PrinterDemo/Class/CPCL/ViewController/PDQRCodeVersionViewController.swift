//
//  PDQRCodeVersionViewController.swift
//  PrinterDemo
//
//  Created by ios on 2020/4/16.
//  Copyright © 2020 XiamenHY. All rights reserved.
//

import UIKit

class PDQRCodeVersionViewController: PDBaseViewController {

    lazy var versionL: UILabel = {
        let temp = UILabel()
        temp.text = "Please select a version of the qr code size".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var versionTF: UILabel = {
        let temp = UILabel()
        temp.text = "0"
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(PDQRCodeVersionViewController.getQRCodeVersion))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var enterL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please enter the qr code".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var textView : UITextView = {
        let temp = UITextView.init()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        return temp
    }()
    
    
    lazy var labelHeightL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please select a print height".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        return temp
    }()
    
    lazy var labelHeightTF: UILabel = {
        let temp = UILabel.init()
        temp.text = "600"
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(PDQRCodeVersionViewController.selectLabelHeight))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    lazy var sendBtn : UIButton = {
        let temp = UIButton.init()
        temp.backgroundColor = UIColor.theme
        temp.setTitle("Send".localized, for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.setTitleColor(UIColor.black, for: .highlighted)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.addTarget(self, action: #selector(PDQRCodeVersionViewController.sendDataToPeripheral), for: .touchUpInside)
        return temp
    }()
    
    var qrVersion = 0
    var label_height = 600
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override func configUI() {
        super.configUI()
        
        navigationItem.title = "QR Code"
        view.backgroundColor = UIColor.white
        view.addSubview(versionL)
        versionL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(versionTF)
        versionTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(versionL.snp.bottom).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(35)
        }
        
        view.addSubview(enterL)
        enterL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(versionTF.snp.bottom).offset(30)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(enterL.snp.bottom).offset(10)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(150)
        }
        
        view.addSubview(labelHeightL)
        labelHeightL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(textView.snp.bottom).offset(20)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        view.addSubview(labelHeightTF)
        labelHeightTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(labelHeightL.snp.bottom).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(35)
        }
        
        view.addSubview(sendBtn)
        sendBtn.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(labelHeightTF.snp.bottom).offset(30)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(35)
        }
    }
    

}

extension PDQRCodeVersionViewController {
    
    @objc func getQRCodeVersion() {
        
        var versionArray = [String]()
        for i in 0...25 {
            versionArray.append("\(i)")
        }
        let pick = PDPickerView.init(with: versionArray)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {[weak self](code) in
            guard let self = self else { return }
            self.versionTF.text = code
            self.qrVersion = Int(code)!
        }
    }
    
    @objc func selectLabelHeight() {
        
        let versionArray = ["100","300","500","700","900","1100","1300","1500","1700"]
        let pick = PDPickerView.init(with: versionArray)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {[weak self](code) in
            guard let self = self else { return }
            self.labelHeightTF.text = code
            self.label_height = Int(code)!
        }
    }
    
    @objc func sendDataToPeripheral() {
        
        if textView.text.isEmpty {
            SVProgressHUD.showInfo(withStatus: "Please enter the qr code".localized)
            return
        }
        let cmd = PTCommandCPCL.init()
        
        cmd.setQRCodeVersion(self.qrVersion)
        
        cmd.cpclLabel(withOffset: 0, hRes: PTCPCLLabelResolution.resolution200, vRes: PTCPCLLabelResolution.resolution200, height: label_height, quantity: 1)
        cmd.cpclBarcodeQRcode(withXPos: 10, yPos: 10, model: PTCPCLQRCodeModel.model2, unitWidth: PTCPCLQRCodeUnitWidth._5)
        cmd.cpclBarcodeQRCodeCorrectionLecel(PTCPCLQRCodeCorrectionLevel.M, characterMode: PTCPCLQRCodeDataInputMode.A, context: textView.text)
        cmd.cpclBarcodeQRcodeEnd()
        if kUserDefaults.bool(forKey: PDPaperType) {
            cmd.cpclForm()
        }
        cmd.cpclPrint()
        PDManagerSendData.shared.sendDataToPeripheral(data: cmd.cmdData as Data, true)
        
    }
}
