import SwiftUI

struct AircraftsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Aircrafts")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for aircraft information.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Aircrafts")
        }
    }
}

#Preview {
    AircraftsView()
}
