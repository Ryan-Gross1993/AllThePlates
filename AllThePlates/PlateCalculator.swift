//
//  PlateCalculator.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/16/21.
//

import Foundation

struct PlateCalculator {
    static func calculate(targetWgt: Double, barWgt: Double, plates: [Plate]) -> [Plate]? {
        var wgtOfPlates = targetWgt - barWgt
        var reqPlates: [Plate] = []
        
        for plate in plates {
            if plate.wgt > wgtOfPlates && wgtOfPlates > 0.0 {
                guard let qt = Double(plate.qt) else {
                    continue
                }
                
                var numNeeded = ceil(wgtOfPlates / qt)
                
                if numNeeded.truncatingRemainder(dividingBy: 2.0) > 0.0 {
                    if numNeeded > 2.0 {
                        numNeeded -= 1.0
                    } else {
                        continue
                    }
                }
                
                wgtOfPlates -= plate.wgt * numNeeded
                let plate = Plate.init(wgt: plate.wgt, qt: String(format: "%g", numNeeded / 2.0))
                reqPlates.append(plate)
            }
        }
        
        return wgtOfPlates == 0.0 ? reqPlates : nil
    }
}
