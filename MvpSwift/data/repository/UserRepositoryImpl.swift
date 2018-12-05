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
    
    init() {
        remoteRepo = UserRemoteImpl()
        localRepo = UserLocalImpl()
    }
    
    func doLogin(loginModel: LoginModel,
                 response: @escaping (LoginResponse) -> (),
                 error: @escaping (String, Int) -> ()) {
        
        self.remoteRepo.doLogin(loginModel:loginModel,response: { (loginReponse) in
            self.localRepo.saveUserDetails(loginResponse: loginReponse)
            response(loginReponse) //response callback
        
        }) { (statusMessage, statusCode) in
            error(statusMessage, statusCode) //error callback
        }
    }
    
}
