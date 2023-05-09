//
//  AppDelegate.swift
//  Salek
//
//  Created by Divo Ayman on 4/10/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import MOLH

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MOLH.shared.activate(true)
        switchToSigninState()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //        MOLH.setLanguageTo("ar")
        
        return true
        
    }
    
    func switchToSigninState() {
        let signIn = SigninVC.create()
        let navigationController = UINavigationController(rootViewController: signIn)
        self.window?.rootViewController = navigationController
    }
    
    
    func reset() {
        let window = getWindow()
        
        let signIn = SigninVC.create()
        let navigationController = UINavigationController(rootViewController: signIn)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    
    
    func getWindow() -> UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
   
}
