//
//  StringExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - String Extension
@MainActor
public extension String {
    var isUppercase: Bool {
        return self == self.uppercased()
    }
    func reversedString() -> String {
        return String(self.reversed())
    }
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var alphaNumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics).joined().lowercased()
    }
    var asciiAlphaNumeric: String {
        return String(unicodeScalars.filter { scalar in
            return (scalar.value >= 0x41 && scalar.value <= 0x5A) || (scalar.value >= 0x61 && scalar.value <= 0x7A) || (scalar.value >= 0x30 && scalar.value <= 0x39)
        })
    }
    func isASCII() -> Bool {
        return self.utf8.allSatisfy { $0 < 128 }
    }
}
