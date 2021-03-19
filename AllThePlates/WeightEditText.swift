//
//  WeightEditText.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/19/21.
//

import Foundation
import SwiftUI

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
