//
//  VIVESPLUSApp.swift
//  VIVESPLUS
//
//  Created by arthur.ferket on 12/11/2024.
//

import SwiftUI

@main
struct VIVESPLUSApp: App {
    @State var dataStore = UurroosterDataStore()
    @State var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataStore).environment(appState)
        }
    }
}
