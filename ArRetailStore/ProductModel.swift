//
//  ProductModel.swift
//  ArRetailStore
//
//  Created by eClerx_Digital on 12/03/20.
//  Copyright © 2020 eClerx_Digital. All rights reserved.
//

import Foundation
class ProductModel: NSObject {
    
    struct ProductDetails {
          static let ProductName = "productName"
          static let ProductImage = "productImage"
          static let ProductPrice = "productPrice"
         
      }
    
     var ProductName = "ProductName"
    var ProductImage = "ProductImage"
    var ProductPrice = "ProductPrice"
   
    
    init(ProductName: String, ProductImage: String,ProductPrice: String) {
        self.ProductName = ProductName
        self.ProductImage = ProductImage
        self.ProductPrice = ProductPrice
       
    }
    
}
