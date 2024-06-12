//
//  Quality.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-09.
//

import SwiftUI

enum Quality {
    case major
    case minor
    case diminished
    
    var color: Color {
        switch self {
        case .major:
            Color("MajorColor")
        case .minor:
            Color("MinorColor")
        case .diminished:
            Color("DiminishedColor")
        }
    }
}
