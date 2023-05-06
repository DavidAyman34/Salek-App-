//
//  SignupStoreViewModel.swift
//  Salek
//
//  Created by Divo Ayman on 4/20/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation

// MARK:- Protocol Methods
protocol SignupStoreViewModelProtocols {
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String)
}

class SignupStoreViewModel{
    
     // MARK:- Properties
    weak var view: SignupStoreProtocols!
    
      // MARK:- Initialization Methods
    init(view:SignupStoreProtocols) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func login(email: String, pass: String,phone: String){
         
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
extension SignupStoreViewModel: SignupStoreViewModelProtocols{
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String) {
        if pass == confirmPass{
            login(email: email, pass: pass, phone: phone)
        }
        else{
            view.showError(title: L10n.invalidMassage, massage: L10n.confirmPassword)
        }
    }
    
    
    
    
}

