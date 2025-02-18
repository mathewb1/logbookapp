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
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Aircraft.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}