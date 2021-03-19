//
//  ContentView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 2/28/21.
//

import SwiftUI

public protocol TextGeneratable {
    func determineText(val: Double) -> String
}
    
extension TextGeneratable {
     func determineText(val: Double) -> String {
        if val.truncatingRemainder(dividingBy: 5.0) == 0.0 {
            return String(Int(val))
        } else if val == 2.5 {
            return String(format: "%.1f", val)
        } else {
            return String(format: "%.2f", val)
        }
    }
}

struct Plate: Hashable {
    var wgt: Double
    var qt: String
}

struct PlateList: View, TextGeneratable {
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
                if let targetWgt = Double(targetWgt), let barWgt = Double(barWgt), let plates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: plateList.plates) {
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
