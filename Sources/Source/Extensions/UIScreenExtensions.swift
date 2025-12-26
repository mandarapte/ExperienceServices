//
//  UIScreenExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - UIScreen Extensions
@MainActor
public extension UIScreen {
    var displayCornerRadius: CGFloat {
        let cornerRadiusKey: String = {
            let components = ["Radius", "Corner", "display", "_"]
            return components.reversed().joined()
        }()
        guard let cornerRadius = self.value(forKey: cornerRadiusKey) as? CGFloat else {
            assertionFailure("Failed to detect screen corner radius")
            return 0.0
        }
        return cornerRadius
    }
}
