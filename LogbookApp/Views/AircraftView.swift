import SwiftUI
import SwiftData

struct AircraftView: View {
    @Query private var aircraft: [Aircraft]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddAircraft = false
    @State private var newRegistration = ""
    
    var body: some View {
        NavigationStack {
            List(aircraft) { aircraft in
                Text(aircraft.registration)
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
                    }
                    .navigationTitle("New Aircraft")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showingAddAircraft = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                let aircraft = Aircraft(registration: newRegistration)
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
