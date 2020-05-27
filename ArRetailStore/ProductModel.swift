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
          static let ModelPath = "model"
          static let Extension = "extension"
         
      }
    
     var ProductName = "ProductName"
    var ProductImage = "ProductImage"
    var ProductPrice = "ProductPrice"
    var ModelPath = "ModelPath"
    var Extension = "Extension"
   
    
    init(ProductName: String, ProductImage: String,ProductPrice: String,ModelPath: String,Extension: String) {
        self.ProductName = ProductName
        self.ProductImage = ProductImage
        self.ProductPrice = ProductPrice
        self.ModelPath = ModelPath
        self.Extension = Extension
       
    }
    
}
