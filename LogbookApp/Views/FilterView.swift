import SwiftUI

struct FilterView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Filter Options")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for filtering logbook entries based on criteria.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Filter")
        }
    }
}

#Preview {
    FilterView()
}
