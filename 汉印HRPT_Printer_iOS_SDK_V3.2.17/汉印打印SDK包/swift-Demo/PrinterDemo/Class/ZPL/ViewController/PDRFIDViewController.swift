//
//  PDRFIDViewController.swift
//  PrinterDemo
//
//  Created by ios on 2021/1/22.
//  Copyright © 2021 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

enum PDRFIDCmd {
    case CPCL
    case ZPL
}

class PDRFIDViewController: PDBaseViewController {

    init(with cmd: PDRFIDCmd) {
        self.command = cmd
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "RFID Sample".localized
        view.backgroundColor = UIColor.white
    }
    
    lazy var enterL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please enter text".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        view.addSubview(temp)
        return temp
    }()
    
    lazy var textView : UITextView = {
        let temp = UITextView.init()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 18)
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.addBackView()
        view.addSubview(temp)
        return temp
    }()
    
    lazy var backdataL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Printer return data".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        view.addSubview(temp)
        return temp
    }()
    
    lazy var backdataTF : UITextView = {
        let temp = UITextView.init()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 14)
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.isEditable = false
        temp.isSelectable = false
        view.addSubview(temp)
        return temp
    }()
    
    lazy var memoryL: UILabel = {
        let temp = UILabel.init()
        temp.text = "Please select the storage area".localized
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.textColor = UIColor.black
        view.addSubview(temp)
        return temp
    }()
    
    lazy var memoryTF: UILabel = {
        let temp = UILabel.init()
        temp.text = "EPC"
        temp.font = UIFont.systemFont(ofSize: 17)
        temp.textAlignment = .center
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(selectMemoryArea))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        view.addSubview(temp)
        return temp
    }()

    lazy var writeBtn : UIButton = {
        let temp = UIButton.init()
        temp.backgroundColor = UIColor.theme
        temp.setTitle("Write and read".localized, for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.setTitleColor(UIColor.black, for: .highlighted)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.addTarget(self, action: #selector(self.writeRFID), for: .touchUpInside)
        view.addSubview(temp)
        return temp
    }()
    
    lazy var readBtn : UIButton = {
        let temp = UIButton.init()
        temp.backgroundColor = UIColor.theme
        temp.setTitle("Read".localized, for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.setTitleColor(UIColor.black, for: .highlighted)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        temp.addTarget(self, action: #selector(self.readRFID), for: .touchUpInside)
        view.addSubview(temp)
        return temp
    }()
    
    lazy var leftLayout : UILayoutGuide = {
        let temp = UILayoutGuide()
        view.addLayoutGuide(temp)
        return temp
    }()
    
    lazy var centerLayout : UILayoutGuide = {
        let temp = UILayoutGuide()
        view.addLayoutGuide(temp)
        return temp
    }()
    
    lazy var rightlLayout : UILayoutGuide = {
        let temp = UILayoutGuide()
        view.addLayoutGuide(temp)
        return temp
    }()
        
    var zplMemory = PTZplRFIDMemory.EPC
    var cpclMemory = PTCPCLRFIDMemory.EPC
    var command = PDRFIDCmd.ZPL
    
    
    override func configUI() {
        
        enterL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        textView.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(enterL.snp.bottom).offset(8)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(100)
        }
        
        memoryL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(textView.snp.bottom).offset(15)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        memoryTF.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(memoryL.snp.bottom).offset(8)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(35)
        }
                
        writeBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(memoryTF.snp.bottom).offset(15)
            $0.width.equalTo(kScreenWidth - 70)
            $0.height.equalTo(44)
        }
        
        backdataL.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(writeBtn.snp.bottom).offset(20)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(25)
        }
        
        backdataTF.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(backdataL.snp.bottom).offset(8)
            $0.width.equalTo(kScreenWidth - 30)
            $0.height.equalTo(100)
        }
    }
}

extension PDRFIDViewController {
    
    @objc private func selectMemoryArea() {
        
        let memoryArray = ["Reserved", "EPC", "TID", "User"]
        let pick = PDPickerView.init(with: memoryArray)
        PDAppWindow.addSubview(pick)
        pick.selectItemClosure = {[weak self](mm) in
            guard let self = self else { return }
            self.memoryTF.text = mm
            if mm == "TID" {
                self.writeBtn.isEnabled = false
                self.writeBtn.backgroundColor = UIColor.lightGray
            }else {
                self.writeBtn.isEnabled = true
                self.writeBtn.backgroundColor = UIColor.theme
            }
            switch mm {
                case "Reserved":
                    self.zplMemory = .reserved
                    self.cpclMemory = .reserved
                case "EPC":
                    self.zplMemory = .EPC
                    self.cpclMemory = .EPC
                case "TID":
                    self.zplMemory = .TID
                    self.cpclMemory = .TID
                case "User":
                    self.zplMemory = .user
                    self.cpclMemory = .user
                default:
                    break
            }
        }
    }
    
