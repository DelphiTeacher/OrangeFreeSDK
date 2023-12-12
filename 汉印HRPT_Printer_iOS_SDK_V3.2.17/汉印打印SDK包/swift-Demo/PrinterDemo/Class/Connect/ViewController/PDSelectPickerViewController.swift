//
//  PDSelectPickerViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/12.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

typealias PDIPPickerClosure = (_: String, _: String, _: String, _: String) -> Void

class PDSelectPickerViewController: UIViewController {

    lazy var toolBar = UIToolbar()
    lazy var pickerView : UIPickerView = {
        let temp = UIPickerView()
        temp.delegate = self
        temp.backgroundColor = UIColor.white
        return temp
    }()
    
    var selectIPClosure : PDIPPickerClosure?
    var selectedIP : String?
    var options = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        configUI()
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(PDSelectPickerViewController.removePickerController))
        view.addGestureRecognizer(tap)
        
        for index in 0...255 {
            options.append("\(index)")
        }
        pickerView.reloadAllComponents()
    }
    
    func refreshIP() {
        
        if let temp = selectedIP {
            let ips = temp.split(separator: ".").map({String($0)})
            if ips.count >= 4 {
                pickerView.selectRow(Int(ips[0])! + options.count * 25, inComponent: 0, animated: true)
                pickerView.selectRow(Int(ips[1])! + options.count * 25, inComponent: 1, animated: true)
                pickerView.selectRow(Int(ips[2])! + options.count * 25, inComponent: 2, animated: true)
                pickerView.selectRow(Int(ips[3])! + options.count * 25, inComponent: 3, animated: true)
            }else {
                pickerView.selectRow(0 + options.count * 25, inComponent: 0, animated: true)
                pickerView.selectRow(0 + options.count * 25, inComponent: 1, animated: true)
                pickerView.selectRow(0 + options.count * 25, inComponent: 2, animated: true)
                pickerView.selectRow(0 + options.count * 25, inComponent: 3, animated: true)
            }
        }else {
            pickerView.selectRow(0 + options.count * 25, inComponent: 0, animated: true)
            pickerView.selectRow(0 + options.count * 25, inComponent: 1, animated: true)
            pickerView.selectRow(0 + options.count * 25, inComponent: 2, animated: true)
            pickerView.selectRow(0 + options.count * 25, inComponent: 3, animated: true)
        }
    }
    
    private func configUI() {
        
        view.addSubview(pickerView)
        pickerView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.usnp.bottom)
            $0.height.equalTo(PDWidth_pt(x: 215))
        }
        
        view.addSubview(toolBar)
        toolBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(pickerView.snp.top).offset(0)
            $0.height.equalTo(44)
        }
        
        let fixedSpace = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = PDWidth_pt(x: 15)
        let cancelItem = UIBarButtonItem.init(title: "Cancel".localized, style: .done, target: self, action: #selector(PDSelectPickerViewController.removePickerController))
        let space = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let pickItem = UIBarButtonItem.init(title: "OK".localized, style: .done, target: self, action: #selector(PDSelectPickerViewController.confirmSelect))
        toolBar.items = [fixedSpace,cancelItem,space,pickItem,fixedSpace]
    }
}


extension PDSelectPickerViewController {
    
    @objc func confirmSelect() {
        
        let ip1 = pickerView.selectedRow(inComponent: 0)
        let ip2 = pickerView.selectedRow(inComponent: 1)
        let ip3 = pickerView.selectedRow(inComponent: 2)
        let ip4 = pickerView.selectedRow(inComponent: 3)
        selectIPClosure?(options[Int(Float(ip1).truncatingRemainder(dividingBy: Float(options.count)))],options[Int(Float(ip2).truncatingRemainder(dividingBy: Float(options.count)))],options[Int(Float(ip3).truncatingRemainder(dividingBy: Float(options.count)))],options[Int(Float(ip4).truncatingRemainder(dividingBy: Float(options.count)))])
        view.removeFromSuperview()
        removeFromParent()
    }
    
    @objc func removePickerController() {
        view.removeFromSuperview()
        removeFromParent()
    }
    
}

extension PDSelectPickerViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    //几组
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    //每组的个数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return options.count * 50
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kScreenWidth / 4
    }
    
    //每行高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30.0
    }
    
    //每组的数据
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[Int(Float(row).truncatingRemainder(dividingBy: Float(options.count)))]
    }
}
