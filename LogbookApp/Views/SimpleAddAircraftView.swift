//
//  SimpleAddAircraftView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

struct SimpleAddAircraftView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var make: String = ""
    @State private var registration: String = ""
    @State private var showValidationError: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Aircraft Details")) {
                    TextField("Make", text: $make)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Registration", text: $registration)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                }
            }
            .navigationTitle("Add Aircraft")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveAircraft()
                    }
                }
            }
            .alert("Validation Error", isPresented: $showValidationError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Both fields are required.")
            }
        }
    }
    
    private func saveAircraft() {
        guard !make.isEmpty, !registration.isEmpty else {
            showValidationError = true
            return
        }
        
        let newAircraft = Aircraft(make: make, registration: registration)
        modelContext.insert(newAircraft)
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving aircraft: \(error)")
        }
    }
}

#Preview {
    SimpleAddAircraftView()
}
```

### Step 4: Review the Code
1. **Conventions**:
   - The code follows Swift naming conventions and uses `@State` for managing form inputs.
   - The `@Environment` property wrappers are used for `dismiss` and `modelContext`.
2. **Completeness**:
   - The form includes two text fields for `make` and `registration`.
   - The `Save` button validates inputs and saves the new aircraft.
   - The `Cancel` button dismisses the view.
   - An alert is shown if validation fails.
3. **Functionality**:
   - The `saveAircraft` function ensures that both fields are not empty before saving.
   - The `modelContext.insert` and `modelContext.save` methods are used to persist the new `Aircraft` object.
4. **Imports**:
   - Necessary imports (`SwiftUI` and `SwiftData`) are included.

### Final Output
The complete file content is as follows:

```
//
//  SimpleAddAircraftView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

struct SimpleAddAircraftView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var make: String = ""
    @State private var registration: String = ""
    @State private var showValidationError: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Aircraft Details")) {
                    TextField("Make", text: $make)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Registration", text: $registration)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                }
            }
            .navigationTitle("Add Aircraft")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveAircraft()
                    }
                }
            }
            .alert("Validation Error", isPresented: $showValidationError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Both fields are required.")
            }
        }
    }
    
    private func saveAircraft() {
        guard !make.isEmpty, !registration.isEmpty else {
            showValidationError = true
            return
        }
        
        let newAircraft = Aircraft(make: make, registration: registration)
        modelContext.insert(newAircraft)
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving aircraft: \(error)")
        }
    }
}

#Preview {
    SimpleAddAircraftView()
}
