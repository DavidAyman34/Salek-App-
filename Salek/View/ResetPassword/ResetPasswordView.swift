//
//  ResetPasswordView.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class ResetPasswordView: UIView {
    //MARK:- outlets
    @IBOutlet weak var salekImage: UIImageView!
    @IBOutlet weak var resetImg: UIImageView!
    @IBOutlet weak var passTextField: MDCOutlinedTextField!
    @IBOutlet weak var confirmPassTextField: MDCOutlinedTextField!
    @IBOutlet weak var resetPassLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    // MARK:- Public Methods
    func setup(){
        setupLabels(label: resetPassLabel, text: L10n.resetPassLabel, font: FontFamily.Nunito.bold.font(size: 18), color: UIColor(named: ColorName.blue), alignment: .center)
        
        setupTextField(textField: passTextField, text: L10n.resetPassTextField)
        setupTextField(textField: confirmPassTextField, text: L10n.confirmPassTextField)
        setupResetBtn()
        setupImage()
    }
    
    // MARK:- Private Methods
    private func setupImage(){
        resetImg.image = Asset.resetPass.image
        salekImage.image = Asset.component251.image
        
    }
    private func setupResetBtn(){
        resetBtn.setTitle(L10n.resetBtn, for: .normal)
        resetBtn.backgroundColor = UIColor(named: ColorName.green)
        resetBtn.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
        resetBtn.layer.cornerRadius = 20
        resetBtn.tintColor = .white
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
    private func setupLabels(label: UILabel, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment ){
        label.text = text
        label.font =  font
        label.textColor = color
        label.textAlignment = alignment
    }
    
}

