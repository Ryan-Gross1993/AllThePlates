//
//  ContentView.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PlateCalculationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(targetWgt: $viewModel.targetWgt, barWgt: $viewModel.barWgt)
                Spacer()
                
                if viewModel.calcPlates == nil {
                    Text("Not Rackable!")
                } else {
                    CalculationView(plates: $viewModel.calcPlates)
                }
            }
        }.onAppear {
            viewModel.barWgt = 45.0
            viewModel.targetWgt = 145.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
