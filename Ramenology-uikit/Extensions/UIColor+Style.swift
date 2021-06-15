//
//  Colors.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 15/06/21.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        self.init(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            alpha: alpha)
    }

    convenience public init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.init(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(alpha))
    }
    
    /// Add new color based on hex #RRGGBB, Alpha 0-100
    convenience public init(hex: String, alpha: Int) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        let a: CGFloat = CGFloat(alpha)/100
        let length = hexSanitized.count
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    static let appRed: UIColor = .init(hex:"#FF6838", alpha: 100)
    static let appWhiteLight: UIColor = .init(hex: "#FFFFFF", alpha: 80)
    static let appWhite: UIColor = .init(hex: "#FFFFFF", alpha: 100)
    static let appGray: UIColor = .init(hex: "#302F3C", alpha: 100)
    static let appBlack: UIColor = .init(hex: "#303030", alpha: 100)
}
