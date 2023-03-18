//
//  ChartCurrencyInfo.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class ChartCurrencyInfo: Mappable {
    
    var time: TimeInfo?
    var disclaimer = ""
    var chartName = ""
    var bpi: CurrencyInfo?
   
    required init?(map:Map) {}
    
    func mapping(map: Map) {
        time <- map["time"]
        disclaimer <- map["disclaimer"]
        chartName <- map["chartName"]
        bpi <- map["bpi"]
    }
}
