//
//  ContentView.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var targetWgt = 145.0
    @State var barWgt = 45.0
    @State var plates = PlateUtility.generatePlates()
    
    var body: some View {
        VStack {
            HStack(alignment: VerticalAlignment.center) {
                VStack(alignment: HorizontalAlignment.leading) {
                    Text("Bar: \(PlateUtility.format(self.barWgt))")
                    Text("Target: \(PlateUtility.format(self.targetWgt))")
                }
                Spacer()
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 30, height: 30, alignment: .center)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
