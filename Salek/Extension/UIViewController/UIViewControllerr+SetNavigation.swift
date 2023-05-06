//
//  UIViewControllerr+SetNavigation.swift
//  Salek
//
//  Created by Divo Ayman on 4/14/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
extension UIViewController {
    func setupNavigation(view: UIViewController, settingAcion: Selector?, backAcion: Selector?, title: String,barColor: UIColor){
    let window = UIApplication.shared.windows[0]
    let topPadding = window.safeAreaInsets.top
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding , width: view.view.frame.size.width, height: 47))
    
    view.view.addSubview(navBar)
    let navItem = UINavigationItem(title: title) //⟵
    navBar.barTintColor =  barColor
// navItem.rightBarButtonItem = UIBarButtonItem(image: Asset.settings.image, style: .done, target: view,  action: settingAcion)
 navItem.leftBarButtonItem = UIBarButtonItem(image: Asset.back2.image, style: .done, target: view,  action: backAcion)

       
    navItem.leftBarButtonItem?.tintColor =  UIColor(named: ColorName.blue)
    navItem.rightBarButtonItem?.tintColor = UIColor(named: ColorName.blue)
    navBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor(named: ColorName.blue),
         NSAttributedString.Key.font: FontFamily.Nunito.bold.font(size: 18)!]
    
    
    navBar.setItems([navItem], animated: false)
    
    
}

    

 
}
