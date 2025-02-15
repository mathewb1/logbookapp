simport Foundation

struct LogEntry {
    var date: Date
    var title: String
    var description: String
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
