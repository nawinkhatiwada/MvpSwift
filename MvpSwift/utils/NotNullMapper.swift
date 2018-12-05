//
//  NotNullMapper.swift
//  MvpSwift
//
//  Created by rumi on 12/5/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

func NotNullMapper<T:Mappable>(t:BaseResponse<T>)-> Observable<T>{
    if(t.statusCode != -1){
        return Observable.just(t.data!)
    }else{
        return Observable.error(NSError(domain:"", code:-1, userInfo:nil))
    }
}
