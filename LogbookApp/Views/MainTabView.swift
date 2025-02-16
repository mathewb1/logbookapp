import SwiftUI
import SwiftData

struct MainTabView: View {
    var body: some View {
        VStack {
            // App Logo at the top
            Image("AppIcon") // Ensure "AppIcon" matches the asset name in Assets.xcassets
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 20)

            // TabView for navigation
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
            .padding(.top, 10) // Add some spacing between the logo and the TabView
        }
    }
}

#Preview {
    MainTabView()
}