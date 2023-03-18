//
//  TimeInfo.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class TimeInfo: Mappable {
    
    var updated = ""
    var updatedISO = ""
    var updateduk = ""

    required init?(map: Map) {}
    
    func mapping(map: Map) {
        updated <- map["updated"]
        updatedISO <- map["updatedISO"]
        updateduk <- map["updateduk"]
        
    }
}
