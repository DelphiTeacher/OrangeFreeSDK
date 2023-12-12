//
//  PDMainViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import SVProgressHUD
import PrinterSDK

enum PDSectionIndex : Int {
    case device = 0
    case command
    case appendix
}

class PDMainViewController: PDBaseViewController {

    private lazy var tableView : UITableView = {
        let tw = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tw.delegate = self
        tw.dataSource = self
        tw.rowHeight = 50
        tw.backgroundColor = UIColor.white
        tw.showsVerticalScrollIndicator = false
        tw.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "iOS SDK"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Disconnect".localized, style: UIBarButtonItem.Style.plain, target: self, action: #selector(disconnectDevice))
        kUserDefaults.set(true, forKey: PDPaperType)
    }
    
    func filterCharacters(_ version:String) -> String {

        var result = ""
        for cha in version {
            let predicateStr: String = "^[0-9.]{1}$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", predicateStr)
            if predicate.evaluate(with: String(cha)) {
                result.append(cha)
            }
        }
        return result
    }
    
    @objc private func disconnectDevice() {
        PTDispatcher.share()?.disconnect()
    }
    
    override func configUI() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        PTDispatcher.share().whenUnconnect { [weak self](_) in
            guard let self = self else { return }
            self.tableView.reloadData()
            SVProgressHUD.showInfo(withStatus: "Disconnected".localized)
            self.navigationController?.popToRootViewController(animated: true)
            PTDispatcher.share().sendSuccessBlock = nil
            PTDispatcher.share().sendFailureBlock = nil
            PTDispatcher.share().sendProgressBlock = nil
            PTDispatcher.share().connectFailBlock = nil
            PTDispatcher.share().connectSuccessBlock = nil
            PTDispatcher.share().readRSSIBlock = nil
            PTDispatcher.share()?.receiveDataBlock = nil
        }
    }

}

