import SwiftUI
import SwiftData

struct MainTabView: View {
    var body: some View {
        TabView {
                // Logbook Tab
                LogbookView()
                    .tabItem {
                        Label("Logbook", systemImage: "book")
                    }

                // Flight Totals Tab
                FlightTotalsView()
                    .tabItem {
                        Label("Flight Totals", systemImage: "chart.bar")
                    }

                // Aircrafts Tab
                AircraftsView()
                    .tabItem {
                        Label("Aircrafts", systemImage: "airplane")
                    }

                // Airfields Tab
                AirfieldsView()
                    .tabItem {
                        Label("Airfields", systemImage: "map")
                    }

                // Pilots Tab
                PilotsView()
                    .tabItem {
                        Label("Pilots", systemImage: "person.2")
                    }

                // Print Tab
                PrintView()
                    .tabItem {
                        Label("Print", systemImage: "printer")
                    }

                // Filter Tab
                FilterView()
                    .tabItem {
                        Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                    }
            }
    }
}

#Preview {
    MainTabView()
}