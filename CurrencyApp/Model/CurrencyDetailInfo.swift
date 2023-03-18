//
//  CurrencyDetailInfo.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class CurrencyDetailInfo: Mappable {
    
    var code = ""
    var symbol = ""
    var rate = ""
    var description = ""
    var rate_float = 0.0
    var dateTime = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        symbol <- map["symbol"]
        rate <- map["rate"]
        description <- map["description"]
        rate_float <- map["rate_float"]
    }
}
