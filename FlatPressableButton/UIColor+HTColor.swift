//
//  UIColor+HTColor.swift
//  FlatPressableButton
//
//  Created by Priyanka Pote on 16/11/17.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//



import Foundation
import UIKit


func UIColorFromHexString (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


extension UIColor{
    // MARK: - Designmodo color schemes
    // http://designmodo.github.io/Flat-UI/
    
    
    class func ht_turquoiseColor() -> UIColor {
         return UIColorFromHexString(hex: "1ABC9C")
    }
    class func ht_everaldColor() -> UIColor {
        return UIColorFromHexString(hex: "2ECC71")
    }
    class func ht_peterRiverColor() -> UIColor {
        return UIColorFromHexString(hex: "3498DB")
    }
    class func ht_amethystColor() -> UIColor {
        return UIColorFromHexString(hex: "9B59B6")
    }
    class func ht_wetApshaltColor() -> UIColor {
        return UIColorFromHexString(hex: "34495E")
    }
    class func ht_greenSeaColor() -> UIColor {
        return UIColorFromHexString(hex: "16A085")
    }
    class func ht_nephritisColor() -> UIColor {
        return UIColorFromHexString(hex: "27AE60")
    }
    class func ht_belizeHoleColor() -> UIColor {
        return UIColorFromHexString(hex: "2980B9")
    }
    class func ht_wisteriaColor() -> UIColor {
        return UIColorFromHexString(hex: "8E44AD")
    }
    class func ht_midnightBlue() -> UIColor {
        return UIColorFromHexString(hex: "2C3E50")
    }
    class func ht_sunflowerColor() -> UIColor {
        return UIColorFromHexString(hex: "F1C40F")
    }
    class func ht_carrotColor() -> UIColor {
        return UIColorFromHexString(hex: "E67E22")
    }
    class func ht_alizarinColor() -> UIColor {
        return UIColorFromHexString(hex: "E74C3C")
    }
    class func ht_cloudsColor() -> UIColor {
        return UIColorFromHexString(hex: "ECF0F1")
    }
    class func ht_concreteColor() -> UIColor {
        return UIColorFromHexString(hex: "95A5A6")
    }
    class func ht_orangeColor() -> UIColor {
        return UIColorFromHexString(hex: "F39C12")
    }
    class func ht_pumpkinColor() -> UIColor {
        return UIColorFromHexString(hex: "D35400")
    }
    class func ht_pomegranateColor() -> UIColor {
        return UIColorFromHexString(hex: "C0392B")
    }
    class func ht_silverColor() -> UIColor {
        return UIColorFromHexString(hex: "BDC3C7")
    }
    class func ht_asbestosColor() -> UIColor {
        return UIColorFromHexString(hex: "7F8C8D")
    }
}


