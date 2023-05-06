//
//  SignupIndividualViewModel.swift
//  Salek
//
//  Created by Divo Ayman on 4/27/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation

// MARK:- Protocol Methods
protocol SignupIndividualViewModelProtocols {
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String)
}

class SignupIndividualViewModel{
    // MARK:- Properties
    weak var view: SignupIndividualProtocols!
    
    // MARK:- Initialization Methods
    init(view: SignupIndividualProtocols) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func SaveUser(email: String, pass: String, phone: String){
        
        let response = Validation.shared.validate(values: (type:Validation.ValidationType.email, email),(Validation.ValidationType.password,pass),(Validation.ValidationType.phoneNo,phone))
        
        switch response {
            
        case .success:
            
            if view.check() == true{
                
                view.showError(title: "Sucsess", massage: "Sucsess")
                
            } else {
                self.view.Empty()
            }
            
            
        case .failure(_, let message):
            print(message.localized())
            view.showError(title: L10n.invalidMassage, massage: message.localized())
            
        }
        
    }
    
}


// MARK: - Implement Protocols
extension SignupIndividualViewModel: SignupIndividualViewModelProtocols{
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String) {
        if pass == confirmPass{
            SaveUser(email: email, pass: pass, phone: phone)
        }
        else{
            view.showError(title: L10n.invalidMassage, massage: L10n.confirmPassword)
        }
    }
    
    
}
