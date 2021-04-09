//
//  ContentView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var wgtsVisible = false
    @State var platesVisible = false
    @State var targetWgt = 0.0
    @State var barWgt = 0.0
    @State var plates = PlateUtility.generatePlates()
    
    var body: some View {
        VStack {
            HStack {
                WeightEditText(label: "Target Weight", wgtValue: $targetWgt)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                WeightEditText(label: "Bar Weight", wgtValue: $barWgt)
                    .padding(.trailing, 10)
            }
            .padding(.top, 35)
            HStack {
                Button(action: {
                    self.platesVisible = false
                    self.wgtsVisible = !wgtsVisible
                }, label: {
                    Text("Set Weights")
                        .font(.body)
                    
                })
                Button(action: {
                    self.wgtsVisible = false
                    self.platesVisible = !platesVisible
                }, label: {
                    Text("Calculate")
                })
            }
            
            if wgtsVisible {
                PlateList(plates: $plates)
            }

            Spacer()
            
            if platesVisible {
                if let targetWgt = Double(targetWgt), let barWgt = Double(barWgt), let plates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: plates) {
                    BarbellView(plates: plates)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
