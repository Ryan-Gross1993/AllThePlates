//
//  BarbellView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

struct BarbellView: View {
    @State var plates: [Plate]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 25, alignment: .center)
            
            HStack(spacing: 5) {
                ForEach(plates.reversed(), id: \.self) { plate in
                    if let qtVal = Int(plate.qt) {
                        ForEach(0..<qtVal) { _ in
                            PlateView(wgt: plate.wgt)
                        }
                    }
                 
                }
              
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 5) {
                Spacer()
                ForEach(plates, id: \.self) { plate in
                    if let qtVal = Int(plate.qt) {
                        ForEach(0..<qtVal) { _ in
                            PlateView(wgt: plate.wgt)
                        }
                    }
                }
            }
        }
    }
}
