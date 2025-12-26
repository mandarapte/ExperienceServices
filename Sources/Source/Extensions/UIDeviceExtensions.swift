//
//  UIDeviceExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - UIDevice Extensions
@MainActor
public extension UIDevice {
    static var isMacCatalyst: Bool = {
        #if targetEnvironment(macCatalyst)
        return true
        #else
        return false
        #endif
    }()
    static var isMac: Bool = {
        switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .mac:
                return true
            default:
                return false
        }
    }()
    static var isPhone: Bool = {
        switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .phone:
                return true
            default:
                return false
        }
    }()
    static var isPad: Bool = {
        switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .pad:
                return true
            default:
                return false
        }
    }()
    static var isWatchOS: Bool = {
        #if os(watchOS)
        return true
        #else
        return false
        #endif
    }()
    static var isTV: Bool = {
        switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .tv:
                return true
            default:
                return false
        }
    }()
    static var isSimulator: Bool = {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }()
    static var hasNotch: Bool = {
        if windows?.safeAreaInsets.bottom ?? 0.0 > 0.0 {
            return true
        } else {
            return false
        }
    }()
}
