//
//  ForgetPasswordViewModel.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation

// MARK:- Protocol Methods
protocol ForgetPasswordViewModelProtocols{
    func tryToSendEmail(email: String)
}
class ForgetPasswordViewModel{
    // MARK:- Properties
    weak var view: ForgetPasswordProtocols!
    
    
    // MARK:- Initialization Methods
    init(view: ForgetPasswordProtocols) {
        self.view = view
    }
    // MARK:- Private Methods
    
    private func reset(email: String){
        if view.check() == true{
            if Validation.shared.typelogin(text: email, errorMessgae: "") ==  true{
                view.goToVerificationCode()
            }
            else{
                view.showError(title: L10n.invalidMassage, massage:L10n.validEmailOrPhone)
            }
        }
        else {
            self.view.Empty()
        }
    }
}



// MARK: - Implement Protocols
extension ForgetPasswordViewModel: ForgetPasswordViewModelProtocols{
    func tryToSendEmail(email: String) {
        reset(email: email)
    }
    
    
}



