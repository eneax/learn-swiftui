//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Enea Xharja on 15.04.25.
//

import SwiftUI

// Extend ShapeStyle only when it is used as a color
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(.black)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
