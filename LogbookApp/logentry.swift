import Foundation
import SwiftData

@Model
final class LogEntry {
    @Attribute(.unique) var id: UUID
    var date: Date
    var title: String
    var description: String
    
    init(date: Date = Date(), title: String = "", description: String = "") {
        self.id = UUID()
        self.date = date
        self.title = title
        self.description = description
    }
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}