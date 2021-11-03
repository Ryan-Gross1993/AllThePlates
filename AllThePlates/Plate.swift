//
//  Plate.swift
//  AllThePlates
//
//  Created by Ryan Gross on 11/3/21.
//

import Foundation

struct Plate: Hashable {
    var wgt: Double
    var qt: Int
    
    func getHeight() -> Double {
        switch self.wgt {
        case 100.0:
            return 1.0
        case 55.0:
            return 0.9
        case 45.0:
            return 0.8
        case 35.0:
            return 0.7
        case 25.0:
            return 0.6
        case 15.0:
            return 0.5
        case 10.0:
            return 0.4
        case 5.0:
            return 0.3
        case 2.5:
            return 0.25
        default:
            return 0.0
        }
    }
    
    func getWidth() -> Double {
        switch self.wgt {
        case 100.0, 55.0, 45.0:
            return 1.0
        case 35.0:
            return 0.9
        case 25.0:
            return 0.8
        case 15.0:
            return 0.7
        case 10.0:
            return 0.6
        case 5.0:
            return 0.5
        case 2.5:
            return 0.4
        default:
            return 0.0
        }
    }
}
