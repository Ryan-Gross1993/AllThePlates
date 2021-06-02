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
            NavigationLink(destination: ChangeWeightsView()) {
                Text("Change Weights")
            }.buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            NavigationLink(destination: AvailablePlatesView()) {
                Text("Available Plates")
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
