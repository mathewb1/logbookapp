//
//  LogbookAppApp.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

@main
struct LogbookAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Pilot.self,
            Aircraft.self,
            SimpleAircraft.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}