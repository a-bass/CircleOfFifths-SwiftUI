//
//  KeySignatureTests.swift
//  CircleOfFifthsTests
//
//  Created by Anders Lindskog on 2024-06-07.
//

import XCTest
@testable import CircleOfFifths

final class KeySignatureTests: XCTestCase {
    
    func testKeySignatures() throws {
        let allKeySignatures = KeySignature.all
        
        XCTAssertEqual(allKeySignatures.count, 12)
        
        let cMajor = allKeySignatures.first
        XCTAssertEqual(cMajor?.major, "C")
        XCTAssertEqual(cMajor?.minor, "a")
        XCTAssertEqual(cMajor?.diminished, "b°")
        XCTAssertEqual(cMajor?.sharpAccidentals.count, 0)
        XCTAssertEqual(cMajor?.flatAccidentals.count, 0)
        
        let gFlatMajor = allKeySignatures.first(where: { $0.key == .gFlatMajor })
        XCTAssertEqual(gFlatMajor?.major, "F♯/G♭")
        XCTAssertEqual(gFlatMajor?.minor, "d♯/e♭")
        XCTAssertEqual(gFlatMajor?.diminished, "e♯°/f°")
        XCTAssertEqual(gFlatMajor?.sharpAccidentals.count, 6)
        XCTAssertEqual(gFlatMajor?.sharpAccidentals, ["F♯", "C♯", "G♯", "D♯", "A♯", "E♯"])
        XCTAssertEqual(gFlatMajor?.flatAccidentals.count, 6)
        XCTAssertEqual(gFlatMajor?.flatAccidentals, ["B♭", "E♭", "A♭", "D♭", "G♭", "C♭"])
    }
    
    func testKeySignatureChords() throws {
        let cMajorKey = KeySignature.for(key: .cMajor)
        
        let cMajorChords = cMajorKey.majorChords
        XCTAssertEqual(cMajorChords.count, 2)
        XCTAssertEqual(cMajorChords.first?.count, 7)
        XCTAssertEqual(cMajorChords.last?.count, 0)
        XCTAssertEqual(cMajorChords.first, ["C", "d", "e", "F", "G", "a", "b°"])
        
        let aMinorChords = cMajorKey.minorChords
        XCTAssertEqual(aMinorChords.count, 2)
        XCTAssertEqual(aMinorChords.first?.count, 7)
        XCTAssertEqual(aMinorChords.last?.count, 0)
        XCTAssertEqual(aMinorChords.first, ["a", "b°", "C", "d", "e", "F", "G"])
        
        let gFlatMajorKey = KeySignature.for(key: .gFlatMajor)
        
        let gFlatMajorChords = gFlatMajorKey.majorChords
        XCTAssertEqual(gFlatMajorChords.count, 2)
        XCTAssertEqual(gFlatMajorChords.first?.count, 7)
        XCTAssertEqual(gFlatMajorChords.first, ["F♯", "g♯", "a♯", "B♭", "C♯", "d♯", "e♯°"])
        XCTAssertEqual(gFlatMajorChords.last?.count, 7)
        XCTAssertEqual(gFlatMajorChords.last, ["G♭", "a♭", "b♭", "C♭", "D♭", "e♭", "f°"])
        
        let dSharpMinorChords = gFlatMajorKey.minorChords
        XCTAssertEqual(dSharpMinorChords.count, 2)
        XCTAssertEqual(dSharpMinorChords.first?.count, 7)
        XCTAssertEqual(dSharpMinorChords.first, ["d♯", "e♯°", "F♯", "g♯", "a♯", "B♭", "C♯"])
        XCTAssertEqual(dSharpMinorChords.last?.count, 7)
        XCTAssertEqual(dSharpMinorChords.last, ["e♭", "f°", "G♭", "a♭", "b♭", "C♭", "D♭"])
    }
}
