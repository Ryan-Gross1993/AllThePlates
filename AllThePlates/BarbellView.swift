//
//  BarbellView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

struct BarbellView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 25, alignment: .center)
            
            HStack(spacing: 5) {
                PlateView(wgt: 45.0)
                PlateView(wgt: 25.0)
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 5) {
                Spacer()
                PlateView(wgt: 25.0)
                PlateView(wgt: 45.0)
            }
        }
    }
}
