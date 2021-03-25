//
//  FrontPlateView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 3/24/21.
//

import Foundation
import SwiftUI

// TODO: Dynamic color based on weight.
struct FrontPlateView: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.black, lineWidth: 2)
                .background(Circle().foregroundColor(Color.red))
                .frame(width: 120, height: 120)

            Circle()
                .strokeBorder(Color.black, lineWidth: 2)
                .background(Circle().foregroundColor(Color.red))
                .frame(width: 100, height: 100)

            Circle()
                .strokeBorder(Color.black, lineWidth: 2)
                .background(Circle().foregroundColor(Color.red))
                .frame(width: 40, height: 40)

            Circle()
                .strokeBorder(Color.black, lineWidth: 2)
                .background(Circle().foregroundColor(Color.white))
                .frame(width: 20, height: 20)
            
            Text("45")
                .bold()
                .offset(x: -35)
                .foregroundColor(.white)
            
            Text("45")
                .bold()
                .offset(x: 35)
                .foregroundColor(.white)
        }
    }
}
