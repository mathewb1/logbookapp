import SwiftUI
import SwiftData

struct AircraftView: View {
    @Query private var aircraft: [Aircraft]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddAircraft = false
    @State private var newRegistration = ""
    @State private var newMake = ""
    
    var body: some View {
        NavigationStack {
            List(aircraft) { aircraft in
                VStack(alignment: .leading) {
                    Text(aircraft.registration)
                        .font(.headline)
                    Text(aircraft.make)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Aircraft")
            .toolbar {
                Button("Add Aircraft") {
                    showingAddAircraft = true
                }
            }
            .sheet(isPresented: $showingAddAircraft) {
                NavigationStack {
                    Form {
                        TextField("Registration", text: $newRegistration)
                        TextField("Make", text: $newMake)
                    }
                    .navigationTitle("New Aircraft")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showingAddAircraft = false
                                newMake = ""
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                let aircraft = Aircraft(registration: newRegistration, make: newMake)
                                modelContext.insert(aircraft)
                                showingAddAircraft = false
                                newRegistration = ""
                            }
                        }
                    }
                }
            }
        }
    }
}