//
//  PlateCalculatorTests.swift
//  AllThePlatesTests
//
//  Created by Ryan Gross on 3/2/21.
//

import XCTest
@testable import AllThePlates

class PlateCalculatorTests: XCTestCase {
    let barWgt = 45
    var targetWgt = 0
    
    lazy var availPlates: [Plate] = {
        var plates: [Plate] = []
        
        for weight in [100, 45, 25, 10, 2.5, 55, 35, 15, 5, 1.25] {
            if (2.5...45).contains(weight) {
                plates.append(Plate(wgt: weight, qt: "6"))
            } else {
                plates.append(Plate(wgt: weight, qt: "0"))
            }
        }
        
        return plates
    }()

    func testPlateCalculator_Bar() throws {
        targetWgt = 45
        let plates = PlateCalculator.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: availPlates)
        XCTAssertTrue(plates.isEmpty)
    }
    
    func testPlateCalculator_ThreeFifteen() {
        targetWgt = 315
        let plates = PlateCalculator.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: availPlates)
        XCTAssertEqual(plates.count, 1)
        XCTAssertEqual(plates[0].wgt, 45)
        XCTAssertEqual(plates[0].qt, "3")
    }
    
    func testPlateCalculator_FiveTwenty() {
        targetWgt = 520
        let plates = PlateCalculator.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: availPlates)

        XCTAssertEqual(plates.count, 5)
        
        XCTAssertEqual(plates[0].wgt, 2.5)
        XCTAssertEqual(plates[1].wgt, 5)
        XCTAssertEqual(plates[2].wgt, 25)
        XCTAssertEqual(plates[3].wgt, 35)
        XCTAssertEqual(plates[4].wgt, 5)
        
        XCTAssertEqual(plates[0].qt, "1")
        XCTAssertEqual(plates[1].qt, "1")
        XCTAssertEqual(plates[2].qt, "1")
        XCTAssertEqual(plates[3].qt, "2")
        XCTAssertEqual(plates[4].qt, "3")
    }
}
