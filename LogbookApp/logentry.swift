struct LogEntry {
    let date: Date
    let title: String
    let description: String
    
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func getSummary() -> String {
        return "[\(getFormattedDate())] \(title): \(description)"
    }
}
//test
