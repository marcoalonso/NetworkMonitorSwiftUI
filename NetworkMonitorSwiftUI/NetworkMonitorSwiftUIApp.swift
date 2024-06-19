//
//  NetworkMonitorSwiftUIApp.swift
//  NetworkMonitorSwiftUI
//
//  Created by Marco Alonso on 19/06/24.
//

import SwiftUI

@main
struct NetworkMonitorSwiftUIApp: App {
    @ObservedObject var monitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(monitor)
        }
    }
}
