//
//  SignInView.swift
//  Salek
//
//  Created by Divo Ayman on 4/11/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignInView: UIView {
    
    //MARK:- outlets
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var emailTextFeild: MDCOutlinedTextField!
    @IBOutlet weak var passwordTextfield: MDCOutlinedTextField!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var forgetPassbtn: UIButton!
    @IBOutlet weak var languageBtn: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var showPssBtn: UIButton!
    
    //MARK:- outlets Views
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var contentView: UIView!
    
  
    // MARK:- Public Methods
    func setup(view:UIView){
        setupForgetPass()
        setupSignInBtn()
        setupLineView()
        setupSkipBtn()
        setupCreateBtn()
        setupLanguageBtn()
        setupinfoBtn()
        setupLabel(label: orLabel, color: UIColor(named: ColorName.blue), title: L10n.orLabel, size: 5)
    installTextField()
       
        
    }
  
    func installTextField(){
        setupTextField(textField: emailTextFeild, text: L10n.emailTextField)
            setupTextField(textField: passwordTextfield, text: L10n.passText)
    }
    // MARK:- Private Methods
        private func setupForgetPass(){
        forgetPassbtn.setTitle(L10n.forgetPass, for: .normal)
        forgetPassbtn.backgroundColor = .clear
        forgetPassbtn.titleLabel?.font = UIFont(font: FontFamily.Nunito.light, size: 16)
        forgetPassbtn.setTitleColor(UIColor(named: ColorName.blue), for: .normal)
        
    }
    private func setupinfoBtn(){
        infoBtn.setImage(Asset.component11.image, for: .normal)
        infoBtn.tintColor = UIColor(named: ColorName.blue)
        
    }
    private func setupLanguageBtn(){
        languageBtn.setTitle(L10n.languageBtn, for: .normal)
        languageBtn.backgroundColor = .clear
        languageBtn.titleLabel?.font = UIFont(font: FontFamily.Nunito.light, size: 16)
        languageBtn.setTitleColor(UIColor(named: ColorName.blue), for: .normal)
        
    }
    private func setupLineView(){
        
        view1.backgroundColor = UIColor(named: ColorName.lightnavy)
        view2.backgroundColor = UIColor(named: ColorName.lightnavy)
        view1.layer.borderWidth = 1
        view2.layer.borderWidth = 1
    }
    private func setupSignInBtn(){
        signinBtn.setTitle(L10n.signinBtn, for: .normal)
        signinBtn.setTitleColor(UIColor(named: ColorName.white), for: .normal)
        signinBtn.titleLabel?.textAlignment = .center
        signinBtn.titleLabel?.font = FontFamily.Nunito.semiBold.font(size: 22)
        signinBtn.layer.cornerRadius = signinBtn.frame.width/2
        signinBtn.titleLabel?.layer.shadowColor = UIColor.black.cgColor
                signinBtn.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 1)
                    signinBtn.titleLabel?.layer.shadowOpacity = 0.2
        
        signinBtn.backgroundColor = UIColor(named: ColorName.green)
    }
    func setupSkipBtn(){
        skipBtn.setTitle(L10n.skipBtn, for: .normal)
        skipBtn.titleLabel?.textAlignment = .center
        // skipBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        skipBtn.layer.cornerRadius = skipBtn.frame.width/2
        
        skipBtn.backgroundColor = UIColor(named: ColorName.green)
    }
    private func setupLabel(label: UILabel, color: UIColor, title: String, size: Int){
        label.text = title
        label.textColor = color
        label.font = FontFamily.Nunito.semiBold.font(size: 15)
    }
    
    private func setupCreateBtn(){
        createAccountBtn.setTitle(L10n.createAccountBtn, for: .normal)
        createAccountBtn.titleLabel?.textAlignment = .center
        createAccountBtn.setTitleColor(UIColor(named: ColorName.blue), for: .normal)
        createAccountBtn.titleLabel?.font = UIFont(font: FontFamily.Nunito.regular, size: 18)
        createAccountBtn.backgroundColor = .clear
        //        createAccountBtn.titleLabel?.layer.shadowColor = UIColor(named: ColorName.blue).cgColor
        //        createAccountBtn.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 1)
        //        createAccountBtn.titleLabel?.layer.shadowOpacity = 0.2
    }
    
    private func setupTextField(textField: MDCOutlinedTextField,text: String){
        textField.textColor = UIColor(named: ColorName.blue)
        textField.label.text = text
        textField.setOutlineColor(UIColor(named: ColorName.blue), for: .editing)
        textField.containerRadius = 20
        textField.textAlignment = .natural
        textField.setFloatingLabelColor(UIColor(named: ColorName.blue), for: .editing)
        textField.setFloatingLabelColor(UIColor(named: ColorName.blue), for: .normal)
        textField.setTextColor(UIColor(named: ColorName.blue), for: .editing)
        textField.setTextColor(UIColor(named: ColorName.blue), for: .normal)
        textField.setOutlineColor(UIColor(named: ColorName.blue), for: .normal)
        textField.font = UIFont(font: FontFamily.Nunito.light, size: 12)
        textField.setNormalLabelColor(UIColor(named: ColorName.blue), for: .normal)
        textField.normalLabelColor(for: .normal)
        textField.setLeftPaddingPoints(0)
        textField.label.sizeThatFits(.init(width: 20, height: 20)) //bounds.size.height = 20
        
        
    }
    
    
}
