//
//  PlateView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

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
        case 45.0:
            return .red
        default:
            return .yellow
        }
    }
}
