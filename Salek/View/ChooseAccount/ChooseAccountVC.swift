//
//  ChooseAccountVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/13/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

// MARK:- Protocols


class ChooseAccountVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var chooseView: ChooseAccountView!
    
    // MARK: - Properties
    var tag: Int!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseView.setup()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK:- Private Methods
    private func goTo(){
        if tag == 0 {
            let sigupVc = SignupStoreVC.create()
            self.navigationController?.pushViewController(sigupVc, animated: true)
            
        }
        else if tag == 1 {
            let signupIndividual = SignupIndividualVC.create()
            self.navigationController?.pushViewController(signupIndividual, animated: true)
            
        }
        else if tag == 2{
            let signupWork = SignupWorkVC.create()
            self.navigationController?.pushViewController(signupWork, animated: true)
        }
        else{
            showAlert(title: "error", massage: "Choose Account", present: self, titleBtn: "OK")
        }
    }
    private  func choose(){
        if tag == 0 {
            self.chooseView.sotreCheckBtn.setImage(Asset.checkbutton.image, for: .normal)
            self.chooseView.workCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
            self.chooseView.pesonalCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
            
            
        }
        else if tag == 1 {
            self.chooseView.sotreCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
            self.chooseView.pesonalCheckBtn.setImage(Asset.checkbutton.image, for: .normal)
            self.chooseView.workCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
        }
        else{
            self.chooseView.sotreCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
            self.chooseView.pesonalCheckBtn.setImage(Asset.unCheckBtn.image, for: .normal)
            self.chooseView.workCheckBtn.setImage(Asset.checkbutton.image, for: .normal)
        }
    }
    
    //MARK:- NavBarButtons
    
    // MARK:- Button Methods
    @IBAction func NextTapped(_ sender: UIButton) {
        goTo()
    }
    
    @IBAction func StoreBtnTapped(_ sender: UIButton) {
        tag = 0
        choose()
    }
    @IBAction func personalBtnTapped(_ sender: UIButton) {
        tag = 1
        choose()
    }
    @IBAction func workBtnTapped(_ sender: UIButton) {
        tag = 2
        choose()
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Public Methods
    class func create() -> ChooseAccountVC {
        let chooseAccountVC: ChooseAccountVC = UIViewController.create(storyboardName: Storyboards.chooseAccount, identifier: ViewControllers.chooseAccountVC)
        
        return chooseAccountVC
    }
}
// MARK: - Implement Protocols
