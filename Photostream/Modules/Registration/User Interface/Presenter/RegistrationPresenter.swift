//
//  RegistrationPresenter.swift
//  Photostream
//
//  Created by Mounir Ybanez on 13/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

struct RegistrationPresenter: RegistrationPresenterInterface {

    weak var view: RegistrationViewInterface!
    var interactor: RegistrationInteractorInput!
    var wireframe: RegistrationWireframeInterface!
    
    func register(email: String, password: String, firstName: String, lastName: String) {
        interactor.register(email: email, password: password, firstName: firstName, lastName: lastName)
    }
    
    func presentErrorAlert(message: String) {
        wireframe.showErrorAlert(title: "Registration Error", message: message)
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    
    func registrationDidSucceed(user: User) {
        view.didRegisterOk()
    }
    
    func registrationDidFail(error: AuthenticationServiceError) {
        view.didReceiveError(message: error.message)
    }
}
