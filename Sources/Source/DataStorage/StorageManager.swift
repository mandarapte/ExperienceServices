//
//  StorageManager.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - Window Scene Property Declaration
@MainActor
public let scenes = UIApplication.shared.connectedScenes
@MainActor
public let windowScenes = scenes.first as? UIWindowScene
@MainActor
public let windows = windowScenes?.windows.first

// MARK: - NSUserDefault Property Declaration
@MainActor
public let NSUserDefault = UserDefaults.standard

// MARK: - NSNotificationCenter Property Declaration
@MainActor
public let NSNotificationCenter = NotificationCenter.default
