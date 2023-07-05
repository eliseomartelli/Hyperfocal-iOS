//
//  DoFApp.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import SwiftUI

@main
struct DoFApp: App {
    @StateObject private var state = StateController()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(state)
        }
    }
}
