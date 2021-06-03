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
        VStack(spacing: 15) {
            NavigationLink(destination: ChangeWeightsView()) {
                Text("Change Weights")
            }.buttonStyle(DefaultButtonStyle())
            
            
            NavigationLink(destination: AvailablePlatesView()) {
                Text("Available Plates")
            }.buttonStyle(DefaultButtonStyle())
        }
    }
}
