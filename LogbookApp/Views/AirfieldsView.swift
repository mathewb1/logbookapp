import SwiftUI

struct AirfieldsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Airfields")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for airfield information.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Airfields")
        }
    }
}

#Preview {
    AirfieldsView()
}
