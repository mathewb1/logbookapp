//
//  SimpleAircraftsView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

struct SimpleAircraftsView: View {
    @Query(sort: \Aircraft.registration) private var aircrafts: [Aircraft]
    @Environment(\.modelContext) private var modelContext
    @State private var isAddingNewAircraft = false

    var body: some View {
        NavigationStack {
            List(aircrafts) { aircraft in
                VStack(alignment: .leading) {
                    Text(aircraft.make)
                        .font(.headline)
                    Text(aircraft.registration)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
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
                SimpleAddAircraftView()
            }
        }
    }
}

#Preview {
    SimpleAircraftsView()
}
```

### Explanation:
1. **NavigationStack**:
   - The `NavigationStack` provides a navigation context for the view.
2. **List**:
   - The `List` iterates over the `aircrafts` array, displaying each aircraft's make and registration.
   - The `VStack` ensures the make and registration are displayed vertically.
3. **Toolbar**:
   - A `ToolbarItem` with a `plus` button is added to the navigation bar for adding new aircraft.
4. **Sheet Presentation**:
   - The `isAddingNewAircraft` state variable controls the presentation of the `SimpleAddAircraftView` sheet.

### Review:
- **Conventions**: The code adheres to SwiftUI conventions and uses `@Query` for fetching data.
- **Completeness**: All required features (list, add button, navigation stack, sheet presentation) are implemented.
- **Functionality**: The view is fully functional and integrates with the existing `SimpleAddAircraftView`.
- **Imports**: Necessary imports (`SwiftUI` and `SwiftData`) are included.

### Final Output:
The complete file content is as follows:
```
//
//  SimpleAircraftsView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

struct SimpleAircraftsView: View {
    @Query(sort: \Aircraft.registration) private var aircrafts: [Aircraft]
    @Environment(\.modelContext) private var modelContext
    @State private var isAddingNewAircraft = false

    var body: some View {
        NavigationStack {
            List(aircrafts) { aircraft in
                VStack(alignment: .leading) {
                    Text(aircraft.make)
                        .font(.headline)
                    Text(aircraft.registration)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
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
                SimpleAddAircraftView()
            }
        }
    }
}

#Preview {
    SimpleAircraftsView()
}
