//
//  Interval.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-09.
//

import Foundation

struct Interval: Hashable {
    let degree: String
    let quality: Quality
    
    static var majorScaleIntervals: [Interval] {
        [
            Interval(degree: "I", quality: .major),
            Interval(degree: "ii", quality: .minor),
            Interval(degree: "iii", quality: .minor),
            Interval(degree: "IV", quality: .major),
            Interval(degree: "V", quality: .major),
            Interval(degree: "vi", quality: .minor),
            Interval(degree: "vii°", quality: .diminished)
        ]
    }
    
    static var minorScaleIntervals: [Interval] {
        [
            Interval(degree: "i", quality: .minor),
            Interval(degree: "ii°", quality: .diminished),
            Interval(degree: "III", quality: .major),
            Interval(degree: "iv", quality: .minor),
            Interval(degree: "v", quality: .minor),
            Interval(degree: "VI", quality: .major),
            Interval(degree: "VII", quality: .major)
        ]
    }
    
    static var majorScaleFifths: [Interval?] {
        [
            Interval(degree: "I", quality: .major),
            Interval(degree: "V", quality: .major),
            Interval(degree: "ii", quality: .minor),
            Interval(degree: "vi", quality: .minor),
            Interval(degree: "iii", quality: .minor),
            Interval(degree: "vii°", quality: .diminished),
            nil,
            nil,
            nil,
            nil,
            nil,
            Interval(degree: "IV", quality: .major),
        ]
    }
    
    static var minorScaleFifths: [Interval?] {
        [
            Interval(degree: "i", quality: .minor),
            Interval(degree: "v", quality: .minor),
            Interval(degree: "ii°", quality: .diminished),
            nil,
            nil,
            nil,
            nil,
            nil,
            Interval(degree: "VI", quality: .major),
            Interval(degree: "III", quality: .major),
            Interval(degree: "VII", quality: .major),
            Interval(degree: "iv", quality: .minor),
        ]
    }
}
