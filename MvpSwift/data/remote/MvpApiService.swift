//
//  ApiService.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/2/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift
import RxAlamofire

class MvpApiService {
    static let shared = MvpApiService()
    private init(){
    
    }
    func requestData <T:Mappable>(T:T.Type,
                                  url:String,
                                  method: HTTPMethod? = .get,
                                  parameters: Parameters? = nil,
                                  header:HTTPHeaders? = nil) -> (Observable<T>) {
        
        return RxAlamofire.requestJSON(method!, url, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .mapObject(type:BaseResponse<T>.self)
            .flatMap{response in NotNullMapper(t: response)}
    
    }
}
