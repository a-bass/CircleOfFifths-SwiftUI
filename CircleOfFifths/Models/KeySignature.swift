//
//  KeySignature.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-07.
//

import Foundation

struct KeySignature {
    let key: Key
    let major: String
    let minor: String
    let diminished: String
    let sharpAccidentals: [String]
    var flatAccidentals: [String]
    
    static func `for`(key: Key) -> KeySignature {
        switch key {
        case .cMajor:
            return KeySignature(key: .cMajor, major: "C", minor: "a", diminished: "b°", sharpAccidentals: [], flatAccidentals: [])
        case .gMajor:
            return KeySignature(key: .gMajor, major: "G", minor: "e", diminished: "f♯°", sharpAccidentals: sharps(1), flatAccidentals: [])
        case .dMajor:
            return KeySignature(key: .dMajor, major: "D", minor: "b", diminished: "c♯°", sharpAccidentals: sharps(2), flatAccidentals: [])
        case .aMajor:
            return KeySignature(key: .aMajor, major: "A", minor: "f♯", diminished: "g♯°", sharpAccidentals: sharps(3), flatAccidentals: [])
        case .eMajor:
            return KeySignature(key: .eMajor, major: "E", minor: "c♯", diminished: "d♯°", sharpAccidentals: sharps(4), flatAccidentals: [])
        case .bMajor:
            return KeySignature(key: .bMajor, major: "B/C♭", minor: "g♯/a♭", diminished: "a♯°", sharpAccidentals: sharps(5), flatAccidentals: flats(7))
        case .gFlatMajor:
            return KeySignature(key: .gFlatMajor, major: "F♯/G♭", minor: "d♯/e♭", diminished: "e♯°/f°", sharpAccidentals: sharps(6), flatAccidentals: flats(6))
        case .dFlatMajor:
            return KeySignature(key: .dFlatMajor, major: "D♭/C♯", minor: "b♭/a♯", diminished: "c°", sharpAccidentals: sharps(7), flatAccidentals: flats(5))
        case .aFlatMajor:
            return KeySignature(key: .aFlatMajor, major: "A♭", minor: "f", diminished: "g°", sharpAccidentals: [], flatAccidentals: flats(4))
        case .eFlatMajor:
            return KeySignature(key: .eFlatMajor, major: "E♭", minor: "c", diminished: "d°", sharpAccidentals: [], flatAccidentals: flats(3))
        case .bFlatMajor:
            return KeySignature(key: .bFlatMajor, major: "B♭", minor: "g", diminished: "a°", sharpAccidentals: [], flatAccidentals: flats(2))
        case .fMajor:
            return KeySignature(key: .fMajor, major: "F", minor: "d", diminished: "f°", sharpAccidentals: [], flatAccidentals: flats(1))
        }
    }

    static var all: [KeySignature] {
        Key.allCases.map { key in
            KeySignature.for(key: key)
        }
    }
    
    var majorChords: [[String]] {
        switch key {
        case .cMajor:
            [["C", "d", "e", "F", "G", "a", "b°"], []]
        case .gMajor:
            [["G", "a", "b", "C", "D", "e", "f♯°"], []]
        case .dMajor:
            [["D", "e", "f♯", "G", "A", "b°", "c♯°"], []]
        case .aMajor:
            [["A", "b°", "c♯", "D", "E", "f♯", "g♯°"], []]
        case .eMajor:
            [["E", "f♯", "g♯", "A", "B", "c♯", "d♯°"], []]
        case .bMajor:
            [["B", "c♯", "d♯", "E", "F♯", "g♯", "a♯°"],
             ["C♭", "d♭", "e♭", "F♭", "G♭", "a♭", "b♭°"]]
        case .gFlatMajor:
            [["F♯", "g♯", "a♯", "B♭", "C♯", "d♯", "e♯°"],
             ["G♭", "a♭", "b♭", "C♭", "D♭", "e♭", "f°"]]
        case .dFlatMajor:
            [["C♯", "d♯", "e♯", "F♯", "G♯", "a♯", "b♯°"],
             ["D♭", "e♭", "f", "G♭", "A♭", "b♭", "c°"]]
        case .aFlatMajor:
            [["A♭", "b♭", "c", "D♭", "E♭", "f", "g°"], []]
        case .eFlatMajor:
            [["E♭", "f", "g", "A♭", "B♭", "c", "d°"], []]
        case .bFlatMajor:
            [["B♭", "c", "d", "E♭", "F", "g", "a°"], []]
        case .fMajor:
            [["F", "g", "a", "B♭", "C", "d", "e°"], []]
        }
    }
    
    var minorChords: [[String]] {
        majorChords.map { chords in
            chords.enumerated().map { (index, _) in
                return chords[(index + 5) % 7]
            }
        }
    }
    
    private static func sharps(_ count: Int) -> [String] {
        let slice = ["F♯", "C♯", "G♯", "D♯", "A♯", "E♯", "B♯"].prefix(count)
        return Array(slice)
    }
    
    private static func flats(_ count: Int) -> [String] {
        let slice = ["B♭", "E♭", "A♭", "D♭", "G♭", "C♭", "F♭"].prefix(count)
        return Array(slice)
    }
}
