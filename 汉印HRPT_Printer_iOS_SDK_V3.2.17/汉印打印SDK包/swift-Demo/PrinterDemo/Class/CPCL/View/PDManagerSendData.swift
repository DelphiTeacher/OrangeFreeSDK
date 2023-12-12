//
//  PDManagerSendData.swift
//  PrinterDemo
//
//  Created by ios on 2019/11/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDManagerSendData: NSObject {

    static var shared = PDManagerSendData()
    
    func sendDataToPeripheral(data:Data,_ showProgressHUD:Bool) {
        
        if PTDispatcher.share().printerConnected == nil {
            SVProgressHUD.showInfo(withStatus: "Printer unconnected, pls. connect".localized)
            return
        }
        
        if showProgressHUD {
            SVProgressHUD.show()
        }
        
        PTDispatcher.share().send(data)
        
        PTDispatcher.share()?.whenSendProgressUpdate({ (_) in
            //
        })
        
        PTDispatcher.share()?.whenSendSuccess({(_,_) in
            SVProgressHUD.showSuccess(withStatus: "Data sent successfully".localized)
        })
        
        PTDispatcher.share().whenSendFailure {
            SVProgressHUD.showError(withStatus: "Data send failed".localized)
        }
        
        PTDispatcher.share().whenReceiveData { (data) in
            guard let temp = data else { return }
            print(#line,temp.hexString)
            let str = String.init(data: temp, encoding: String.Encoding.ascii)
            SVProgressHUD.showSuccess(withStatus: str)
        }
        
    }
        
    
    func sendCommandData(_ data: Data) {
        
        SVProgressHUD.show()
        PTDispatcher.share()?.send(data)
        PTDispatcher.share()?.whenSendFailure({
            SVProgressHUD.showError(withStatus: "Data send failed".localized)
        })
        
        PTDispatcher.share()?.whenSendSuccess({(_,_) in
            SVProgressHUD.showSuccess(withStatus: "Data sent successfully".localized)
        })
        
        PTDispatcher.share()?.whenSendProgressUpdate({_ in
            
        })
        
        PTDispatcher.share().whenReceiveData { _ in
            
        }
    }
    
    /// 升级固件
    func updateFirmware(_ data: Data) {
        
        SVProgressHUD.show()
        let cmd = PTCommandCommon.init()
        cmd.updatePrinterFirmware(with: data)
        PTDispatcher.share().writeFirmwareData(cmd.cmdData as Data) { progress in
            guard let progress = progress else { return }
            SVProgressHUD.showProgress(Float(progress.fractionCompleted))
            if progress.isFinished {
                SVProgressHUD.showSuccess(withStatus: "The upgrade was successful, please wait for the printer to restart befor using".localized)
            }
        } fail: {
            SVProgressHUD.showError(withStatus: "Upgrade failed".localized)
        }
        
    }
    
}
