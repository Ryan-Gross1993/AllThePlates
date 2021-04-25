//
//  PlateSettingsView.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 4/23/21.
//

import SwiftUI

struct PlateSettingsView: View {
    @Binding var targetWgt: Double
    @Binding var barWgt: Double
    
    var body: some View {
        VStack {
            Text("Target: \(PlateUtility.format(targetWgt))")
            Slider(value: $targetWgt, in: 0...500, step: 5)
            
            Spacer()
            
            Text("Bar: \(PlateUtility.format(barWgt))")
            Slider(value: $barWgt, in: 0...100, step: 5)
            Spacer()
        }
    }
}
