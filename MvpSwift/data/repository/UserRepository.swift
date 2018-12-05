//
//  UserRepository.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRepository {
    func doLogin(loginModel:LoginModel) -> Observable<LoginResponse>

    func isUserLoggedIn()-> Bool
}
