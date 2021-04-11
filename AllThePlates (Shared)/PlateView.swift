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
        Text(PlateUtility.format(self.wgt))
            .frame(width: 25, height: 100)
            .background(Rectangle().foregroundColor(self.color))
            .border(Color.black, width: CGFloat(self.borderWidth))
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
