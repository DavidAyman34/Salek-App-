//
//  ResetPasswordVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    
    @IBOutlet var resetView: ResetPasswordView!
     var iconClick = true
  
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView.setup()
        iconClick = true
    }
    
    // MARK:- Private Methods
    private func eyeControl(textField: UITextField) {
        if(iconClick == true) {
            textField.isSecureTextEntry = false
            //SigninView.showPssBtn.setImage(UIImage(named: "eye"), for: .normal)
            
        } else {
            textField.isSecureTextEntry = true
            //eyeDesign.setImage(UIImage(named: "closedeye"), for: .normal)
        }
        
        iconClick = !(iconClick)
    }
    @IBAction func showConfirmPassTapped(_ sender: UIButton) {
        eyeControl(textField: resetView.confirmPassTextField)
    }
    @IBAction func showPassTapped(_ sender: UIButton) {
        eyeControl(textField: resetView.passTextField)
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        print("pass is reseted")
      
    }
    
     // MARK:- Public Methods
       class func create() -> ResetPasswordVC {
           let resetPasswordVC: ResetPasswordVC = UIViewController.create(storyboardName: Storyboards.resetPassword, identifier: ViewControllers.resetPasswordVC)
           
           return resetPasswordVC
       }

}
