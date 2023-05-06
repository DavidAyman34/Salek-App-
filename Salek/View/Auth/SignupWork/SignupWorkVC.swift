//
//  SignupWorkVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/24/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
// MARK:- Protocols
protocol SignupWorkProtocols: class{
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    func checkIDimage() -> Bool
    func change()
    
}
class SignupWorkVC: UIViewController,UITextFieldDelegate {
    
    // MARK:- Outlets
    @IBOutlet var workView: SignupWorkView!
    
    // MARK: - Properties
    private var viewModel: SignupWorkViewModelProtocols!
    var imagePicker = UIImagePickerController()
    var iconClick: Bool!
    var tag: Int!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        workView.setup()
        self.setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.signupWorkNav, barColor: .white)
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
        
        iconClick = !(iconClick ?? false)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
        workView.installTextField()
    }
    
    // MARK:- Private Methods
    private func delegateTextField(){
        workView.emailTextField.delegate = self
        workView.passTextField.delegate = self
        workView.nationalityTextField.delegate = self
        workView.iDTextField.delegate = self
        workView.addressTextField.delegate = self
        workView.mobileTextField.delegate = self
        workView.nameTextField.delegate = self
        workView.confirmPassTextFied.delegate = self
        workView.typeTextField.delegate = self
        
    }
    
    private func switchEmpty(){
        switch  check() {
        case !workView.emailTextField.text!.isEmpty:
            workView.emailTextField.normalLabelColor(for: .normal)
            workView.emailTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.emailTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !workView.passTextField.text!.isEmpty:
            workView.passTextField.normalLabelColor(for: .normal)
            workView.passTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.passTextField)
        //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
        case !workView.nationalityTextField.text!.isEmpty:
            workView.nationalityTextField.normalLabelColor(for: .normal)
            workView.nationalityTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.nationalityTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !workView.iDTextField.text!.isEmpty:
            workView.iDTextField.normalLabelColor(for: .normal)
            workView.iDTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.iDTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !workView.addressTextField.text!.isEmpty:
            workView.addressTextField.normalLabelColor(for: .normal)
            workView.addressTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.addressTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !workView.mobileTextField.text!.isEmpty:
            workView.mobileTextField.normalLabelColor(for: .normal)
            workView.mobileTextField.setOutlineColor(UIColor.red, for: .normal)
            
            
            workView.scrollView.upToEmpty(textField:  workView.mobileTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
        //
        case !workView.nameTextField.text!.isEmpty:
            workView.nameTextField.normalLabelColor(for: .normal)
            workView.nameTextField.setOutlineColor(UIColor.red, for: .normal)
            
            workView.scrollView.upToEmpty(textField:  workView.nameTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
        case !workView.confirmPassTextFied.text!.isEmpty:
            workView.confirmPassTextFied.normalLabelColor(for: .normal)
            workView.confirmPassTextFied.setOutlineColor(UIColor.red, for: .normal)
            
            workView.confirmPassTextFied.layer.borderColor  = UIColor.red.cgColor
            workView.scrollView.upToEmpty(textField:  workView.confirmPassTextFied)
        //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
        case !workView.typeTextField.text!.isEmpty:
            workView.typeTextField.normalLabelColor(for: .normal)
            workView.typeTextField.setOutlineColor(UIColor.red, for: .normal)
            
            
            workView.scrollView.upToEmpty(textField:  workView.typeTextField)
            //            self.showAlert(title: L10n.invalidMassage, massage: L10n.completeMassge, present: self, titleBtn: "ok")
            
            
            
        default:
            print("error")
            
        }
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
    @IBAction func employeeTapped(_ sender: UIButton) {
        tag = 0
        selectPhoto()
    }
    
    @IBAction func addressTapped(_ sender: UIButton) {
        let map = MapVC.create()
        map.delegate = self
        self.navigationController?.pushViewController(map, animated: true)
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        viewModel.tryToRegist(email: workView.emailTextField.text!, pass: workView.passTextField.text!, confirmPass: workView.confirmPassTextFied.text!, phone: workView.mobileTextField.text!)
    }
    @IBAction func frontIDTapped(_ sender: UIButton) {
        tag = 1
        selectPhoto()
    }
    @IBAction func BackIDTapped(_ sender: UIButton) {
        tag = 2
        selectPhoto()
    }
    @IBAction func showPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            workView.passTextField.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            workView.passTextField.isSecureTextEntry = true
            return sender.isSelected = true
        }
        
    }
    @IBAction func showConfirmPassTapped(_ sender: UIButton) {
        if sender.isSelected == true{
            workView.confirmPassTextFied.isSecureTextEntry = false
            return sender.isSelected = false
        }
        else{
            workView.confirmPassTextFied.isSecureTextEntry = true
            return sender.isSelected = true
        }
        
    }
    
    @IBAction func clickCheckBox(_ sender: UIButton) {
        if sender.isSelected{
            workView.aggreeBtn.setImage(Asset.outputOnlinepngtools.image, for: .normal)
            workView.aggreeBtn.tintColor = .black
            sender.isSelected = false
        }
        else {
            workView.aggreeBtn.setImage(nil, for: .normal)
            workView.aggreeBtn.tintColor = .clear
            workView.setupCheckViews()
            sender.isSelected = true
        }
    }
    
    // MARK:- Public Methods
    class func create() -> SignupWorkVC {
        let signupWorkVC: SignupWorkVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.signupWorkVC)
        signupWorkVC.viewModel =  SignupWorkViewModel(view: signupWorkVC)
        
        return signupWorkVC
    }
}

