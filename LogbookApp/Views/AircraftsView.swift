import SwiftUI

struct AircraftsView: View {
    @Query(sort: \Aircraft.registration) private var aircrafts: [Aircraft]
    @Environment(\.modelContext) private var modelContext
    @State private var isAddingNewAircraft = false
    @State private var selectedAircraft: Aircraft?

    var body: some View {
        NavigationView {
            List {
                ForEach(aircrafts) { aircraft in
                    HStack {
                        Text(aircraft.registration)
                            .font(.headline)
                        Spacer()
                        Text(aircraft.engineType.rawValue)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedAircraft = aircraft
                    }
                    .swipeActions(edge: .trailing) {
                        Button("Edit") {
                            selectedAircraft = aircraft
                        }
                        .tint(.blue)
                    }
                }
            }
            .navigationTitle("Aircrafts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingNewAircraft = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewAircraft) {
                AddAircraftView()
            }
            .sheet(item: $selectedAircraft) { aircraft in
                AddAircraftView(aircraft: aircraft)
            }
        }
    }
}

#Preview {
    AircraftsView()
}