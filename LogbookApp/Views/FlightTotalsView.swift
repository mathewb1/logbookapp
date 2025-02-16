import SwiftUI

struct FlightTotalsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Flight Totals")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for flight time summaries.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Flight Totals")
        }
    }
}

#Preview {
    FlightTotalsView()
}
