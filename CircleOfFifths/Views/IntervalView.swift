//
//  IntervalView.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-09.
//

import SwiftUI

struct IntervalView: View {
    private let index: Int
    private let name: String?
    private let radius: CGFloat
    private let backgroundColor: Color
    private let font: Font
    
    private let startAngle: Double
    private let endAngle: Double
    private let textRotation: Double
    private var textOffsetX: Double
    private var textOffsetY: Double
    
    var body: some View {
        GeometryReader { geometry in
            let startPoint = CGPoint(x: geometry.size.width / 2, 
                                     y: geometry.size.height / 2)
            
            Path { path in
                path.move(to: startPoint)
                path.addArc(center: startPoint, 
                            radius: radius,
                            startAngle: .degrees(startAngle),
                            endAngle: .degrees(endAngle),
                            clockwise: false)
                path.closeSubpath()
            }
            .fill(backgroundColor)
            .stroke(Color("BorderColor"), lineWidth: name != nil ? 1 : 0)
            .overlay(
                Text(name ?? "")
                         .font(font)
                         .bold()
                         .foregroundColor(Color("ForegroundColor"))
                         .rotationEffect(.degrees(textRotation))
                         .offset(x: textOffsetX, y: textOffsetY)
                         .accessibilityAddTraits(.isButton)
                        )
        }
        .rotationEffect(.degrees(Double(index * 30)))
    }
    
    init(index: Int, 
         name: String? = nil,
         radius: CGFloat,
         backgroundColor: Color = .clear,
         textOffset: CGFloat = 20,
         rotateText: Bool = true,
         font: Font = .headline) {
        self.index = index
        self.name = name
        self.radius = radius
        self.backgroundColor = backgroundColor
        self.font = font
        
        startAngle = 255
        endAngle = 255 + 30
        textRotation = rotateText ? Double(Double(index) * -30) : 0
        textOffsetX = 0
        textOffsetY = -radius + textOffset
    }
}

#Preview {
    IntervalView(index: 0, name: "C", radius: 150, backgroundColor: .red)
}
