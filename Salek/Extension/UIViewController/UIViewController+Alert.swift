//
//  UIViewController+Alert.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

extension UIViewController {
// MARK:- Public Alert Method
    func showAlert(title: String,massage: String, present : UIViewController,titleBtn: String){
        let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title:titleBtn, style: .default, handler: nil))
        
        present.self.present(alertError, animated: true)
    }
    
    func showAlert(title: String,massage: String, present : UIViewController,titleBtn: String, completion: @escaping()->Void){
        let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: titleBtn, style: .default, handler: { action in
            completion()
        }))
      
        alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present.self.present(alertError, animated: true)
    }
    
}
