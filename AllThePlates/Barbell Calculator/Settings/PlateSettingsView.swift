//
//  PlateSettings.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/21/21.
//

import Foundation
import SwiftUI
import SwiftUIPager

struct PlateSettingsView: View {
    @State var plates: [Plate] = PlateUtility.generatePlates()
    @StateObject var page = Page.first()
    var body: some View {
        Pager(page: page,
              data: plates,
              id: \.self,
              content: { plate in
                FrontPlateView(plate: plate)
              })
    }
}
