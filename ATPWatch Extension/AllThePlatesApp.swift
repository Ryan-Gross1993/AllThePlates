//
//  AllThePlatesApp.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 4/8/21.
//

import SwiftUI

@main
struct AllThePlatesApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
