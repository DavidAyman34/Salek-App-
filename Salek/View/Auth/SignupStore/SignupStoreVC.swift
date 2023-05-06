//
//  SignupVc.swift
//  Salek
//
//  Created by Divo Ayman on 4/13/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit


// MARK:- Protocols
protocol SignupStoreProtocols: class{
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
}
class SignupStoreVC: UIViewController,UITextFieldDelegate {
    
    // MARK:- Outlets
    @IBOutlet var signupStoreView: SignupStoreView!
    
    // MARK: - Properties
    var imagePicker = UIImagePickerController()
    private var viewModel : SignupStoreViewModelProtocols!
    var iconClick: Bool!
    
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        signupStoreView.setup()
        self.setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.navgationTitle, barColor: .white)
        navigationController?.navigationBar.isHidden = true
        delegateTextField()
        iconClick = true
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
        signupStoreView.installTextField()
        
    }
    
    // MARK:- Private Methods
    private func delegateTextField(){
        signupStoreView.emailTextField.delegate = self
        signupStoreView.passTextField.delegate = self
        signupStoreView.addressTextField.delegate = self
        signupStoreView.mobileTextField.delegate = self
        signupStoreView.nameTextField.delegate = self
        signupStoreView.confirmPassTextField.delegate = self
        signupStoreView.storeTypeTextField.delegate = self
        signupStoreView.detailAddressTextField.delegate = self
        signupStoreView.landlineTextField.delegate = self
        
    }
    private func switchEmpty(){
        switch  check() {
        case !signupStoreView.emailTextField.text!.isEmpty:
            
            signupStoreView.emailTextField.normalLabelColor(for: .normal)
            signupStoreView.emailTextField.setOutlineColor(UIColor.red, for: .normal)
            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.emailTextField)
            
        case !signupStoreView.passTextField.text!.isEmpty:
            signupStoreView.passTextField.normalLabelColor(for: .normal)
            signupStoreView.passTextField.setOutlineColor(UIColor.red, for: .normal)
            
            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.passTextField)
            
            
            
        case !signupStoreView.detailAddressTextField.text!.isEmpty:
            signupStoreView.detailAddressTextField.normalLabelColor(for: .normal)
            signupStoreView.detailAddressTextField.setOutlineColor(UIColor.red, for: .normal)
            signupStoreView.detailAddressTextField.layer.borderColor  = UIColor.red.cgColor
            //            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.detailAddressTextField)
            
        case !signupStoreView.landlineTextField.text!.isEmpty:
            signupStoreView.landlineTextField.normalLabelColor(for: .normal)
            signupStoreView.landlineTextField.setOutlineColor(UIColor.red, for: .normal)
            
            //                       signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.landlineTextField)
            
        case !signupStoreView.addressTextField.text!.isEmpty:
            signupStoreView.addressTextField.normalLabelColor(for: .normal)
            signupStoreView.addressTextField.setOutlineColor(UIColor.red, for: .normal)
            
            //            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.addressTextField)
            
        case !signupStoreView.mobileTextField.text!.isEmpty:
            signupStoreView.mobileTextField.normalLabelColor(for: .normal)
            signupStoreView.mobileTextField.setOutlineColor(UIColor.red, for: .normal)
            
            //            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.mobileTextField)
            
        case !signupStoreView.nameTextField.text!.isEmpty:
            signupStoreView.nameTextField.normalLabelColor(for: .normal)
            signupStoreView.nameTextField.setOutlineColor(UIColor.red, for: .normal)
            
            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.nameTextField)
            
        case !signupStoreView.confirmPassTextField.text!.isEmpty:
            signupStoreView.confirmPassTextField.normalLabelColor(for: .normal)
            signupStoreView.confirmPassTextField.setOutlineColor(UIColor.red, for: .normal)
            
            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.confirmPassTextField)
            
        case !signupStoreView.storeTypeTextField.text!.isEmpty:
            signupStoreView.storeTypeTextField.normalLabelColor(for: .normal)
            signupStoreView.storeTypeTextField.setOutlineColor(UIColor.red, for: .normal)
            
            signupStoreView.scrollView.upToEmpty(textField:  signupStoreView.storeTypeTextField)
            
            
            
        default:
            print("error")
            
        }
    }
    
    private func eyeControl(textField: UITextField) {
        if(iconClick == true) {
            textField.isSecureTextEntry = false
            //SigninView.showPssBtn.setImage(UIImage(named: "eye"), for: .normal)
            
        } else {
            textField.isSecureTextEntry = true
            //eyeDesign.setImage(UIImage(named: "closedeye"), for: .normal)
        }
        
        iconClick = !(iconClick ?? false)
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
    
    // MARK:- Button Methods
    @IBAction func addressTapeed(_ sender: Any) {
        let map = MapVC.create()
        map.delegate = self
        self.navigationController?.pushViewController(map, animated: true)
    }
    
    
    @IBAction func selectImageTapped(_ sender: UIButton) {
        selectPhoto()
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        viewModel.tryToRegist(email: signupStoreView.emailTextField.text!, pass: signupStoreView.passTextField.text!, confirmPass: signupStoreView.confirmPassTextField.text!, phone: signupStoreView.mobileTextField.text!)
    }
    
    @IBAction func showPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            signupStoreView.passTextField.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            signupStoreView.passTextField.isSecureTextEntry = true
            return sender.isSelected = true
        }
        
    }
    @IBAction func showConfirmPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            signupStoreView.confirmPassTextField.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            signupStoreView.confirmPassTextField.isSecureTextEntry = true
            return sender.isSelected = true
        }
        
        
    }
    
    @IBAction func clickCheckBox(_ sender: UIButton) {
        if sender.isSelected{
            signupStoreView.agreeBtn.setImage(Asset.outputOnlinepngtools.image, for: .normal)
            signupStoreView.agreeBtn.tintColor = .black
            sender.isSelected = false
        }
        else {
            signupStoreView.agreeBtn.setImage(nil, for: .normal)
            signupStoreView.agreeBtn.tintColor = .clear
            signupStoreView.setupCheckViews()
            sender.isSelected = true
        }
    }
    
    // MARK:- Public Methods
    class func create() -> SignupStoreVC {
        let signupStoreVC: SignupStoreVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.signupStoreVC)
        signupStoreVC.viewModel = SignupStoreViewModel(view: signupStoreVC)
        
        return signupStoreVC
    }
}

