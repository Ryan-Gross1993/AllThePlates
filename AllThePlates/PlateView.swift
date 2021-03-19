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
    var qt: String
}

struct PlateView: View, TextGeneratable {
    let wgt: Double
    var color: Color = .clear
    
    init(wgt: Double) {
        self.wgt = wgt
        self.color = getColor()
    }
    
    var body: some View {
        Text(String(determineText(val: self.wgt)))
            .frame(width: 25, height: 100)
            .background(Rectangle().foregroundColor(self.color))
    }
    
    private func getColor() -> Color {
        switch self.wgt {
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
            return .purple
        case 2.5:
            return .pink
        default:
            return .gray
        }
    }
}