// MARK: - Implement Protocols
extension SignupWorkVC: sendingAddress{
    func send(address: String) {
        workView.addressTextField.text = address
        workView.addressTextField.layer.borderColor = UIColor(named: ColorName.blue).cgColor
    }
}
// MARK: - ImagePicker Protocols
extension SignupWorkVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func selectPhoto(){
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagePicker,animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if tag == 0 {
                workView.employeeImage.image = image
                workView.employeeBtn.setImage(nil, for: .normal)
            }
            else if tag == 1{
                workView.frontImage.image = image
                workView.frontBtn.setImage(nil, for: .normal)
                
                
            }
            else if tag == 2 {
                workView.backIDImage.image = image
                workView.backBtn.setImage(nil, for: .normal)
                
                
            }
        }
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
// MARK: - Implement Protocols
extension SignupWorkVC: SignupWorkProtocols{
    func change() {
        if workView.backIDImage.image == nil {
            workView.backIDImage.layer.borderColor = UIColor.red.cgColor
        }
        else if workView.frontImage.image == nil{
            workView.forntIDView.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    
    
    func checkIDimage() -> Bool{
        if workView.backIDImage.image == nil || workView.frontImage.image == nil{
            
            
            return false
        }
        else{
            return true
        }
    }
    
    
    func showError(title: String, massage: String) {
        self.showAlert(title: title, massage: massage, present: self, titleBtn: "ok")
    }
    
    func check() -> Bool {
        guard  let email = workView.emailTextField.text,
            !email.isEmpty,
            let choosePassoword = workView.emailTextField.text,!choosePassoword.isEmpty,
            let confirmPass = workView.confirmPassTextFied.text,!confirmPass.isEmpty,
            let name = workView.nameTextField.text,!name.isEmpty,
            let mobile = workView.mobileTextField.text,!mobile.isEmpty,
            let address = workView.addressTextField.text,!address.isEmpty,
            let landline = workView.typeTextField.text,!landline.isEmpty,
            let storeType = workView.nationalityTextField.text,!storeType.isEmpty,
            let detailAddress = workView.iDTextField.text,!detailAddress.isEmpty
            
            
            else {return false}
        return true
    }
    func Empty() {
        switchEmpty()
    }
}

