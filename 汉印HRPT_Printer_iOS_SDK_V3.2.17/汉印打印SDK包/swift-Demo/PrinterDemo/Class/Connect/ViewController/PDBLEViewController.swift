//
//  PDBLEViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/9.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDBLEViewController: PDBaseViewController {
    
    private var dataSources = [PTPrinter]()
    
    lazy var tableView : UITableView = {
        let temp = UITableView.init(frame: .zero, style: .grouped)
        temp.delegate = self
        temp.dataSource = self
        temp.backgroundColor = .white
        temp.rowHeight = 60.0
        temp.showsVerticalScrollIndicator = false
        temp.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        return temp
    }()
    
    lazy var mj_header: MJRefreshNormalHeader = {
        let temp = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(loadBLE))
        temp.setTitle("Scanning nearby Bluetooth".localized, for: MJRefreshState.refreshing)
        temp.stateLabel?.textColor = UIColor.gray
        temp.lastUpdatedTimeLabel?.isHidden = true
        
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "BLE".localized
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        tableView.mj_header = mj_header
    }
    
    @objc func loadBLE() {
        PTDispatcher.share()?.stopScanBluetooth()
        dataSources.removeAll()
        self.tableView.reloadData()
        PTDispatcher.share().scanBluetooth()
        PTDispatcher.share()?.whenFindAllBluetooth({ [weak self] in
            guard let self = self else { return }
            guard let temp = $0 as? [PTPrinter] else { return }
            self.dataSources = temp.sorted(by: { (pt1, pt2) -> Bool in
                return pt1.distance.floatValue < pt2.distance.floatValue
            })
            
            self.mj_header.endRefreshing()
            self.tableView.reloadData()
        })
//        if PTDispatcher.share()?.getBluetoothStatus() == PTBluetoothState.poweredOn {
//
//        }else if PTDispatcher.share()?.getBluetoothStatus() == PTBluetoothState.poweredOff {
//            self.mj_header.endRefreshing()
//            SVProgressHUD.showInfo(withStatus: "Please turn on Bluetooth".localized)
//        }else {
//            self.mj_header.endRefreshing()
//            SVProgressHUD.showInfo(withStatus: "Please go to system Settings to find your APP open bluetooth permissions".localized)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //防止切换连接的时候会走断开连接的回调
        PTDispatcher.share()?.unconnectBlock = nil
        
        PTDispatcher.share().scanBluetooth()
        PTDispatcher.share()?.whenFindAllBluetooth({ [weak self] in
            guard let self = self else { return }
            guard let temp = $0 as? [PTPrinter] else { return }
            self.dataSources = temp.sorted(by: { (pt1, pt2) -> Bool in
                return pt1.distance.floatValue < pt2.distance.floatValue
            })
            self.tableView.reloadData()
        })
//        if PTDispatcher.share()?.getBluetoothStatus() == PTBluetoothState.poweredOn {
//
//        }else if PTDispatcher.share()?.getBluetoothStatus() == PTBluetoothState.poweredOff {
//            SVProgressHUD.showInfo(withStatus: "Please turn on Bluetooth".localized)
//        }else {
//            SVProgressHUD.showInfo(withStatus: "Please go to system Settings to find your APP open bluetooth permissions".localized)
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        PTDispatcher.share().whenConnectSuccess(nil)
        PTDispatcher.share().whenConnectFailureWithErrorBlock(nil)
    }
    
}

extension PDBLEViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "iden")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "iden")
        }
        cell?.textLabel?.text = dataSources[indexPath.row].name
        cell?.detailTextLabel?.text = dataSources[indexPath.row].mac
        
        cell?.textLabel?.textColor = UIColor.black
        cell?.detailTextLabel?.textColor = UIColor.titleColor
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Bluetooth device nearby".localized
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        SVProgressHUD.show(withStatus: "Connecting, pls. wait".localized)
        PTDispatcher.share().connect(dataSources[indexPath.row])
        
        PTDispatcher.share().whenConnectSuccess { [weak self] in
            guard let self = self else { return }
            SVProgressHUD.dismiss()
            self.showAlert(title: "Select paper size".localized, buttonTitles: ["2\" (384dots)", "3\" (576dots)","3\" (640dots)", "4\" (832dots)","8\" (2360dots)", "12\" (3540dots)"], handler: { (selectedButtonIndex) in
                self.didSelectPaperSize(buttonIndex: selectedButtonIndex)
            })
        }
        
        PTDispatcher.share().whenConnectFailureWithErrorBlock { (error) in
            var errorStr: String?
            switch error {
                case .bleTimeout:
                    errorStr = "Connection timeout".localized
                case .bleValidateTimeout:
                    errorStr = "Vertification timeout".localized
                case .bleUnknownDevice:
                    errorStr = "Unknown device".localized
                case .bleSystem:
                    errorStr = "System error".localized
                case .bleValidateFail:
                    errorStr = "Vertification failed".localized
                case .bleDisvocerServiceTimeout:
                    errorStr = "Connection failed".localized
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

extension UIViewController {
    
    func showAlert(title: String, buttonTitles: [String], handler: ((Int) -> Void)?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        for i: Int in 0..<buttonTitles.count {
            alert.addAction(UIAlertAction(title: buttonTitles[i], style: .default, handler: { _ in
                DispatchQueue.main.async {
                    handler?(i + 1)
                }
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (_) in
            kUserDefaults.set(576, forKey: PDPrintDots)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func didSelectPaperSize(buttonIndex: Int) {
        switch buttonIndex {
            case 1:
                kUserDefaults.set(384, forKey: PDPrintDots)
            case 2:
                kUserDefaults.set(576, forKey: PDPrintDots)
            case 3:
                kUserDefaults.set(640, forKey: PDPrintDots)
            case 4:
                kUserDefaults.set(832, forKey: PDPrintDots)
            case 5:
                kUserDefaults.set(2360, forKey: PDPrintDots)
            case 6:
                kUserDefaults.set(3540, forKey: PDPrintDots)
            default:
                fatalError()
        }
        self.navigationController?.popViewController(animated: true)
    }
}
