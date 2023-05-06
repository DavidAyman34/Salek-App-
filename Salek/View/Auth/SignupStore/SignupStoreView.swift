//
//  SignupStoreView.swift
//  Salek
//
//  Created by Divo Ayman on 4/13/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class SignupStoreView: UIView {
    
    //MARK:- outlets Label
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var detalisLabel: UILabel!
    @IBOutlet weak var agreeLabel: UILabel!
    
    //MARK:- outlets ImageView
    @IBOutlet weak var addressImg: UIImageView!
    @IBOutlet weak var detailsImg: UIImageView!
    @IBOutlet weak var infoImg: UIImageView!
    @IBOutlet weak var storeImg: UIImageView!
    
    //MARK:- outlets Button
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var logoBtn: UIButton!
    @IBOutlet weak var agreeBtn: UIButton!
    
    //MARK:- outlets TextField
    @IBOutlet weak var detailsTextField: MDCOutlinedTextField!
    @IBOutlet weak var confirmPassTextField: MDCOutlinedTextField!
    @IBOutlet weak var passTextField: MDCOutlinedTextField!
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var nameTextField: MDCOutlinedTextField!
    @IBOutlet weak var storeTypeTextField: MDCOutlinedTextField!
    @IBOutlet weak var hotlineTextField: MDCOutlinedTextField!
    @IBOutlet weak var landlineTextField: MDCOutlinedTextField!
    @IBOutlet weak var mobileTextField: MDCOutlinedTextField!
    @IBOutlet weak var detailAddressTextField: MDCOutlinedTextField!
    @IBOutlet weak var addressTextField: MDCOutlinedTextField!
    
    //MARK:- outlets Views
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var checkAgreeView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK:- Public Methods
    func setup(){
        installTextField()
        updateUI()
        setupNextBtn()
        setupCheckViews()
        setupTermsBtn()
        setupLabels(label: infoLabel, text: L10n.infoLabel)
        setupLabels(label: addressLabel, text: L10n.addressLabel)
        setupLabels(label: detalisLabel, text: L10n.detailsLabel)
    }
     func setupCheckViews(){
           checkAgreeView.backgroundColor = .clear
           //anotherCheck.backgroundColor = .clear
           checkAgreeView.layer.borderColor = UIColor(named: ColorName.green).cgColor
           checkAgreeView.layer.borderWidth = 2
           checkAgreeView.layer.borderWidth = 2
           checkAgreeView.layer.borderColor = UIColor(named: ColorName.green).cgColor
       }
    // MARK:- Private Methods
     func installTextField(){
        setupTextField(textField: emailTextField, text: L10n.emailText)
        setupTextField(textField: passTextField, text: L10n.passText)
        setupTextField(textField: detailsTextField, text: L10n.detailsTextField)
        setupTextField(textField: confirmPassTextField, text: L10n.confirmPassTextField)
        setupTextField(textField: nameTextField, text: L10n.nameTextField)
        setupTextField(textField: storeTypeTextField, text: L10n.storeTypeTextField)
        setupTextField(textField: hotlineTextField, text: L10n.hotlineTextField)
        setupTextField(textField: landlineTextField, text: L10n.landlineTextField)
        setupTextField(textField: mobileTextField, text: L10n.mobileTextField)
        setupTextField(textField: detailAddressTextField, text: L10n.detailAddressTextField)
        setupTextField(textField: addressTextField, text: L10n.addressTextField)
        setupTextField(textField: passTextField, text: L10n.passText)
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
//    private func setupTextField(textField: DTTextField,text: String){
//        textField.layer.cornerRadius = 20
//        textField.layer.borderWidth = 0.8
//        textField.textAlignment = .natural
//        textField.dtborderStyle  = .sqare
//        textField.canShowBorder = false
//        textField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
//        textField.floatPlaceholderActiveColor = UIColor(named: ColorName.blue)
//        textField.placeholderColor = .red
//        textField.textColor = UIColor(named: ColorName.blue)
//        textField.floatPlaceholderColor = UIColor(named: ColorName.blue)
//        textField.font = UIFont(font: FontFamily.Nunito.regular, size: 14)
//        textField.floatPlaceholderFont = UIFont(font: FontFamily.Nunito.regular, size: 14)!
//        textField.setLeftPaddingPoints(-22)
//        textField.setRightPaddingPoints(-22)
//        textField.paddingYFloatLabel = -17
//        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: ColorName.blue)])
//
//
//    }
//
    private func setupLabels(label: UILabel, text: String){
        label.text = text
        label.font =  FontFamily.Nunito.bold.font(size: 18)
        label.textColor = UIColor(named: ColorName.blue)
        
    }
    private func setupTermsBtn(){
        agreeLabel.text = L10n.agreeLabel
        agreeLabel.textColor = UIColor(named: ColorName.blue)
        agreeLabel.font = FontFamily.Nunito.light.font(size: 14)
        termsBtn.setTitle(L10n.termsBtn, for: .normal)
        //        termsBtn.tintColor = UIColor(named: ColorName.blue)
        termsBtn.titleLabel?.font = FontFamily.Nunito.regular.font(size: 14)
    }
    
 
    
    private func setupNextBtn(){
        nextBtn.setTitle(L10n.createBtn, for: .normal)
        nextBtn.backgroundColor = UIColor(named: ColorName.green)
        nextBtn.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
        nextBtn.layer.cornerRadius = 20
        nextBtn.tintColor = .white
    }
    private func updateUI(){
        scrollView.backgroundColor = .white
        addressView.backgroundColor = .white
        infoView.backgroundColor = .white
        contentView.backgroundColor = .white
        infoImg.image = Asset.store.image
        addressImg.image = Asset.address1.image
        detailsImg.image = Asset.details.image
        storeImg.layer.cornerRadius =  storeImg.frame.size.width/2
       
        
    }
}