    @objc private func writeRFID() {
        
        if textView.text.isEmpty {
            SVProgressHUD.showInfo(withStatus: "Please enter text".localized)
            return
        }
        /// 起始位置
        var beginAddr = 0
        
        if self.memoryTF.text == "Reserved" {
            beginAddr = 0
        }else if self.memoryTF.text == "EPC" {
            beginAddr = 2
        }else if self.memoryTF.text == "User" {
            beginAddr = 0
        }else {
            SVProgressHUD.showInfo(withStatus: "The TID district has yet to provide a case".localized)
            return
        }
        
        
        /// cpcl
        if self.command == .CPCL {
            
            let cmd = PTCommandCPCL.init()
            cmd.rfidPrint()
            
            guard let data = PTEncode.encodeData(with: textView.text) else {
                SVProgressHUD.showInfo(withStatus: "The data is wrong".localized)
                return
            }
            let hexStr = data.rfid_hexString
            print(hexStr)
            let ret = cmd.rfidWriteData(hexStr, beginAddr: 2, memory: .EPC)
            
            if !ret {
                SVProgressHUD.showInfo(withStatus: "The number of bytes written is too large".localized)
                return
            }
            cmd.rfidReadData(withLength: data.count * 2, beginAddr: 2, memory: .EPC)
            
            cmd.cpclLabel(withOffset: 0, hRes: .resolution200, vRes: .resolution200, height: 50, quantity: 1)
            cmd.cpclForm()
            cmd.cpclPrint()
            
            SVProgressHUD.show()
            PTDispatcher.share().send(cmd.cmdData as Data)
            
            PTDispatcher.share()?.whenSendSuccess({(_,_) in
                SVProgressHUD.showSuccess(withStatus: "Data sent successfully".localized)
            })
            
            PTDispatcher.share().whenSendFailure {
                SVProgressHUD.showError(withStatus: "Data send failed".localized)
            }
            
            /// 读取数据有可能比较慢，可以增加一个定时器等待读取
            PTDispatcher.share().whenReceiveData { [weak self](data) in
                guard let temp = data else { return }
                guard let self = self else { return }
                print(#line,temp.hexString)
                guard let resultStr = PTEncode.decodeString(with: temp) else { return }
                print(resultStr)
                self.backdataTF.text = resultStr
                guard let resultData = resultStr.hexadecimalStringToData() else { return }
                guard let validString = PTEncode.decodeString(with: resultData) else { return }
                self.backdataTF.text = validString
            }
        }
        
        /// zpl
        if self.command == .ZPL {
            
            let cmd = PTCommandZPL()
            cmd.xa_FormatStart()
            
            cmd.pw_PrintWidth(584)

            /// 文本的字节数
            let data = PTEncode.encodeData(with: textView.text)!
            /// 16进制字符串，eg: 3131323233333434
            let hexStr = data.rfid_hexString
            
            /// 这边做下内存判断
            if self.zplMemory == .reserved {
                if beginAddr * 2 + data.count > 8 {
                    SVProgressHUD.showInfo(withStatus: "The number of bytes written is too large".localized)
                    return
                }
            }
            if self.zplMemory == .EPC {
                if beginAddr * 2 + data.count > 16 {
                    SVProgressHUD.showInfo(withStatus: "The number of bytes written is too large".localized)
                    return
                }
            }
            if self.zplMemory == .user {
                if beginAddr * 2 + data.count > 128 {
                    SVProgressHUD.showInfo(withStatus: "The number of bytes written is too large".localized)
                    return
                }
            }
            
            cmd.rf_RFIDOperation(.W, beginAddr: beginAddr, length: data.count, memory: self.zplMemory)
            cmd.fd_FieldData(hexStr)
            
            cmd.rf_RFIDOperation(.R, beginAddr: beginAddr, length: data.count, memory: self.zplMemory)
            cmd.fn_FieldNumber(1)
            cmd.fh_FieldHexadecimal()
            cmd.hv_SetBackDataAuth(withFieldNumber: 1, length: 0, head: "RFID", end: "END")
            
            cmd.xz_FormatEnd()
            
            SVProgressHUD.show()
            PTDispatcher.share().send(cmd.cmdData as Data)
            
            PTDispatcher.share()?.whenSendSuccess({(_,_) in
                SVProgressHUD.showSuccess(withStatus: "Data sent successfully".localized)
            })
            
            PTDispatcher.share().whenSendFailure {
                SVProgressHUD.showError(withStatus: "Data send failed".localized)
            }
            
            /// 读取数据有可能比较慢，可以增加一个定时器等待读取
            PTDispatcher.share().whenReceiveData { [weak self](data) in
                guard let temp = data else { return }
                guard let self = self else { return }
                print(#line,temp.hexString)
                guard let backStr = PTEncode.decodeString(with: temp) else { return }
                let beginIndex = backStr.index(backStr.startIndex, offsetBy: 4)
                let endIndex = backStr.index(backStr.endIndex, offsetBy: -4)
                /// 得到有效的字符串
                let resultStr = String(backStr[beginIndex...endIndex])
                guard let resultData = resultStr.hexadecimalStringToData() else { return }
                guard let validString = PTEncode.decodeString(with: resultData) else { return }
                self.backdataTF.text = validString
                SVProgressHUD.showSuccess(withStatus: "Read the success".localized)
            }
            
        }
                
    }
    
    @objc private func readRFID() {
        
        
    }
}
