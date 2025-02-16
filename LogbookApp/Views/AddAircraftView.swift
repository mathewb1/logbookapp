//
//  AddAircraftView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddAircraftView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var make: String = ""
    @State private var model: String = ""
    @State private var code: String = ""
    @State private var registration: String = ""
    @State private var engineType: EngineType = .SEP
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var photoData: Data? = nil
    
    @State private var showValidationError: Bool = false
    
    var aircraft: Aircraft? // Optional for editing an existing aircraft
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Aircraft Details")) {
                    TextField("Make", text: $make)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Model", text: $model)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Code", text: $code)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                    
                    TextField("Registration", text: $registration)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                    
                    Picker("Engine Type", selection: $engineType) {
                        ForEach(EngineType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
                
                Section(header: Text("Photo")) {
                    PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                        if let photoData = photoData, let uiImage = UIImage(data: photoData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                        } else {
                            Text("Select a Photo")
                                .foregroundColor(.blue)
                        }
                    }
                    .onChange(of: selectedPhoto) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                photoData = data
                            }
                        }
                    }
                }
            }
            .navigationTitle(aircraft == nil ? "Add Aircraft" : "Edit Aircraft")
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
                Text("All fields are required.")
            }
        }
        .onAppear {
            if let aircraft = aircraft {
                loadAircraftData(aircraft)
            }
        }
    }
    
    private func saveAircraft() {
        guard !make.isEmpty, !model.isEmpty, !code.isEmpty, !registration.isEmpty else {
            showValidationError = true
            return
        }
        
        if let aircraft = aircraft {
            // Update existing aircraft
            aircraft.make = make
            aircraft.model = model
            aircraft.code = code
            aircraft.registration = registration
            aircraft.engineType = engineType
            aircraft.photo = photoData
        } else {
            // Create new aircraft
            let newAircraft = Aircraft(
                make: make,
                model: model,
                code: code,
                registration: registration,
                engineType: engineType,
                photo: photoData
            )
            modelContext.insert(newAircraft)
        }
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving aircraft: \(error)")
        }
    }
    
    private func loadAircraftData(_ aircraft: Aircraft) {
        make = aircraft.make
        model = aircraft.model
        code = aircraft.code
        registration = aircraft.registration
        engineType = aircraft.engineType
        photoData = aircraft.photo
    }
}

#Preview {
    AddAircraftView()
}
