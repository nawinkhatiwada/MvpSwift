//
//  UserRepositoryImpl.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    var remoteRepo: UserRemoteRepo
    var localRepo: UserLocalRepo
    
    init(remoteRepo: UserRemoteRepo, localRepo:UserLocalRepo) {
        self.remoteRepo = remoteRepo
        self.localRepo = localRepo
    }
    
    func doLogin(loginModel: LoginModel,
                 response: @escaping (LoginResponse) -> (),
                 error: @escaping (String, Int) -> ()) {
        
        self.remoteRepo.doLogin(loginModel:loginModel,response: { (loginReponse) in
            self.localRepo.saveUsername(loginResponse: loginReponse)
            response(loginReponse) //response callback
        
        }) { (statusMessage, statusCode) in
            error(statusMessage, statusCode) //error callback
        }
    }
    
    func isUserLoggedIn() -> Bool {
        return localRepo.isUserLoggedIn()
    }
}
