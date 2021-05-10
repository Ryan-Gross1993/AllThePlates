//
//  BarbellView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/18/21.
//

import Foundation
import SwiftUI

struct BarbellView: View {
    var plates: [Plate]?
    
    var body: some View {
        if let plates = plates {
            ZStack {
                GeometryReader { proxy in
                    let frame = proxy.frame(in: .local)
                    let totalPlates = plates.map{return $0.qt}.reduce(0, +)
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
            }
        }
    }
}
