//
//  CurrencyViewModel.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class CurrencyViewModel {
    
    var url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    var info: ChartCurrencyInfo?
    
    func requestData(_ completion: ((_ success: Bool) -> ())? = nil) {
        AF.request(self.url, method: .get, parameters:  nil, encoding:  URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let castingValue = value as? [String: Any] else {return}
                    guard let data = Mapper<ChartCurrencyInfo>().map(JSON: castingValue) else {return}
                    self.info = data
                    completion?(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion?(false)
                }
            }
        
    }
}
