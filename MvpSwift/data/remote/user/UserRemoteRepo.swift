//
//  UserRemoteRepo.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRemoteRepo {
    func doLogin(loginModel: LoginModel) -> Observable<LoginResponse>
}
