import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Logbook View")
                .tabItem {
                    Label("Logbook", systemImage: "book")
                }
            
            Text("Flight Totals View")
                .tabItem {
                    Label("Flight Totals", systemImage: "airplane")
                }
            
            Text("Aircraft View")
                .tabItem {
                    Label("Aircraft", systemImage: "airplane.circle")
                }
            
            Text("Airfields View")
                .tabItem {
                    Label("Airfields", systemImage: "map")
                }
            
            Text("Pilot View")
                .tabItem {
                    Label("Pilot", systemImage: "person")
                }
            
            Text("PDF View")
                .tabItem {
                    Label("PDF", systemImage: "doc.text")
                }
        }
    }
}

#Preview {
    ContentView()
}