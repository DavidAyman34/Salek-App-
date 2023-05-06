//
//  Signin.swift
//  Salek
//
//  Created by Divo Ayman on 4/11/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MOLH

// MARK:- Protocol Methods
protocol SigninProtocols: class{
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    func goToChooseAccount()
}
class SigninVC: UIViewController,UITextFieldDelegate {
    
    // MARK: - Properties
    private var viewModel: SigninViewModelProtocols!
    var iconClick : Bool?
    var lang : String?
    
      
    // MARK:- Outlets
    @IBOutlet var SigninView: SignInView!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        SigninView.setup(view: view)
        self.navigationController?.navigationBar.isHidden = true
        SigninView.emailTextFeild.delegate = self
        SigninView.passwordTextfield.delegate = self
        iconClick = true
        lang = MOLHLanguage.currentAppleLanguage()
        
    
    }
    
    // MARK:- Private Methods
    
    private func eyeControl() {
        if(iconClick == true) {
            SigninView.passwordTextfield.isSecureTextEntry = false
            //SigninView.showPssBtn.setImage(UIImage(named: "eye"), for: .normal)
            
        } else {
            SigninView.passwordTextfield.isSecureTextEntry = true
            //eyeDesign.setImage(UIImage(named: "closedeye"), for: .normal)
        }
        
        iconClick = !(iconClick ?? false)
    }
    
    
    private func changeLanguage(){
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == Languages.english ? Languages.arabic : Languages.english)
        print(MOLHLanguage.currentAppleLanguage().description)
        
        MOLH.reset()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
        SigninView.installTextField()
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        SigninView.emailTextFeild.layer.borderColor = UIColor(named: ColorName.blue).cgColor
    }
    
    // MARK:- Button Methods
    @IBAction func showPassTapped(_ sender: UIButton) {
        eyeControl()
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        viewModel.tryToLogin(email: SigninView.emailTextFeild.text!, pass: SigninView.passwordTextfield.text!)
    }
    
    @IBAction func languageTapped(_ sender: UIButton) {
    
       changeLanguage()
       
    }
    @IBAction func createTapped(_ sender: UIButton) {
        goToChooseAccount()
    }
    
    @IBAction func forgetPassTapped(_ sender: UIButton) {
        let forgetVC = ForgetPasswordVC.create()
        self.navigationController?.pushViewController(forgetVC, animated: true)
    }
    
    
    // MARK:- Public Methods
    class func create() -> SigninVC {
        let signInVC: SigninVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.signInVC)
        signInVC.viewModel = SigninViewModel(view: signInVC)
        return signInVC
    }
}
// MARK: - Implement Protocols
extension SigninVC: SigninProtocols{
    func goToChooseAccount() {
        self.navigationController?.pushViewController(ChooseAccountVC.create(), animated: true)
    }
    
    func showError(title: String, massage: String) {
        self.showAlert(title: title, massage: massage, present: self, titleBtn: "ok")
    }
    
    func check() -> Bool {
        guard  let name = SigninView.emailTextFeild.text,
            !name.isEmpty,
            let choosePassoword = SigninView.passwordTextfield.text,!choosePassoword.isEmpty
            
            
            else {return false}
        return true
    }
    func Empty() {
        switch  check() {
        case !SigninView.emailTextFeild.text!.isEmpty:
            SigninView.emailTextFeild.normalLabelColor(for: .normal)
            SigninView.emailTextFeild.setOutlineColor(UIColor.red, for: .normal)
//            self.showAlert(title: "Email", massage: "Please write Email", present: self, titleBtn: "ok")
            
        case !SigninView.passwordTextfield.text!.isEmpty:
            SigninView.passwordTextfield.normalLabelColor(for: .normal)
            SigninView.passwordTextfield.setOutlineColor(UIColor.red, for: .normal)
//            self.showAlert(title: "Password", massage: "Please write Password", present: self, titleBtn: "ok")
        default:
            print("error")
            
        }
    }
}

