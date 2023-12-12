//
//  PDBaseViewController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import Then
import SnapKit
import Reusable

class PDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = kRGBACOLOR(r: 242, g: 242, b: 242, a: 1)
        configNavigationBar()
        configUI()
        
    }
    
    func configUI() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.setBarStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "nav_return_btn"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(pressBack))
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension PDBaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}


fileprivate weak var AlertController: UIAlertController?

public extension UIViewController {
    
    func bk_presentAlertController(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style,
        actions: [UIAlertAction])
        -> Void
    {
        
        let closure = { () in
            let temp = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
            for action in actions {
                temp.addAction(action)
            }
            temp.popoverPresentationController?.sourceView = self.view
            temp.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: self.view.bounds.height/2, width: self.view.bounds.width, height: 1)
            self.present(temp, animated: true, completion: nil)
            AlertController = temp
        }
        if let alert = AlertController,
            let _ = alert.presentingViewController {
            alert.dismiss(animated: true, completion: closure)
        }else {
            closure()
        }
    }
    
    func bk_presentWarningAlertController(
        title: String,
        message: String,
        style: UIAlertAction.Style,
        closure: ((UIAlertAction) -> Void)? = nil)
        -> Void
    {
        
        let action = UIAlertAction.init(title: "OK".localized, style: style, handler: closure)
        bk_presentAlertController(title: title, message: message, preferredStyle: .alert, actions: [action])
    }
    
    func bk_presentDecisionAlertController(
        title: String?,
        message: String?,
        decisionTitle: String?,
        decisionClosure: @escaping (UIAlertAction) -> Void,
        cancelClosure: ((UIAlertAction) -> Void)? = nil)
        -> Void
    {
        
        let action1 = UIAlertAction.init(title: decisionTitle ?? "OK".localized, style: .default, handler: decisionClosure)
        let action2 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: cancelClosure)
        bk_presentAlertController(title: title, message: message, preferredStyle: .alert, actions: [action1, action2])
    }
    
    func presentInputAlertController(msg: String, inputDesc: String, closure: @escaping ((String) -> Void)) -> Void {
        
        let temp = UIAlertController(title: "Tips".localized, message: msg, preferredStyle: .alert)
        temp.addTextField {
            $0.placeholder = inputDesc
            $0.keyboardType = .numberPad
        }
        let confirm = UIAlertAction(title: "OK".localized, style: .default) { [weak temp] (_) in
            
            guard let textField = temp?.textFields?[0] else { return }
            guard let text = textField.text, !text.isEmpty else { return }
            closure(text)
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        temp.addAction(confirm)
        temp.addAction(cancel)
        present(temp, animated: true, completion: nil)
    }
}


