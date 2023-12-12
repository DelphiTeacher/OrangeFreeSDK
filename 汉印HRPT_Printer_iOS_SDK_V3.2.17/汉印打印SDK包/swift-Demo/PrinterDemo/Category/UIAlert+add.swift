//
//  UIAlert+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/9.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    /** 确定有回调 */
    static func showActionAlert(_ title:String, message:String, confirm:String, confirmHandle:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        let confirm = UIAlertAction.init(title: confirm, style: .default, handler: confirmHandle)
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        alert.popoverPresentationController?.sourceView = rootVC.view
        alert.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        
        rootVC.present(alert, animated: true, completion: nil)
    }
    
    /** 确定和取消有回调 */
    static func showActionAlert(_ title:String, message:String, confirm:String, cancelHandle:((UIAlertAction) -> Void)?,confirmHandle:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: cancelHandle)
        let confirm = UIAlertAction.init(title: confirm, style: .default, handler: confirmHandle)
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        alert.popoverPresentationController?.sourceView = rootVC.view
        alert.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        
        rootVC.present(alert, animated: true, completion: nil)
    }
    
    /** 只有确定 */
    static func showConfirmView(_ title:String, message:String, confirmHandle:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction.init(title: "OK".localized, style: .default, handler: confirmHandle)
        alert.addAction(confirm)
        
        alert.popoverPresentationController?.sourceView = rootVC.view
        alert.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        
        rootVC.present(alert, animated: true, completion: nil)
    }
    
    static func showLogoActionSheet(with title:String, actionStr1:String, actionStr2:String, actionStr3:String, actionStr4:String, actionStr5:String, actionStr6:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?, actionHandle3:((UIAlertAction) -> Void)?, actionHandle4:((UIAlertAction) -> Void)?,actionHandle5:((UIAlertAction) -> Void)?, actionHandle6:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action3 = UIAlertAction.init(title: actionStr3, style: .default, handler: actionHandle3)
        let action4 = UIAlertAction.init(title: actionStr4, style: .default, handler: actionHandle4)
        let action5 = UIAlertAction.init(title: actionStr5, style: .default, handler: actionHandle5)
        let action6 = UIAlertAction.init(title: actionStr6, style: .default, handler: actionHandle6)
        let action7 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        sheet.addAction(action5)
        sheet.addAction(action6)
        sheet.addAction(action7)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
        
    }
    
    /** 4个action1 */
    static func showMostActionSheet(with title:String, actionStr1:String, actionStr2:String, actionStr3:String, actionClose:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?, actionHandle3:((UIAlertAction) -> Void)?, actionHandle4:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action3 = UIAlertAction.init(title: actionStr3, style: .default, handler: actionHandle3)
        let action4 = UIAlertAction.init(title: actionClose, style: .default, handler: actionHandle4)
        let action5 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        sheet.addAction(action5)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
        
    }
    
    /** 4个action2 */
    static func showDestructiveActionSheet(with title:String, actionStr1:String, actionStr2:String, actionStr3:String, actionClose:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?, actionHandle3:((UIAlertAction) -> Void)?, actionHandle4:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action3 = UIAlertAction.init(title: actionStr3, style: .default, handler: actionHandle3)
        let action4 = UIAlertAction.init(title: actionClose, style: .destructive, handler: actionHandle4)
        let action5 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        sheet.addAction(action5)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
        
    }
    
    /** 3个action2 */
    static func showMiddleDestructiveActionSheet(with title:String, actionStr1:String, actionStr2:String, actionClose:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?, actionHandle4:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action4 = UIAlertAction.init(title: actionClose, style: .destructive, handler: actionHandle4)
        let action5 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action4)
        sheet.addAction(action5)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
        
    }
    
    /** 3个action*/
    static func showMiddleActionSheet(with title:String, actionStr1:String, actionStr2:String, actionStr3:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?, actionHandle3:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController  else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .alert)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action3 = UIAlertAction.init(title: actionStr3, style: .default, handler: actionHandle3)
        let action4 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.addAction(action4)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
        
    }
    
    /** 2个action*/
    static func showLessActionSheet(with title:String, actionStr1:String, actionStr2:String, actionHandle1:((UIAlertAction) -> Void)?, actionHandle2:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr1, style: .default, handler: actionHandle1)
        let action2 = UIAlertAction.init(title: actionStr2, style: .default, handler: actionHandle2)
        let action3 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.addAction(action3)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
    }
    
    
    static func showSingleActionSheet(with title:String, actionStr:String, actionHandle:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let sheet = UIAlertController.init(title: title, message:nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction.init(title: actionStr, style: .default, handler: actionHandle)
        let action2 = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        
        sheet.addAction(action1)
        sheet.addAction(action2)
        sheet.popoverPresentationController?.sourceView = rootVC.view
        sheet.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(sheet, animated: true, completion: nil)
    }
    
    static func showInputActionAlert(with title:String, message:String, placeholder:String, confirmHandle:((UIAlertAction) -> Void)?) {
        
        guard let rootVC = PDAppWindow.rootViewController else { return }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
        }
        let cancel = UIAlertAction.init(title: "Cancel".localized, style: .cancel, handler: nil)
        let confirm = UIAlertAction.init(title: "Application".localized, style: .default, handler: confirmHandle)
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        alert.popoverPresentationController?.sourceView = rootVC.view
        alert.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: rootVC.view.height - 1, width: rootVC.view.width, height: 1)
        rootVC.present(alert, animated: true, completion: nil)
        
    }
    
}
