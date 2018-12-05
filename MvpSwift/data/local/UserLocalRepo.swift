//
//  UserLocalRepo.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/5/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

protocol UserLocalRepo{
    func saveUsername(loginResponse:LoginResponse)
    func isUserLoggedIn()-> Bool
}
