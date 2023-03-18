//
//  CurrencyInfo.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class CurrencyInfo: Mappable {
    
    var USD: CurrencyInfo?
    var GBP: CurrencyInfo?
    var EUR: CurrencyInfo?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        USD <- map["USD"]
        GBP <- map["GBP"]
        EUR <- map["EUR"]
    }
    
}
