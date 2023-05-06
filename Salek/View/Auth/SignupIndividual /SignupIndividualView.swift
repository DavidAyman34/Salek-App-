//
//  SignupIndividualVIew.swift
//  Salek
//
//  Created by Divo Ayman on 4/26/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class SignupIndividualView: UIView {
        //MARK:- outlets Views
       @IBOutlet weak var scrollView: UIScrollView!
       @IBOutlet weak var contentView: UIView!
       @IBOutlet weak var informationView: UIView!
       @IBOutlet weak var checkAgreeView: UIView!
       
       //MARK:- outlets ImageView
       @IBOutlet weak var employeeImage: UIImageView!
       @IBOutlet weak var adressIcon: UIImageView!
       @IBOutlet weak var informationIcon: UIImageView!
 
       
       //MARK:- outlets TextField
       
       @IBOutlet weak var nameTextField: MDCOutlinedTextField!
        @IBOutlet weak var mobileTextField: MDCOutlinedTextField!
       @IBOutlet weak var emailTextField: MDCOutlinedTextField!
       @IBOutlet weak var passTextField: MDCOutlinedTextField!
       @IBOutlet weak var codeTextField: MDCOutlinedTextField!
       @IBOutlet weak var detileAddressTextField: MDCOutlinedTextField!
       @IBOutlet weak var addressTextField: MDCOutlinedTextField!
       @IBOutlet weak var confirmPassTextFied: MDCOutlinedTextField!
       
       //MARK:- outlets Label
       @IBOutlet weak var addressLabel: UILabel!
       @IBOutlet weak var informationLabel: UILabel!
       @IBOutlet weak var referredLabel: UILabel!
       @IBOutlet weak var referrerCodeLabel: UILabel!
       @IBOutlet weak var agreeLabel: UILabel!
       
       //MARK:- outlets Button
       @IBOutlet weak var nextBtn: UIButton!
       @IBOutlet weak var termsBtn: UIButton!
       @IBOutlet weak var employeeBtn: UIButton!
    @IBOutlet weak var agreeBtn: UIButton!
    // MARK:- Public Methods
       func setup(){
           installTextField()
           setupNextBtn()
           setupTermsBtn()
           setupCheckViews()
           updateUI()
           setupLabels(label: informationLabel, text: L10n.informationLabel, font: FontFamily.Nunito.bold.font(size: 18), alignment: .center)
           setupLabels(label: addressLabel, text: L10n.addressesLabel, font: FontFamily.Nunito.bold.font(size: 18), alignment: .left)
           setupLabels(label: referredLabel, text: L10n.referredLabel, font: FontFamily.Nunito.bold.font(size: 18), alignment: .left)
           setupLabels(label: referrerCodeLabel, text: L10n.referredCodeLabel, font: FontFamily.Nunito.light.font(size: 14), alignment: .left)
          
           
           
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
           setupTextField(textField: detileAddressTextField, text: L10n.detailsTextField)
           setupTextField(textField: confirmPassTextFied, text: L10n.confirmPassTextField)
           setupTextField(textField: nameTextField, text: L10n.nameTextField)
           setupTextField(textField: mobileTextField, text: L10n.mobileTextField)
           setupTextField(textField: mobileTextField, text: L10n.mobileTextField)
           setupTextField(textField: addressTextField, text: L10n.addressTextField)
           setupTextField(textField: passTextField, text: L10n.passText)
           setupTextField(textField: codeTextField, text: L10n.codeTextField)
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
       private func setupLabels(label: UILabel, text: String, font: UIFont, alignment: NSTextAlignment ){
           label.text = text
           label.font =  font
           label.textColor = UIColor(named: ColorName.blue)
           label.textAlignment = alignment
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
           contentView.backgroundColor = .white
           informationView.backgroundColor = .white
           informationIcon.image = Asset.individualInformation.image
           adressIcon.image = Asset.individualAddress.image
           employeeImage.layer.cornerRadius =  employeeImage.frame.size.width/2
           
      
           
       }
  

}
