//
//  VerificationCodeView'.swift
//  Salek
//
//  Created by Divo Ayman on 4/21/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import SGCodeTextField
class VerificationCodeView_: UIView {
    
    //MARK:- outlets
    @IBOutlet weak var salekImage: UIImageView!
    @IBOutlet weak var codeImg: UIImageView!
    @IBOutlet weak var VerificationCodeTextField: SGCodeTextField!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var otpTimer: UILabel!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var otpTimerBtn: UIButton!
    var min = 300
    var timer = Timer()
    var isTimerRunning = false
    // MARK:- Public Methods
    func setup(){
        setupImage()
        setupVerifyBtn()
        setupLabels(label: codeLabel, text: L10n.codeLabel, font: FontFamily.Nunito.semiBold.font(size: 24), color: UIColor(named: ColorName.blue), alignment: .center)
        setupLabels(label: otpLabel, text: L10n.otpLabe, font: FontFamily.Nunito.light.font(size: 15), color: UIColor(named: ColorName.blue), alignment: .center)
        setupLabels(label: otpTimer, text: L10n.otpTimer, font: FontFamily.Nunito.light.font(size: 16), color: UIColor(named: ColorName.blue), alignment: .left)
        setupOtpTimerBtn()
        setupTextfieldCode()
    }
    func setupResendBtn(){
        otpTimerBtn.setTitle(L10n.resendBtn, for: .normal)
        otpTimerBtn.setTitleColor(UIColor(named: ColorName.blue), for: .normal)
        otpTimerBtn.titleLabel?.font = FontFamily.Nunito.light.font(size: 16)
        otpTimerBtn.tintColor = .white
        otpTimerBtn.isEnabled = true
    }
    // MARK:- Private Methods
    private func setupImage(){
        codeImg.image = Asset.codeImge.image
        salekImage.image = Asset.component251.image
        
    }
    private func setupVerifyBtn(){
        verifyBtn.setTitle(L10n.verifyBtn, for: .normal)
        verifyBtn.backgroundColor = UIColor(named: ColorName.green)
        verifyBtn.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
        verifyBtn.layer.cornerRadius = 20
        verifyBtn.tintColor = .white
    }
    private func setupOtpTimerBtn(){
        otpTimerBtn.setTitle(L10n.otpTimerLabel, for: .normal)
      otpTimerBtn.setTitleColor(UIColor(named: ColorName.blue), for: .normal)
        otpTimerBtn.titleLabel?.font = FontFamily.Nunito.light.font(size: 16)
        otpTimerBtn.tintColor = .white
        otpTimerBtn.isEnabled = false
    }
    private func setupTextfieldCode(){
        VerificationCodeTextField.digitBorderWidth = 1
        VerificationCodeTextField.digitCornerRadius = 3
        VerificationCodeTextField.digitBackgroundColor = .clear
        VerificationCodeTextField.digitBorderColorEmpty = UIColor(named: ColorName.lightBlue)
        VerificationCodeTextField.digitBorderColor = UIColor(named: ColorName.lightBlue)
        VerificationCodeTextField.digitSpacing = 20
        VerificationCodeTextField.frame.size.height = 38
        VerificationCodeTextField.digitBackgroundColorFocused = .clear
        
    }
    private func setupLabels(label: UILabel, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment ){
        label.text = text
        label.font =  font
        label.textColor = color
        label.textAlignment = alignment
    }
    
    
}
