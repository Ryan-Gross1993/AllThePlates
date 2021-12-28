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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
