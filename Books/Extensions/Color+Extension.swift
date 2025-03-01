//
//  Color+Extension.swift
//  Books
//
//  Created by Bruno Mazzocchi on 1/3/25.
//

import SwiftUI

// MARK: - **Gradient Parsing**
extension Color {
    static func gradient(from hexString: String) -> LinearGradient {
        let hexColors = hexString.split(separator: ",").map { String($0) }
        let colors = hexColors.compactMap { Color(hex: $0) }
        
        return LinearGradient(
            colors: colors.isEmpty ? [.gray] : colors,
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

// MARK: - **Hex to Color Extension**
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let (r, g, b, a): (Double, Double, Double, Double)
        switch hex.count {
        case 6: // RGB
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
            a = 1.0
        case 8: // ARGB
            a = Double((int >> 24) & 0xFF) / 255.0
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            r = 0.5
            g = 0.5
            b = 0.5
            a = 1.0
        }
        self = Color(red: r, green: g, blue: b, opacity: a)
    }
}
