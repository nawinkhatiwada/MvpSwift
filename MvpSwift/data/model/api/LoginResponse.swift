//
//  LoginResponse.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/2/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse:Mappable{
    
    var id:Int = 0
    var username:String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
    }
}
