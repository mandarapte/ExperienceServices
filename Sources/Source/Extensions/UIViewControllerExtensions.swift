//
//  UIViewControllerExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit
import StoreKit
import AVFoundation

// MARK: - UIViewController Extension
public extension UIViewController {
    func localCurrencyFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter
    }
    func calculateDiscount(primary: Double, secondary: Double) -> Double {
        return (100.0-((primary/secondary)*100.0)).round(to: 2)
    }
    func appVersion() -> (version: String, build: String) {
        return ("\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "")", "\(Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? "")")
    }
    func systemVersion() -> String {
        #if targetEnvironment(macCatalyst)
        let service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"))
        var modelIdentifier: String?
        if let modelData = IORegistryEntryCreateCFProperty(service, "model" as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? Data {
            modelIdentifier = String(data: modelData, encoding: .utf8)?.trimmingCharacters(in: .controlCharacters)
        }
        IOObjectRelease(service)
        return "\(modelIdentifier ?? "")" + " " + "macOS" + " " + "\(ProcessInfo.processInfo.operatingSystemVersionString)"
        #endif
        #if !targetEnvironment(macCatalyst)
        var utsnameInstance = utsname()
        uname(&utsnameInstance)
        let machineString: String? = withUnsafePointer(to: &utsnameInstance.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String(validatingCString: ptr)
            }
        }
        return "\(machineString ?? "")" + " " + "\(UIDevice.current.systemName)" + " " + "\(UIDevice.current.systemVersion)"
        #endif
    }
    func errorAlert(title: String = "Error", message: String = "Unexpected error occurred, don't worry no data was lost.", buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default) { (action: UIAlertAction!) in
        })
        self.present(alert, animated: true)
    }
    func successAlert(title: String = "Success", message: String = "Action was successful.", buttonTitle: String = "Done") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel) { (action: UIAlertAction!) in
        })
        self.present(alert, animated: true)
    }
    func getSafeAreaSize() -> (left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (left: windows?.safeAreaInsets.left ?? 0.0, top: windows?.safeAreaInsets.top ?? 0.0, right: windows?.safeAreaInsets.right ?? 0.0, bottom: windows?.safeAreaInsets.bottom ?? 0.0)
    }
    func getDeviceDetails(view: UIView) -> (nativeHeight: CGFloat, nativeWidth: CGFloat, frameHeight: CGFloat, frameWidth: CGFloat, boundsHeight: CGFloat, boundsWidth: CGFloat, statusBarHeight: CGFloat, radius: CGFloat) {
        return (UIScreen.main.nativeBounds.height, UIScreen.main.nativeBounds.width, view.frame.size.height, view.frame.size.width, view.bounds.size.height, view.bounds.size.width, view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0, view.window?.screen.displayCornerRadius ?? 0.0)
    }
    func launchWebPage(string: String) {
        if let url = URL(string: string) {
            UIApplication.shared.open(url)
        }
    }
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func scrollToTop(view: UICollectionView) {
        view.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1.0, height: 1.0), animated: true)
    }
    @objc func scrollToBottom(view: UICollectionView) {
        view.scrollRectToVisible(CGRect(x: 0, y: view.contentSize.height-1.0, width: 1.0, height: 1.0), animated: true)
    }
    var windowInterfaceOrientation: UIInterfaceOrientation? {
        return windows?.windowScene?.interfaceOrientation
    }
}
