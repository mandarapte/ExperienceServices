//
//  NSLayoutConstraintExtension.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - NSLayoutConstraint Extension
@MainActor
public extension NSLayoutConstraint {
    func withPriority(_ priority: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(priority)
        return self
    }
}
