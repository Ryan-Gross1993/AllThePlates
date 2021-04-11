//
//  PlateUtility.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/16/21.
//

import Foundation

struct PlateUtility {
    private static let plateWgts: [Double] = [2.5, 5, 10, 15, 25, 35, 45, 55, 100]
    
    static var wgtFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.minimumSignificantDigits = 1
        formatter.maximumSignificantDigits = 5
        return formatter
    }()
    
    static func format(_ wgt: Double) -> String {
        return wgtFormat.string(from: NSNumber(value: wgt)) ?? ""
    }
    
    static func generatePlates(qt: Int = 0) -> [Plate] {
        var plates: [Plate] = []
        
        for value in plateWgts {
            plates.append(Plate(wgt: value, qt: qt))
        }
        
        return plates
    }
    
    static func calculate(targetWgt: Double, barWgt: Double, plates: [Plate]) -> [Plate]? {
        var wgtOfPlates = targetWgt - barWgt
        var reqPlates: [Plate] = []
        
        if targetWgt == barWgt {
            return []
        } else {
            for plate in plates.filter({ $0.qt > 0}).sorted(by: {$0.wgt >= $1.wgt}) {
                let qt = Double(plate.qt)
                
                if plate.wgt > wgtOfPlates {
                    continue
                }
                
                var numAvailable = floor(wgtOfPlates / plate.wgt)
                
                if numAvailable > qt {
                    numAvailable = qt
                }
                                
                if Int(numAvailable) % 2 > 0 {
                    if numAvailable > 2.0 {
                        numAvailable -= 1.0
                    } else {
                        continue
                    }
                }
                
                wgtOfPlates -= plate.wgt * numAvailable
                let plate = Plate.init(wgt: plate.wgt, qt: Int(floor(numAvailable) / 2))
                reqPlates.append(plate)
            }
            
            return wgtOfPlates == 0.0 ? reqPlates : nil
        }
    }
}
