//
//  UIStackViewExtensions.swift
//  ExperienceServices
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - UIViewController Extension
public extension UIStackView {
    func removeAllArrangedSubviews() {
        for view in arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
