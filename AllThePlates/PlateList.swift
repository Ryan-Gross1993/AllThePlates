//
//  PlateList.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/19/21.
//

import Foundation
import SwiftUI

struct PlateList: View {
    @Binding var plates: [Plate]
    
    var body: some View {
        HStack {
            ForEach(0..<2, id: \.self) { row in
                let startIndex = row == 0 ? 0 : 5
                let endIndex = row == 0 ? 5 : 10
                VStack {
                    ForEach(startIndex..<endIndex, id: \.self) { index in
                        HStack {
                            Text(PlateUtility.wgtFormat.string(from: NSNumber(value: plates[index].wgt)) ?? "")
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