extension PDMainViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return PDSectionIndex.appendix.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch PDSectionIndex.init(rawValue: section)?.rawValue {
        case PDSectionIndex.device.rawValue:
            title = "Destination Device".localized
        case PDSectionIndex.command.rawValue:
            title = "Printer Command".localized
        case PDSectionIndex.appendix.rawValue:
            title = "Appendix".localized
        case .none:
            title = ""
        case .some(_):
            title = ""
        }
         return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == PDSectionIndex.device.rawValue {
            return 1
        }
        if section == PDSectionIndex.command.rawValue {
            return 4
        }
        if section == PDSectionIndex.appendix.rawValue {
            return 2
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "iden")
        
        if indexPath.section == 0 {
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "iden")
            }
            if cell != nil {
                if PTDispatcher.share()?.printerConnected == nil {
                    cell?.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
                    
                    cell?      .textLabel!.text = "Unconnected".localized
                    cell?.detailTextLabel!.text = ""
                    
                    cell?      .textLabel!.textColor = UIColor.theme
                    cell?.detailTextLabel!.textColor = UIColor.theme
                    
                    UIView.beginAnimations(nil, context: nil)
                    
                    cell?      .textLabel!.alpha = 0.0
                    cell?.detailTextLabel!.alpha = 0.0
                    
                    UIView.setAnimationDelay             (0.0)                             // 0mS!!!
                    UIView.setAnimationDuration          (0.6)                             // 600mS!!!
                    UIView.setAnimationRepeatCount       (Float(UINT32_MAX))
                    UIView.setAnimationRepeatAutoreverses(true)
                    UIView.setAnimationCurve             (UIView.AnimationCurve.easeIn)
                    
                    cell?      .textLabel!.alpha = 1.0
                    cell?.detailTextLabel!.alpha = 1.0
                    
                    UIView.commitAnimations()
                }else {
                    
                    if let device = PTDispatcher.share().printerConnected {
                        if let device_name = device.name {
                            if device_name.isEmpty || device_name == "unknown" || device_name == "Unknown" {
                                cell?.textLabel?.text = "Connected".localized
                            }else {
                                cell?.textLabel?.text = device.name
                            }
                        }else {
                            cell?.textLabel?.text = "Connected".localized
                        }
                    }
                    cell?.textLabel?.textColor = UIColor.black
                }
                cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                cell?.isUserInteractionEnabled = true
            }
        }else {
            cell?.backgroundColor = UIColor.white
            let cmdTypes = ["CPCL","ESC","TSPL","ZPL"]
            if indexPath.section == 1 {
                if cell == nil {
                    cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "iden")
                }
                cell?      .textLabel!.text = cmdTypes[indexPath.row]
                cell?.detailTextLabel!.text = ""
                
                cell?      .textLabel!.textColor = UIColor.titleColor
                cell?.detailTextLabel!.textColor = UIColor.titleColor
                cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            }
            
            let appdixs = ["View log".localized,"Delete log".localized]
            if indexPath.section == 2 {
                
                if cell == nil {
                    cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "iden")
                }
                
                cell?      .textLabel!.text = appdixs[indexPath.row]
                cell?.detailTextLabel!.text = ""
                
                cell?      .textLabel!.textColor = UIColor.black
                cell?.detailTextLabel!.textColor = UIColor.black
            }
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedSection = PDSectionIndex.init(rawValue: indexPath.section)!
        switch (selectedSection,indexPath.row) {
        case (PDSectionIndex.device,0):
            showConnectType()
        case (PDSectionIndex.command, let row):
            if PTDispatcher.share()?.printerConnected == nil {
                UIAlertController.showActionAlert("Tips".localized, message: "Printer unconnected, pls. connect".localized, confirm: "OK".localized) { (_) in
                    self.showConnectType()
                }
            }else {
            
                if row == 0 {
                    let alert = UIAlertController(title: "Please select the type of paper you want to print".localized, message: nil, preferredStyle: .alert)
                    let continueAction = UIAlertAction.init(title: "Continuous paper".localized, style: UIAlertAction.Style.default) { (_) in
                        kUserDefaults.set(false, forKey: PDPaperType)
                        self.navigationController?.pushViewController(PDCPCLViewController(), animated: true)
                    }
                    
                    let labelAction = UIAlertAction.init(title: "Label".localized, style: UIAlertAction.Style.default) { (_) in
                        kUserDefaults.set(true, forKey: PDPaperType)
                        self.navigationController?.pushViewController(PDCPCLViewController(), animated: true)
                    }
                    alert.addAction(continueAction)
                    alert.addAction(labelAction)
                    self.present(alert, animated: true, completion: nil)
                }else if row == 1 {
                    self.navigationController?.pushViewController(PDESCViewController(), animated: true)
                }else if row == 2 {
                    self.navigationController?.pushViewController(PDTSPLViewController(), animated: true)
                }else if row == 3 {
                    self.navigationController?.pushViewController(PDZPLViewController(), animated: true)
                    
                }
            }
        case (PDSectionIndex.appendix,let row):
            if row == 0 {
                self.navigationController?.pushViewController(PDLogViewController(), animated: true)
            }else {
                if PTLog.shareInstance().removeFile() {
                    SVProgressHUD.showSuccess(withStatus: "successfully deleted".localized)
                }else {
                    SVProgressHUD.showInfo(withStatus: "No log".localized)
                }
            }
            
        default:
            break
        }
        
    }
}

//connect
extension PDMainViewController {
    
    private func showConnectType() {
        
        guard let rootVC = PDAppWindow.rootViewController  else { return }
        let alert = UIAlertController.init(title: "Please select a connect type".localized, message:nil, preferredStyle: .alert)
        
        let action1 = UIAlertAction.init(title: "Bluetooth Low Energy".localized, style: .default) { _ in
            PTDispatcher.share().initBleCentral()
            self.pushBleController()
        }
        let action2 = UIAlertAction.init(title: "Wi-Fi", style: .default) { _ in
            self.pushWifiController()
        }
        let action3 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        rootVC.present(alert, animated: true, completion: nil)
    }
    
    @objc private func pushBleController() {
        navigationController?.pushViewController(PDBLEViewController(), animated: true)
    }
    
    @objc private func pushWifiController() {
        navigationController?.pushViewController(PDWiFiSelectIPViewController(), animated: true)
    }
}
