//
//  PDPickerView.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit

typealias PDSelectContextClosure = (_ selectedItem:String) -> Void

class PDPickerView: UIView {

    lazy var pickerView: UIPickerView = {
        let temp = UIPickerView.init()
        temp.backgroundColor = UIColor.white
        temp.delegate = self
        temp.dataSource = self
        return temp
    }()
    
    var toolBar = UIToolbar()
    var options = [String]()
    var selectItemClosure : PDSelectContextClosure?
    
    init(with options:[String]) {
        
        super.init(frame: PDAppWindow.bounds)
        self.options = options
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        configUI()
        configToolBar()
    }
    
    func configUI()  {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        pickerView.frame = CGRect.init(x: 0, y: kScreenHeight - 180, width: kScreenWidth, height: 180)
        self.addSubview(pickerView)
        
        toolBar.frame = CGRect.init(x: 0, y: kScreenHeight - 180 - 44, width: kScreenWidth, height: 44)
        self.addSubview(toolBar)
    }
    
    private func configToolBar() {
        let fixedSpace = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 15
        let cancelItem = UIBarButtonItem.init(title: "Cancel".localized, style: .done, target: self, action: #selector(PDPickerView.dismiss))
        let space = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let pickItem = UIBarButtonItem.init(title: "OK".localized, style: .done, target: self, action: #selector(PDPickerView.pickItemAction))
        toolBar.items = [fixedSpace,cancelItem,space,pickItem,fixedSpace]
    }
    
    @objc func pickItemAction() {
        if options.count > pickerView.selectedRow(inComponent: 0) {
            selectItemClosure!(options[pickerView.selectedRow(inComponent: 0)])
        }
        self.removeFromSuperview()
    }
    
    @objc func dismiss() {
        self.removeFromSuperview()
    }
    
}

extension PDPickerView : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //        print(options[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        for subview in pickerView.subviews {
            if subview.frame.size.height < 1 {
                subview.backgroundColor = UIColor.lightGray
            }
        }
        
        var pickLabel = view as? UILabel
        
        if pickLabel == nil {
            pickLabel = UILabel.init()
            pickLabel?.font = UIFont.systemFont(ofSize: 25)
            pickLabel?.textAlignment = .center
            pickLabel?.backgroundColor = UIColor.white
        }
        
        pickLabel?.text = options[row]
        pickLabel?.textColor = UIColor.black
        
        return pickLabel!
    }
    
}
