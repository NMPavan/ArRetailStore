//
//  UIColor+hexcolor.swift
//  MyAcuvueMain
//
//  Created by eClerx_Digital on 02/12/19.
//  Copyright © 2019 csc digital. All rights reserved.
//

import UIKit
extension UIColor {

//convenience init?(hexString: String) {
//    let r, g, b, a: CGFloat
//
//
//    if hexString.hasPrefix("#") {
//              let start = hexString.index(hexString.startIndex, offsetBy: 1)
//              let hexColor = String(hexString[start...])
//
//              if hexColor.count == 8 {
//                  let scanner = Scanner(string: hexColor)
//                  var hexNumber: UInt64 = 0
//
//                  if scanner.scanHexInt64(&hexNumber) {
//                      r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                      g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                      b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                      a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                      self.init(red: r, green: g, blue: b, alpha: a)
//                      return
//                  }
//              }
//          }
//
//          return nil
//}
    convenience init(red: Int, green: Int, blue: Int) {
         assert(red >= 0 && red <= 255, "Invalid red component")
         assert(green >= 0 && green <= 255, "Invalid green component")
         assert(blue >= 0 && blue <= 255, "Invalid blue component")

         self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
     }

     convenience init(rgb: Int) {
         self.init(
             red: (rgb >> 16) & 0xFF,
             green: (rgb >> 8) & 0xFF,
             blue: rgb & 0xFF
         )
     }
}
