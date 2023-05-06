//
//  SignupWorkViewModel.swift
//  Salek
//
//  Created by Divo Ayman on 4/27/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation

  // MARK:- Protocol Methods
  protocol SignupWorkViewModelProtocols {
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String)
  }

  class SignupWorkViewModel{
     // MARK:- Properties
    weak var view: SignupWorkProtocols!
    
      // MARK:- Initialization Methods
    init(view:SignupWorkProtocols) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func SaveUser(email: String, pass: String, phone: String){
         
            let response = Validation.shared.validate(values: (type:Validation.ValidationType.email, email),(Validation.ValidationType.password,pass),(Validation.ValidationType.phoneNo,phone))
            
              switch response {
          
              case .success:
                if view.checkIDimage() == true{
                  if view.check() == true{
                      
                      view.showError(title: "Sucsess", massage: "Sucsess")
                      
                  } else {
                      self.view.Empty()
                  }
                }
                else{
                    view.change()
                     view.showError(title: L10n.invalidMassage, massage:L10n.photoMassge)
                }
              case .failure(_, let message):
                  print(message.localized())
                  view.showError(title: L10n.invalidMassage, massage: message.localized())
                  
              }
          
      }

}


// MARK: - Implement Protocols
extension SignupWorkViewModel: SignupWorkViewModelProtocols{
    func tryToRegist(email: String, pass: String, confirmPass: String, phone: String) {
        if pass == confirmPass{
            SaveUser(email: email, pass: pass, phone: phone)
        }
        else{
            view.showError(title: L10n.invalidMassage, massage: L10n.confirmPassword)
        }
    }
    
    
}
