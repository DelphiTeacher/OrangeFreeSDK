//
//  AppDelegate.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import PrinterSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let vc = PDMainViewController.init()
        let nvc = PDBaseNavigationController.init(rootViewController: vc)
        window?.rootViewController = nvc
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        window?.makeKeyAndVisible()
        
        //default 576 width
        kUserDefaults.set(576, forKey: PDPrintDots)
                
        /// true is write log
        PTLog.shareInstance().isWrite = true
        
        configSVProgressHUD()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
    func configSVProgressHUD() {
        SVProgressHUD.setMaximumDismissTimeInterval(2)
        SVProgressHUD.setMinimumDismissTimeInterval(2)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setShouldTintImages(false)
        if let image = UIImage(named: "icon_hud_success") {
            SVProgressHUD.setSuccessImage(image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
            SVProgressHUD.setImageViewSize(image.size)
        }
        if let image = UIImage(named: "icon_hud_info") {
            SVProgressHUD.setInfoImage(image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        }
        if let image = UIImage(named: "icon_hud_error") {
            SVProgressHUD.setErrorImage(image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        }
    }
}

