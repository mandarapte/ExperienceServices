//
//  UIColorExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit
import SwiftUI

// MARK: - UIColor Extension
@MainActor
public extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        #if os(watchOS)
        self.init(uiColor: dark)
        #else
        self.init(dynamicProvider: { traitCollection -> UIColor in
            switch traitCollection.userInterfaceStyle {
                case .light, .unspecified:
                    return light
                case .dark:
                    return dark
                default:
                    return light
            }
        })
        #endif
    }
    func toColor() -> Color {
        if let components = self.cgColor.components {
            return Color(red: components[0], green: components[1], blue: components[2], opacity: components[3])
        } else {
            return Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0)
        }
    }
    func toRGB() -> (displayP3Red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        if let components = self.cgColor.components {
            return (displayP3Red: components[0], green: components[1], blue: components[2], alpha: components[3])
        } else {
            return (displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }
    }
    func toHEX() -> String {
        if let components = self.cgColor.components {
            let rgb: [CGFloat] = [components[0], components[1], components[2]]
            return rgb.reduce("") { res, value in
                let intval = Int(round(value * 255))
                return res + (NSString(format: "%02X", intval) as String)
            }
        } else {
            return ""
        }
    }
    convenience init(hex: String, alpha: CGFloat) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

// MARK: - Color Extension
public extension Color {
    func toUIColor() -> UIColor {
        if let components = self.cgColor?.components {
            return UIColor(displayP3Red: components[0], green: components[1], blue: components[2], alpha: components[3])
        } else {
            return UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }
    }
    func toRGB() -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        if let components = self.cgColor?.components {
            return (red: components[0], green: components[1], blue: components[2])
        } else {
            return (red: 0.0, green: 0.0, blue: 0.0)
        }
    }
    func toColorCode() -> String {
        if let components = self.cgColor?.components {
            let rgb: [CGFloat] = [components[0], components[1], components[2]]
            return rgb.reduce("") { res, value in
                let intval = Int(round(value * 255))
                return res + (NSString(format: "%02X", intval) as String)
            }
        } else {
            return ""
        }
    }
    init(hex: String) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b)
    }
}
