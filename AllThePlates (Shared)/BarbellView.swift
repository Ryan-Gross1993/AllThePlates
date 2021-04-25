//
//  BarbellView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

struct BarbellView: View {
    @Binding var targetWgt: Double
    @Binding var barWgt: Double
    
    var body: some View {
        if let plates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: PlateUtility.generatePlates(qt: 6)) {
            ZStack {
                #if os(iOS)
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
                #else
                Rectangle()
                    .foregroundColor(.clear)
                    .border(Color.white, width: 1.0)
                
                GeometryReader { proxy in
                    let totalPlates = plates.map{return $0.qt}.reduce(0, +)
                    let frame = proxy.frame(in: .local)
                    let plateWidth = frame.width / 10
                    let totalWidth = plateWidth * CGFloat(totalPlates) + CGFloat(totalPlates - 1) * 5
                    
                    HStack(spacing: 0) {
                        ForEach(plates, id: \.self) { plate in
                            ForEach(0..<plate.qt) { _ in
                                PlateView(wgt: plate.wgt)
                                    .frame(width: 20, height: frame.height * CGFloat(plate.getHeight()))
                                
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 5, height: frame.height * 0.05)
                            }
                        }
                    }
                    .frame(width: totalWidth, height: frame.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .position(x: frame.midX, y: frame.midY)
                }
                #endif
            }
        }
    }
}
