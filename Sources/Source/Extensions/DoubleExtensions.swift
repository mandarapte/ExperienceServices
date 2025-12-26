//
//  DoubleExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - Double Extensions
@MainActor
public extension Double {
    func round(to n: Int) -> Double {
        let multiplier = pow(10.0, Double(n))
        return (self * multiplier).rounded()/multiplier
    }
}
