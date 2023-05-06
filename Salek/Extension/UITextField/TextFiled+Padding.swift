//
//  UIViewController+TextField.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/11/20.
//

import UIKit
extension UITextField {
    
 

   

//    func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//       return bounds.inset(by: padding)
//   }
//
//    func editingRect(forBounds bounds: CGRect) -> CGRect {
//       return bounds.inset(by: padding)
//   }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount.binade, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setUpPaddingPoints(_ amount:CGFloat){
          let paddingView = UIView(frame: CGRect(x: 0, y: 20, width:self.frame.size.width , height: amount ))
          self.leftView = paddingView
          self.leftViewMode = .always
      }
//      func setDownPaddingPoints(_ amount:CGFloat) {
//          let paddingView = UIView(frame: CGRect(x: 0, y: 20, width: amount, height: self.frame.size.height))
//          self.rightView = paddingView
//          self.rightViewMode = .always
//      }
}

