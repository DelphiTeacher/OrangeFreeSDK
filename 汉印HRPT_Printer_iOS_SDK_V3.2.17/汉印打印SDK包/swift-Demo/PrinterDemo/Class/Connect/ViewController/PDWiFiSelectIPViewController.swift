//
//  PDWiFiSelectIPViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/12.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDWiFiSelectIPViewController: PDBaseViewController {
    
    lazy var titleLb : UILabel = {
        let temp = UILabel.init()
        temp.text = "Please enter the corresponding ip address:".localized
        temp.textColor = UIColor.titleColor
        temp.textAlignment = .left
        temp.font = UIFont.systemFont(ofSize: 16)
        return temp
    }()
    
    lazy var ipTF: UILabel = {
        let temp = UILabel.init()
        temp.textColor = UIColor.white
        temp.textAlignment = .center
        temp.backgroundColor = UIColor.theme
        temp.font = UIFont.boldSystemFont(ofSize: 17)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickShowIPView))
        temp.isUserInteractionEnabled = true
        temp.addGestureRecognizer(tap)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "WiFi".localized
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Connect".localized, style: UIBarButtonItem.Style.plain, target: self, action: #selector(connectDevice))
        
        view.addSubview(titleLb)
        titleLb.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(30 + kSafeAreaTopHeight)
            $0.height.equalTo(40)
        }
        
        view.addSubview(ipTF)
        ipTF.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(titleLb.snp.bottom).offset(5)
            $0.height.equalTo(50)
        }
        
        guard let ip = kUserDefaults.string(forKey: PDWiFiIP) else {
            ipTF.text = "192.168.1.1"
            return
        }
        ipTF.text = ip
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //防止切换连接的时候会走断开连接的回调
        PTDispatcher.share()?.unconnectBlock = nil
    }
    
    @objc private func clickShowIPView() {
        
        guard let temp = PDAppWindow.rootViewController else { return }
        let pickerVC = PDSelectPickerViewController()
        pickerVC.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        pickerVC.view.frame = temp.view.bounds
        pickerVC.selectedIP = ipTF.text
        temp.addChild(pickerVC)
        temp.view.addSubview(pickerVC.view)
        pickerVC.refreshIP()
        pickerVC.selectIPClosure = {[weak self](ip1,ip2,ip3,ip4) in
            guard let self = self else { return }
            self.ipTF.text = "\(ip1).\(ip2).\(ip3).\(ip4)"
        }
    }
    
    @objc private func connectDevice() {
        
        /// 构造PTPrinter对象进行连接
        SVProgressHUD.show(withStatus: "Connecting, pls. wait".localized)
        let pt = PTPrinter.init()
        pt.ip = ipTF.text
        pt.module = .wiFi
        pt.port = "9100"
        
        PTDispatcher.share().connect(pt)
        PTDispatcher.share().whenConnectSuccess {[weak self] in
            guard let self = self else { return }
            SVProgressHUD.dismiss()
            
            kUserDefaults.set(self.ipTF.text, forKey: PDWiFiIP)
            self.showAlert(title: "Select paper size".localized, buttonTitles: ["2\" (384dots)", "3\" (576dots)", "3\" (640dots)", "4\" (832dots)","8\" (2360dots)", "12\" (3540dots)"], handler: { (selectedButtonIndex) in
                self.didSelectPaperSize(buttonIndex: selectedButtonIndex)
            })
        }
        
        PTDispatcher.share().whenConnectFailureWithErrorBlock { (error) in
            var errorStr: String?
            switch error {
                case .streamTimeout:
                    errorStr = "Connection timeout".localized
                case .streamEmpty:
                    errorStr = "Connection Error".localized
                case .streamOccured:
                    errorStr = "Connection Error".localized
                default:
                    break
            }
            if let temp = errorStr {
                SVProgressHUD.showError(withStatus: temp)
            }
        }
        
        PTDispatcher.share()?.whenReceiveData({ (_) in
            
        })
        
    }
    
    
    
}
