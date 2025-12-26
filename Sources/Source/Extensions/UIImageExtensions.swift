//
//  UIImageExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - UIImage Extension for Image Resize
public extension UIImage {
    func resize(size: CGSize, alpha: CGFloat = 1.0) -> UIImage {
        return UIGraphicsImageRenderer(size:size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: alpha)
        }
    }
    func crop(to rect: CGRect) -> UIImage? {
        var rect = rect
        rect.size.width = rect.size.width * self.scale
        rect.size.height = rect.size.height * self.scale
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return nil
        }
        return UIImage(cgImage: imageRef)
    }
    func with(insets: UIEdgeInsets) -> UIImage {
        let targetWidth = size.width + insets.left + insets.right
        let targetHeight = size.height + insets.top + insets.bottom
        let targetSize = CGSize(width: targetWidth, height: targetHeight)
        let targetOrigin = CGPoint(x: insets.left, y: insets.top)
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
            draw(in: CGRect(origin: targetOrigin, size: size))
        }.withRenderingMode(renderingMode)
    }
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(at: .zero, blendMode: .normal, alpha: alpha)
        }
    }
}

// MARK: - UIViewController Extension
public extension UIView {
    func asRetinaImage(scale: CGFloat? = nil) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale ?? 0
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds, format: format)
        return renderer.image { context in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }
}

// MARK: - String extension converts emoji string to UIImage
public extension String {
    func emojiToUIImage(fontSize:CGFloat = 40.0, bgColor:UIColor = .clear, imageSize:CGSize? = nil) -> UIImage? {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let imageSize = imageSize ?? self.size(withAttributes: attributes as [NSAttributedString.Key : Any])
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        bgColor.set()
        let rect = CGRect(origin: .zero, size: imageSize)
        UIRectFill(rect)
        self.draw(in: rect, withAttributes: [.font: font as Any])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
