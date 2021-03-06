//
//  UserRemoteImpl.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import RxSwift

class UserRemoteImpl: UserRemoteRepo {
    static let getInstance = UserRemoteImpl()
    
    func doLogin(loginModel: LoginModel) -> Observable<LoginResponse> {
        let username = loginModel.userName
        let password = loginModel.userPass
        let params = ["username": username, "password": password]
        

        return MvpApiService.shared.requestData(T: LoginResponse.self,
                                              url: Urls.loginUrl,
                                              method: .get,
                                              parameters: params,
                                              header: nil)
        
    }
}
