//
//  SignupIndividualVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/26/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
// MARK:- Protocols
protocol SignupIndividualProtocols: class{
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    
}
class SignupIndividualVC: UIViewController,UITextFieldDelegate{
    
    // MARK:- Outlets
    @IBOutlet var individualView: SignupIndividualView!
    
    // MARK: - Properties
    
    private var viewModel: SignupIndividualViewModelProtocols!
    var imagePicker = UIImagePickerController()
    var iconClick = true
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        individualView.setup()
        self.setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.signupIndividualNav, barColor: .white)
        navigationController?.navigationBar.isHidden = true
        delegateTextField()
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
        individualView.installTextField()
    }
    
    //MARK:- NavBarButtons
    @objc func settingBtnTapped(){
        let setting = SignupStoreVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Private Methods
    private func delegateTextField(){
        individualView.emailTextField.delegate = self
        individualView.passTextField.delegate = self
        individualView.addressTextField.delegate = self
        individualView.mobileTextField.delegate = self
        individualView.nameTextField.delegate = self
        individualView.confirmPassTextFied.delegate = self
        
        
    }
    private func switchEmpty(){
        switch  check() {
        case !individualView.emailTextField.text!.isEmpty:
            individualView.emailTextField.normalLabelColor(for: .normal)
            individualView.emailTextField.setOutlineColor(UIColor.red, for: .normal)
            
            individualView.scrollView.upToEmpty(textField:  individualView.emailTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !individualView.passTextField.text!.isEmpty:
            individualView.passTextField.normalLabelColor(for: .normal)
                       individualView.passTextField.setOutlineColor(UIColor.red, for: .normal)
                       
          
            individualView.scrollView.upToEmpty(textField:  individualView.passTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
            
        case !individualView.mobileTextField.text!.isEmpty:
            individualView.mobileTextField.normalLabelColor(for: .normal)
            individualView.mobileTextField.setOutlineColor(UIColor.red, for: .normal)
     
            individualView.scrollView.upToEmpty(textField:  individualView.mobileTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
            
        case !individualView.addressTextField.text!.isEmpty:
            individualView.addressTextField.normalLabelColor(for: .normal)
                      individualView.addressTextField.setOutlineColor(UIColor.red, for: .normal)
      
        //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
        case !individualView.nameTextField.text!.isEmpty:
            individualView.nameTextField.normalLabelColor(for: .normal)
                             individualView.nameTextField.setOutlineColor(UIColor.red, for: .normal)
             
        
            individualView.scrollView.upToEmpty(textField:  individualView.nameTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !individualView.confirmPassTextFied.text!.isEmpty:
            individualView.confirmPassTextFied.normalLabelColor(for: .normal)
                                       individualView.confirmPassTextFied.setOutlineColor(UIColor.red, for: .normal)
          
            individualView.scrollView.upToEmpty(textField:  individualView.confirmPassTextFied)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        default:
            print("error")
            
        }
    }
    // MARK:- Button Methods
    @IBAction func selectImageTapped(_ sender: UIButton) {
        
        selectPhoto()
    }
    
    @IBAction func addressTapped(_ sender: UIButton) {
        let map = MapVC.create()
        map.delegate = self
        self.navigationController?.pushViewController(map, animated: true)
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        viewModel.tryToRegist(email: individualView.emailTextField.text!, pass: individualView.passTextField.text!, confirmPass: individualView.confirmPassTextFied.text!, phone:  individualView.mobileTextField.text!)
    }
    
    @IBAction func clickCheckBox(_ sender: UIButton) {

        if sender.isSelected{
            individualView.agreeBtn.setImage(Asset.outputOnlinepngtools.image, for: .normal)
            individualView.agreeBtn.tintColor = .black
            sender.isSelected = false
        }
        else {
            individualView.agreeBtn.setImage(nil, for: .normal)
            individualView.agreeBtn.tintColor = .clear
            individualView.setupCheckViews()
            sender.isSelected = true
        }
    }
    @IBAction func showPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            individualView.passTextField.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            individualView.passTextField.isSecureTextEntry = true
            return sender.isSelected = true
        }
        
    }
    @IBAction func showConfirmPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            individualView.confirmPassTextFied.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            individualView.confirmPassTextFied.isSecureTextEntry = true
            return sender.isSelected = true
        }
        eyeControl(textField: individualView.confirmPassTextFied)
    }
    // MARK:- Public Methods
    class func create() -> SignupIndividualVC {
        let signupIndividualVC: SignupIndividualVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.individual)
        signupIndividualVC.viewModel = SignupIndividualViewModel(view: signupIndividualVC)
        return signupIndividualVC
    }
    
}
// MARK: - Implement Protocols
extension SignupIndividualVC: sendingAddress{
    func send(address: String) {
        individualView.addressTextField.text = address
        individualView.addressTextField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
    }
}

// MARK: - ImagePicker Protocols
extension SignupIndividualVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func selectPhoto(){
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagePicker,animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            individualView.employeeImage.image = image
            individualView.employeeBtn.setImage(nil, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
// MARK: - Implement Protocols
extension SignupIndividualVC: SignupIndividualProtocols{
    
    func showError(title: String, massage: String) {
        self.showAlert(title: title, massage: massage, present: self, titleBtn: "ok")
    }
    
    func check() -> Bool {
        guard  let email = individualView.emailTextField.text,
            !email.isEmpty,
            let choosePassoword = individualView.emailTextField.text,!choosePassoword.isEmpty,
            let confirmPass = individualView.confirmPassTextFied.text,!confirmPass.isEmpty,
            let name = individualView.nameTextField.text,!name.isEmpty,
            let mobile = individualView.mobileTextField.text,!mobile.isEmpty,
            let address = individualView.addressTextField.text,!address.isEmpty
            
            
            else {return false}
        return true
    }
    func Empty() {
        switchEmpty()
    }
}
