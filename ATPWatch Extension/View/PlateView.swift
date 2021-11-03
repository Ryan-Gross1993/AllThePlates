//
//  PlateView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

protocol PlateDrawable {
    func getColor(val: Double) -> Color
}

extension PlateDrawable {
    func getColor(val: Double) -> Color {
        switch val {
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

struct PlateView: View, PlateDrawable {
    let wgt: Double
    var color: Color = .clear
    var borderWidth = 0
    
    init(wgt: Double) {
        self.wgt = wgt
        self.color = getColor(val: wgt)
        
        if self.color == .white {
            self.borderWidth = 1
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(self.color)
        }
    }
}
