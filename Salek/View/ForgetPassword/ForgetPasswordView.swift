//
//  ForgetPasswordView.swift
//  Salek
//
//  Created by Divo Ayman on 4/21/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class ForgetPasswordView: UIView {
    
    //MARK:- outlets
    @IBOutlet weak var salekImage: UIImageView!
    @IBOutlet weak var forgetImg: UIImageView!
    @IBOutlet weak var emailorPhoneTextField: MDCOutlinedTextField!
    @IBOutlet weak var forgetPassLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    // MARK:- Public Methods
    func setup(){
        setupLabels(label: forgetPassLabel, text: L10n.forgatPassLabel, font: FontFamily.Nunito.light.font(size: 16), color: UIColor(named: ColorName.blue))

        setupLabels(label: enterEmailLabel, text: L10n.enterEmailLabel, font: FontFamily.Nunito.light.font(size: 16), color: UIColor(named: ColorName.blue))
        setupTextField(textField: emailorPhoneTextField, text: L10n.emailTextField)
         setupNextBtn()
        setupImage()

    }
    
    // MARK:- Private Methods
    private func setupImage(){
        forgetImg.image = Asset.forgatePass.image
        salekImage.image = Asset.component251.image
        
    }
    private func setupNextBtn(){
          nextBtn.setTitle(L10n.nextBtn, for: .normal)
          nextBtn.backgroundColor = UIColor(named: ColorName.green)
          nextBtn.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
          nextBtn.layer.cornerRadius = 20
          nextBtn.tintColor = .white
      }
 private func setupTextField(textField: MDCOutlinedTextField,text: String){
        textField.textColor = UIColor(named: ColorName.blue)
        textField.label.text = text
        textField.setOutlineColor(UIColor(named: ColorName.blue), for: .editing)
        textField.containerRadius = 20
        textField.textAlignment = .left
        textField.setFloatingLabelColor(UIColor(named: ColorName.blue), for: .editing)
        textField.setFloatingLabelColor(UIColor(named: ColorName.blue), for: .normal)
        textField.setTextColor(UIColor(named: ColorName.blue), for: .editing)
        textField.setTextColor(UIColor(named: ColorName.blue), for: .normal)
        textField.setOutlineColor(UIColor(named: ColorName.blue), for: .normal)
        textField.font = UIFont(font: FontFamily.Nunito.light, size: 13)
        textField.setNormalLabelColor(UIColor(named: ColorName.blue), for: .normal)
        textField.normalLabelColor(for: .normal)
        textField.setLeftPaddingPoints(0)
        
    }
    
    private func setupLabels(label: UILabel, text: String, font: UIFont, color: UIColor){
        label.text = text
        label.font =  font
        label.textColor = color
        label.textAlignment = .center
    }


}
