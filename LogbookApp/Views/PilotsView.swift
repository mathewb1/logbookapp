import SwiftUI

struct PilotsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pilots")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for pilot information.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Pilots")
        }
    }
}

#Preview {
    PilotsView()
}
