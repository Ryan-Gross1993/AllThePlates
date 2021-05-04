//
//  HeaderView.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 5/4/21.
//

import SwiftUI

struct HeaderView: View {
    @Binding var targetWgt: Double
    @Binding var barWgt: Double
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            VStack(alignment: HorizontalAlignment.leading) {
                Text("Bar: \(PlateUtility.format(self.barWgt))")
                Text("Target: \(PlateUtility.format(self.targetWgt))")
            }
            Spacer()
            
            NavigationLink(destination: PlateSettingsView(targetWgt: $targetWgt, barWgt: $barWgt)) {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 30, height: 30, alignment: .center)
        }
    }
}
