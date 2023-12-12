//
//  PDBaseNavigationController.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit

class PDBaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let interactionGes = interactivePopGestureRecognizer else { return }
        guard let targetView = interactionGes.view else { return }
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else { return }
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else { return }
        let action = Selector(("handleNavigationTransition:"))
        
        let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGesture.delegate = self
        targetView.addGestureRecognizer(fullScreenGesture)
        interactionGes.isEnabled = false
    }
}

extension PDBaseNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else { return true }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
            || disablePopGesture {
            return false
        }
        return viewControllers.count != 1;
    }
}

extension PDBaseNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
}

enum PDNavigationBarStyle {
    case theme
}

extension UINavigationController {
    
    private struct AssociatedKeys {
        static var disablePopGesture:Void?
    }
    
    var disablePopGesture : Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setBarStyle(_ style:PDNavigationBarStyle) -> Void {
        switch style {
            case .theme:
                if #available(iOS 13, *) {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundImage = UIColor.theme.image()
                    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                    appearance.shadowImage = UIImage()
                    navigationBar.standardAppearance = appearance
                    navigationBar.scrollEdgeAppearance = appearance
                    navigationBar.isTranslucent = false
                    navigationBar.barStyle = .black
                    navigationBar.tintColor = .white
                }else {
                    navigationBar.isTranslucent = false
                    navigationBar.barStyle = .black
                    navigationBar.tintColor = .white
                    navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                    navigationBar.setBackgroundImage(UIColor.theme.image(), for: .default)
                    navigationBar.shadowImage = UIImage()
                }
        }
    }
}
