//
//  LoginPresenter.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/4/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class  LoginPagePresenter: LoginPresenter {
    
    var repository: UserRepository
    var view:LoginView
    
    init(view : LoginView) {
        self.view = view
        repository = UserRepositoryImpl()
    }
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
    func doLogin(loginModel: LoginModel) {
        self.view.showLoading(message: "Please wait...")
        repository.doLogin(loginModel: loginModel,
                           response: { (LoginResponse) in
                            self.view.showLoginSuccess(message: "Login Success")
                        }) { (statusMessage, statusCode) in
                            self.view.showError(message: statusMessage)
                        }
    }
   
}
