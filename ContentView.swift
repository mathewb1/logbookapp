import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Record.dateMake) var records: [Record]
    @Environment(\.modelContext) var modelContext
    @State private var isAddingNewRecord = false
    @State private var selectedRecord: Record?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(records) { record in
                    RecordRowView(record: record)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedRecord = record
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Edit") {
                                selectedRecord = record
                            }
                            .tint(.blue)
                        }
                }
                .onDelete(perform: deleteRecords)
            }
            .navigationTitle("Logbook")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingNewRecord = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewRecord) {
                AddRecordView()
            }
            .sheet(item: $selectedRecord) { record in
                AddRecordView(record: record)
            }
        }
    }
    
    private func deleteRecords(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(records[index])
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving after deletion: \(error)")
        }
    }
}

struct RecordRowView: View {
    let record: Record
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(record.dateMake, style: .date)
                .font(.headline)
            Text(record.registration)
                .font(.subheadline)
            Text(record.departureLocation + " → " + record.arrivalLocation)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}
