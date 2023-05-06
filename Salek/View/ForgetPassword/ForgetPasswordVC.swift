//
//  ForgetPasswordVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/21/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

// MARK:- Protocol Methods
protocol ForgetPasswordProtocols: class{
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    func goToVerificationCode()
}
class ForgetPasswordVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var forgetPasswordView: ForgetPasswordView!
    // MARK: - Properties
    private var viewModel: ForgetPasswordViewModelProtocols!
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        forgetPasswordView.setup()
    }
    
    
    // MARK:- Button Methods
    @IBAction func nextTapped(_ sender: Any) {
        viewModel.tryToSendEmail(email: forgetPasswordView.emailorPhoneTextField.text!)
    }
    // MARK:- Public Methods
    class func create() -> ForgetPasswordVC {
        let forgetPasswordVC: ForgetPasswordVC = UIViewController.create(storyboardName: Storyboards.forgetPassword, identifier: ViewControllers.forgetPassword)
        forgetPasswordVC.viewModel =  ForgetPasswordViewModel(view: forgetPasswordVC)
        return forgetPasswordVC
    }
    
    
}
// MARK: - Implement Protocols
extension ForgetPasswordVC: ForgetPasswordProtocols{
    func goToVerificationCode() {
     let verificationCodeVC = VerificationCodeVC.create()
              verificationCodeVC.modalPresentationStyle = .fullScreen
              verificationCodeVC.modalTransitionStyle = .crossDissolve
              self.present(verificationCodeVC, animated: true, completion: nil)
    }
    
    func showError(title: String, massage: String) {
        self.showAlert(title: title, massage: massage, present: self, titleBtn: "ok")
    }
    
    func check() -> Bool {
        guard  let name = forgetPasswordView.emailorPhoneTextField.text,
            !name.isEmpty
            
            
            else {return false}
        return true
    }
    func Empty() {
        switch  check() {
        case !forgetPasswordView.emailorPhoneTextField.text!.isEmpty:
           forgetPasswordView.emailorPhoneTextField.layer.borderColor  = UIColor.red.cgColor
//            self.showAlert(title: "Email", massage: "Please write Email", present: self, titleBtn: "ok")
            

        default:
            print("error")
            
        }
    }
}
