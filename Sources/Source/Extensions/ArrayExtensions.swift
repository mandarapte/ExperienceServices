//
//  ArrayExtensions.swift
//  ExperienceServices
//
//  Created by Mandar Apte on 25/12/25.
//

// MARK: - Import Frameworks
import UIKit

// MARK: - Array Extensions
public extension Array where Element == Int {
    func sum() -> Int {
        return reduce(0, +)
    }
}
public extension Array where Element == CGFloat {
    func sum() -> CGFloat {
        return reduce(0, +)
    }
}
public extension Array where Element == String {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
public extension Array where Element == Int {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
public extension Array where Element == CGFloat {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
public extension UIViewController {
    func createChunksOfArrays(database: [String], count: Int) -> String {
        var result = String()
        for (index, chunk) in database.chunked(into: count).enumerated() {
            result = "Chunk \(index + 1): \(chunk)"
        }
        return result
    }
    func createChunksOfArrays(database: [Int], count: Int) -> String {
        var result = String()
        for (index, chunk) in database.chunked(into: count).enumerated() {
            result = "Chunk \(index + 1): \(chunk)"
        }
        return result
    }
    func createChunksOfArrays(database: [CGFloat], count: Int) -> String {
        var result = String()
        for (index, chunk) in database.chunked(into: count).enumerated() {
            result = "Chunk \(index + 1): \(chunk)"
        }
        return result
    }
}
