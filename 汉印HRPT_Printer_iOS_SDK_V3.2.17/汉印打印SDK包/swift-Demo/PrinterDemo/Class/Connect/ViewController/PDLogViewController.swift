//
//  PDLogViewController.swift
//  PrinterDemo
//
//  Created by ios on 2021/11/13.
//  Copyright © 2021 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK
import SVProgressHUD

class PDLogViewController: PDBaseViewController {

    lazy var textView : UITextView = {
        let temp = UITextView.init()
        temp.text = ""
        temp.font = UIFont.systemFont(ofSize: 15)
        temp.textColor = UIColor.black
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 10
        temp.layer.borderColor = UIColor.theme.cgColor
        temp.layer.borderWidth = 0.5
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Log"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Copy", style: UIBarButtonItem.Style.plain, target: self, action: #selector(copyAllText))
        
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.left.equalTo(15)
            $0.top.equalTo(30)
            $0.width.equalTo(kScreenWidth - 30)
            $0.bottom.equalTo(-kSafeAreaBottomHeight - 30)
        }
        
        textView.text = PTLog.shareInstance().readFile()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension PDLogViewController {
    
    @objc private func copyAllText() {
        let paste = UIPasteboard.general
        paste.string = textView.text
        SVProgressHUD.showSuccess(withStatus: "Copy Success")
    }
}
