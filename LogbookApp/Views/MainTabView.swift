import SwiftUI

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
                Text("Logbook View")
                    .tabItem {
                        Label("Logbook", systemImage: "book")
                    }

                // Flight Totals Tab
                Text("Flight Totals View")
                    .tabItem {
                        Label("Flight Totals", systemImage: "chart.bar")
                    }

                // Aircrafts Tab
                Text("Aircrafts View")
                    .tabItem {
                        Label("Aircrafts", systemImage: "airplane")
                    }

                // Airfields Tab
                Text("Airfields View")
                    .tabItem {
                        Label("Airfields", systemImage: "map")
                    }

                // Pilots Tab
                Text("Pilots View")
                    .tabItem {
                        Label("Pilots", systemImage: "person.2")
                    }

                // Print Tab
                Text("Print View")
                    .tabItem {
                        Label("Print", systemImage: "printer")
                    }

                // Filter Tab
                Text("Filter View")
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
