import SwiftUI

struct LogbookView: View {
    // Sample data for preview and placeholder purposes
    let logEntries: [LogEntry] = [
        LogEntry(date: Date(), title: "Flight to JFK", description: "Smooth flight with clear skies."),
        LogEntry(date: Date().addingTimeInterval(-86400), title: "Training Session", description: "Practiced emergency landings."),
        LogEntry(date: Date().addingTimeInterval(-172800), title: "Cargo Flight", description: "Delivered goods to LAX.")
    ]
    
    var body: some View {
        NavigationView {
            List(logEntries, id: \.date) { entry in
                VStack(alignment: .leading, spacing: 8) {
                    Text(entry.formatDate())
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(entry.title)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(entry.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Logbook")
        }
    }
}

#Preview {
    LogbookView()
}