// MARK: - Implement Protocols
extension SignupStoreVC: sendingAddress{
    func send(address: String) {
        signupStoreView.addressTextField.text = address
        signupStoreView.addressTextField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
    }
}
// MARK: - ImagePicker Protocols
extension SignupStoreVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func selectPhoto(){
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagePicker,animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            signupStoreView.storeImg.image = image
            signupStoreView.logoBtn.setImage(nil, for: .normal)
        }
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

// MARK: - Implement Protocols
extension SignupStoreVC: SignupStoreProtocols{
    
    func showError(title: String, massage: String) {
        self.showAlert(title: title, massage: massage, present: self, titleBtn: "ok")
    }
    
    func check() -> Bool {
        guard  let email = signupStoreView.emailTextField.text,
            !email.isEmpty,
            let choosePassoword = signupStoreView.emailTextField.text,!choosePassoword.isEmpty,
            let confirmPass = signupStoreView.confirmPassTextField.text,!confirmPass.isEmpty,
            let name = signupStoreView.nameTextField.text,!name.isEmpty,
            let mobile = signupStoreView.mobileTextField.text,!mobile.isEmpty,
            let address = signupStoreView.addressTextField.text,!address.isEmpty,
            let landline = signupStoreView.landlineTextField.text,!landline.isEmpty,
            let storeType = signupStoreView.storeTypeTextField.text,!storeType.isEmpty,
            let detailAddress = signupStoreView.detailAddressTextField.text,!detailAddress.isEmpty
            
            
            else {return false}
        return true
    }
    func Empty() {
        switchEmpty()
    }
}
