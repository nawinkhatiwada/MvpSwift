//
//  LoginContract.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/4/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginPresenter: BasePresenter {
    func doLogin(loginModel:LoginModel)
    func isUserLoggedIn() -> Bool
}

protocol LoginView {
    func showNetworkError(message:String)
    func showLoading(message:String)
    func showLoginSuccess(message:String)
    func showError(message:String)
}
