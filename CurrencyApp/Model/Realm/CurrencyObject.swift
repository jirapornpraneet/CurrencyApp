//
//  CurrencyObject.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import Realm
import RealmSwift

class CurrencyObject: Object {
   @Persisted(primaryKey: true) var _id: ObjectId
   @Persisted var code: String = ""
   @Persisted var rate: String = ""
    @Persisted var dateTime: String = ""
    
    convenience init(code: String, rate: String,dateTime: String) {
       self.init()
       self.code = code
       self.rate = rate
       self.dateTime = dateTime
   }

}
