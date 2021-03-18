//
//  ContentView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 2/28/21.
//

import SwiftUI

struct Plate {
    var wgt: Double
    var qt: String
}

struct PlateList: View {
    @State var plates: [Plate] = PlateUtility.generatePlates()
    
    var body: some View {
        HStack {
            ForEach(0..<2, id: \.self) { row in
                let startIndex = row == 0 ? 0 : 5
                let endIndex = row == 0 ? 5 : 10
                VStack {
                    ForEach(startIndex..<endIndex, id: \.self) { index in
                        HStack {
                            Text("\(self.determineText(val: plates[index].wgt))")
                            TextField("0", text: $plates[index].qt)
                                .frame(width: 25, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                    }
                }
            }
        }
    }
    
 
    
    private func determineText(val: Double) -> String {
        if val.truncatingRemainder(dividingBy: 5.0) == 0.0 {
            return String(Int(val))
        } else if val == 2.5 {
            return String(format: "%.1f", val)
        } else {
            return String(format: "%.2f", val)
        }
    }
}

struct WeightEditText: View {
    var label: String
    @Binding var wgtValue: String
    
    
    var body: some View {
        HStack(alignment: .center) {
            Text(label)
            TextField("", text: $wgtValue)
                .fixedSize(horizontal: true, vertical: false)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
        }
    }
}

struct ContentView: View {
    @State var platesVisible = false
    @State var targetWgt = "0.0"
    @State var barWgt = "0.0"
    
    let plateList = PlateList()
    
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
                }, label: {
                    Text("Set Weights")
                        .font(.body)

                })
                Button(action: {
                    // Calculate..
                self.platesVisible = !platesVisible
                }, label: {
                    Text("Calculate")
                })
            }

            Spacer()
            
            if platesVisible {
                BarbellView()
            }
        }
    }
    
    private func generatePlates() -> [Plate] {
        var plates: [Plate] = []
        
        for value in [100, 55, 45, 35, 25, 15, 10, 5, 2.5, 1.25] {
            plates.append(Plate(wgt: value, qt: "0"))
        }
        
        return plates
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
