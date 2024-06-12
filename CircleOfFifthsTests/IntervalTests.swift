//
//  IntervalTests.swift
//  CircleOfFifthsTests
//
//  Created by Anders Lindskog on 2024-06-11.
//

import XCTest
@testable import CircleOfFifths

final class IntervalTests: XCTestCase {

    func testScaleIntervals() throws {
        let majorScaleIntervals = Interval.majorScaleIntervals
        
        XCTAssertEqual(majorScaleIntervals.count, 7)
        XCTAssertEqual(majorScaleIntervals.filter({ $0.quality == .major }).count, 3)
        XCTAssertEqual(majorScaleIntervals.filter({ $0.quality == .minor }).count, 3)
        XCTAssertEqual(majorScaleIntervals.filter({ $0.quality == .diminished }).count, 1)
        XCTAssertEqual(majorScaleIntervals.first?.degree, "I")
        XCTAssertEqual(majorScaleIntervals.last?.degree, "vii°")
        
        let minorScaleIntervals = Interval.minorScaleIntervals
        
        XCTAssertEqual(minorScaleIntervals.count, 7)
        XCTAssertEqual(minorScaleIntervals.filter({ $0.quality == .major }).count, 3)
        XCTAssertEqual(minorScaleIntervals.filter({ $0.quality == .minor }).count, 3)
        XCTAssertEqual(minorScaleIntervals.filter({ $0.quality == .diminished }).count, 1)
        XCTAssertEqual(minorScaleIntervals.first?.degree, "i")
        XCTAssertEqual(minorScaleIntervals.last?.degree, "VII")
    }
    
    func testScaleFifths() throws {
        let majorScaleFifths = Interval.majorScaleFifths
        
        XCTAssertEqual(majorScaleFifths.count, 12)
        XCTAssertEqual(majorScaleFifths.filter({ $0?.quality == .major }).count, 3)
        XCTAssertEqual(majorScaleFifths.filter({ $0?.quality == .minor }).count, 3)
        XCTAssertEqual(majorScaleFifths.filter({ $0?.quality == .diminished }).count, 1)
        XCTAssertEqual(majorScaleFifths.filter({ $0?.quality == nil }).count, 5)
        XCTAssertEqual(majorScaleFifths.first??.degree, "I")
        XCTAssertEqual(majorScaleFifths.last??.degree, "IV")
        
        let minorScaleFifths = Interval.minorScaleFifths
        
        XCTAssertEqual(minorScaleFifths.count, 12)
        XCTAssertEqual(minorScaleFifths.filter({ $0?.quality == .major }).count, 3)
        XCTAssertEqual(minorScaleFifths.filter({ $0?.quality == .minor }).count, 3)
        XCTAssertEqual(minorScaleFifths.filter({ $0?.quality == .diminished }).count, 1)
        XCTAssertEqual(minorScaleFifths.filter({ $0?.quality == nil }).count, 5)
        XCTAssertEqual(minorScaleFifths.first??.degree, "i")
        XCTAssertEqual(minorScaleFifths.last??.degree, "iv")
    }
}
