//
//  ContentView.swift
//  AllThePlates
//
//  Created by Ryan Gross on 2/28/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            BarbellCalculatorView()
                .tabItem({
                    Image(systemName: "house")
                })
            
            PlateSettingsView()
                .tabItem({
                    Image(systemName: "gear")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
