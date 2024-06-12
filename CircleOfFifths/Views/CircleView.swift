//
//  CircleView.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-10.
//

import SwiftUI

struct CircleView: View {
    @Binding var selectedKey: Key
    @State private var rotationAngle: Double = 0
    
    private let keySignatures = KeySignature.all
    private let majorIntervals = Interval.majorScaleFifths
    private let minorIntervals = Interval.minorScaleFifths
    private let outerDiameter: CGFloat = 360
    private let majorIntervalsHeight: CGFloat = 50
    private let majorKeysHeight: CGFloat = 70
    private let minorKeysHeight: CGFloat = 70
    private let minorIntervalsHeight: CGFloat = 50
    private let accidentalsHeight: CGFloat = 70
    
    private var majorKeysDiameter: CGFloat {
        outerDiameter - majorIntervalsHeight
    }
    private var minorKeysDiameter: CGFloat {
        majorKeysDiameter - majorKeysHeight
    }
    private var minorIntervalsDiameter: CGFloat {
        minorKeysDiameter - minorKeysHeight
    }
    private var accidentalsDiameter: CGFloat {
        minorIntervalsDiameter - minorIntervalsHeight
    }
    private var innerDiameter: CGFloat {
        accidentalsDiameter - accidentalsHeight
    }
    
    var body: some View {
        ZStack {
            
            // Major non interval background
            circleView(color: Color("BorderColor"), diameter: outerDiameter)

            // Major keys non interval background
            circleView(color: Color("BackgroundColor"), diameter: majorKeysDiameter)
            
            // Major intervals text and major intervals/keys background
            intervalView(intervals: majorIntervals, outerDiameter: outerDiameter, height: majorIntervalsHeight)

            // Major keys
            keySignatureView(quality: .major, outerDiameter: majorKeysDiameter, height: majorKeysHeight)
            
            // Minor keys non interval background
            circleView(color: Color("BackgroundColor"), diameter: minorKeysDiameter)
            
            // Minor key interval background
            intervalView(intervals: minorIntervals, outerDiameter: minorKeysDiameter, height: minorIntervalsHeight, hideText: true)
            
            // Minor keys
            keySignatureView(quality: .minor, outerDiameter: minorKeysDiameter, height: minorKeysHeight)
            
            // Minor non interval background
            circleView(color: Color("BorderColor"), diameter: minorIntervalsDiameter)
            
            // Minor intervals text and background
            intervalView(intervals: minorIntervals, outerDiameter: minorIntervalsDiameter, height: accidentalsHeight)
            
            // Accidentals
            ForEach(Array(keySignatures.enumerated()), id: \.offset) { index, key in
                IntervalView(index: index,
                             name: accidentalsText(sharps: key.sharpAccidentals.count, flats: key.flatAccidentals.count),
                             radius: accidentalsDiameter / 2,
                             backgroundColor: Color("BackgroundColor"),
                             textOffset: textOffset(for: accidentalsHeight),
                             font: Font.system(size: 11))
            }
            
            // Selectable keys
            ForEach(Array(keySignatures.enumerated()), id: \.offset) { index, key in
                IntervalView(index: index,
                             radius: outerDiameter / 2,
                             backgroundColor: key.key == selectedKey ? .clear : Color("UnselectedOverlayColor"))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            selectedKey = key.key
                            rotationAngle = Double(index * 30)
                        }
                    }
            }
            
            // Inner system background circle
            circleView(color: Color(UIColor.systemBackground), diameter: innerDiameter)
                .accessibilityElement() // Hides lower z-index objects from accessibility
                .accessibilityLabel("Circle of Fifths")
        }
    }
    
    @ViewBuilder func circleView(color: Color, diameter: CGFloat) -> some View {
        Circle()
            .fill(color)
            .stroke(Color("BorderColor"), lineWidth: 1)
            .frame(width: diameter, height: diameter)
    }
    
    @ViewBuilder func intervalView(intervals: [Interval?], outerDiameter: CGFloat, height: CGFloat, hideText: Bool = false) -> some View {
        ForEach(Array(intervals.enumerated()), id: \.offset) { index, interval in
            IntervalView(index: index,
                         name: !hideText ? interval?.degree : "",
                         radius: outerDiameter / 2,
                         backgroundColor: interval?.quality.color ?? .clear,
                         textOffset: textOffset(for: height),
                         rotateText: false,
                         font: Font.custom("Times", fixedSize: 14))
        }
        .rotationEffect(.degrees(rotationAngle))
    }
    
    @ViewBuilder func keySignatureView(quality: Quality, outerDiameter: CGFloat, height: CGFloat) -> some View {
        ForEach(Array(keySignatures.enumerated()), id: \.offset) { index, key in
            IntervalView(index: index,
                         name: quality == .major ? key.major : key.minor,
                         radius: outerDiameter / 2,
                         textOffset: textOffset(for: height),
                         font: Font.system(size: 16))
        }
    }
    
    func textOffset(for height: CGFloat, centered: Bool = true) -> CGFloat {
        (height / 2) / 2 // centered as radius
    }
    
    func accidentalsText(sharps: Int, flats: Int) -> String {
        var text = "♮"
        
        if sharps > 0 && flats > 0 {
            text = "\(sharps)♯\n\(flats)♭"
        } else if sharps > 0 {
            text = "\(sharps)♯"
        } else if flats > 0 {
            text = "\(flats)♭"
        }
            
        return text
    }
}

#Preview {
    CircleView(selectedKey: .constant(.cMajor))
}
