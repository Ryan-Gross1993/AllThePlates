//
//  PlateSettings.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/21/21.
//

import Foundation
import SwiftUI

struct PlateSettingsView: View {
    @State var plates: [Plate] = PlateUtility.generatePlates()
    var body: some View {
        FrontPlateView()
//        PlateList(plates: self.$plates)
    }
}
