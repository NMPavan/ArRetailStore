//
//  JsonModel.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 11/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import Foundation
class jsonBasedModel{
    
    var header : String
    var productModel : [ProductModel]

    
    init(header:String,productModel:[ProductModel]) {
        self.header = header
        self.productModel = productModel
    }
}
