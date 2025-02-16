import SwiftUI

struct PrintView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Print Options")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Text("This is a placeholder for selecting printable items and creating PDFs.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Print")
        }
    }
}

#Preview {
    PrintView()
}
