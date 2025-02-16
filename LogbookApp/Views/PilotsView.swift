import SwiftUI

import SwiftData

struct PilotsView: View {
    @Query(sort: \Pilot.name) private var pilots: [Pilot]
    @Environment(\.modelContext) private var modelContext
    @State private var isAddingNewPilot = false
    @State private var selectedPilot: Pilot?

    var body: some View {
        NavigationStack {
            List {
                .listStyle(.plain)
                ForEach(pilots) { pilot in
                    Text(pilot.name)
                        .onTapGesture {
                            selectedPilot = pilot
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Edit") {
                                selectedPilot = pilot
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Pilots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingNewPilot = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingNewPilot) {
                AddPilotView()
            }
            .sheet(item: $selectedPilot) { pilot in
                AddPilotView(pilot: pilot)
            }
        }
    }
}

#Preview {
    PilotsView()
}