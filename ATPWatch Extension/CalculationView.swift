//
//  CalculationView.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 4/30/21.
//

import Foundation
import SwiftUI

struct CalculationView: View, PlateDrawable {
    @Binding var plates: [Plate]?
    
    var body: some View {
        if let plates = plates {
            GeometryReader() { proxy in
                let frame = proxy.frame(in: .local)
                
                HStack(spacing: 2.0) {
                    BarbellView(plates: plates)
                        .frame(width: frame.width / 2)
                    
                    List {
                        ForEach(plates, id: \.self) { plate in
                            getPlateText(plate: plate)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.footnote)
                        }
                    }.environment(\.defaultMinListRowHeight, 10)
                }
            }
        }
    }
    
    private func getPlateText(plate: Plate) -> Text {
        return Text("\(plate.qt)x @ \(PlateUtility.format(plate.wgt))")
            .foregroundColor(getColor(val: plate.wgt))
    }
}
