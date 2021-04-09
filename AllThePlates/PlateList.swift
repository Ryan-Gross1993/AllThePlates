//
//  PlateList.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/19/21.
//

import Foundation
import SwiftUI

protocol TextGeneratable {
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

struct PlateList: View, TextGeneratable {
    @Binding var plates: [Plate]
    
    var body: some View {
        HStack {
            ForEach(0..<2, id: \.self) { row in
                let startIndex = row == 0 ? 0 : 5
                let endIndex = row == 0 ? 5 : 10
                VStack {
                    ForEach(startIndex..<endIndex, id: \.self) { index in
                        HStack {
                            Text("\(self.determineText(val: plates[index].wgt))")
                            TextField("0", value: $plates[index].qt, formatter: NumberFormatter())
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
