//
//  UIViewController+Functions.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
