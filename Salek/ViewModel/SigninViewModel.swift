//
//  SigninViewModel.swift
//  Salek
//
//  Created by Divo Ayman on 4/14/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation

// MARK:- Protocol Methods
protocol SigninViewModelProtocols{
    func tryToLogin(email: String, pass: String)
}
class SigninViewModel{
    // MARK:- Properties
    weak var view:SigninProtocols!
    var isEmail :Bool!
    
    // MARK:- Initialization Methods
    init(view: SigninProtocols) {
        self.view = view
    }
    // MARK:- Private Methods
    
    private func login(email: String, pass: String){
        
        if Validation.shared.typelogin(text: email, errorMessgae: "") ==  true{
            if view.check() == true{
                let response = Validation.shared.validate(values: (Validation.ValidationType.password,pass))
                
                switch response {
                    
                case .success:
                    view.showError(title: "Sucsess", massage: "Sucsess")
                case .failure(_, let message):
                    print(message.localized())
                    view.showError(title: "Invalid", massage: message.localized())
                }
            }else {
                self.view.Empty()
            }
            
        }
        else{
            
            view.showError(title: L10n.invalidMassage, massage:L10n.validEmailOrPhone)
        }
        
    }
}



// MARK: - Implement Protocols
extension SigninViewModel:SigninViewModelProtocols{
    func tryToLogin(email: String, pass: String) {
        
        
        login(email: email, pass: pass)
        
    }
}



