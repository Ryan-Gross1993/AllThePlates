//
//  WeightEditText.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/19/21.
//

import Foundation
import SwiftUI


// https://stackoverflow.com/questions/59507471/use-bindingint-with-a-textfield-swiftui
struct WeightEditText: View, TextGeneratable {
    var label: String
    @Binding var wgtValue: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Text(label)
            TextField("", value: $wgtValue, formatter: PlateUtility.wgtFormat)
                .fixedSize(horizontal: true, vertical: false)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
        }
    }
}
