//
//  PlateView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

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
            return 0.2
        default:
            return 0.0
        }
    }
}

struct PlateView: View {
    let wgt: Double
    var color: Color = .clear
    var borderWidth = 0
    
    init(wgt: Double) {
        self.wgt = wgt
        self.color = getColor()
        
        if self.color == .white {
            self.borderWidth = 1
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(self.color)
            Text(PlateUtility.format(self.wgt))
                .background(self.color)
                .foregroundColor(.black)
                .scaledToFit()
        }
    }
    
    private func getColor() -> Color {
        switch self.wgt {
        case 100.0:
            return Color("forestGreen")
        case 55.0:
            return .red
        case 45.0:
            return .blue
        case 35.0:
            return .yellow
        case 25.0:
            return .green
        case 15.0:
            return .orange
        case 10.0:
            return .white
        case 5.0:
            return Color("aqua")
        case 2.5:
            return Color("limeGreen")
        default:
            return .white
        }
    }
}
