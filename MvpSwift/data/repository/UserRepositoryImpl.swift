//
//  UserRepositoryImpl.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import RxSwift

class UserRepositoryImpl: UserRepository {
    var remoteRepo: UserRemoteRepo
    var localRepo: UserLocalRepo
    
    init(remoteRepo: UserRemoteRepo, localRepo:UserLocalRepo) {
        self.remoteRepo = remoteRepo
        self.localRepo = localRepo
    }
    func doLogin(loginModel: LoginModel) -> Observable<LoginResponse> {
        return remoteRepo.doLogin(loginModel: loginModel)
        
    }
    
    func isUserLoggedIn() -> Bool {
        return localRepo.isUserLoggedIn()
    }
}
