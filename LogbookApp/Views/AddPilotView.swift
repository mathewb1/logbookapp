//
//  AddPilotView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI
import SwiftData

struct AddPilotView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var isLogbookOwner: Bool = false
    @State private var address: String = ""
    @State private var postcode: String = ""
    @State private var telephone: String = ""
    @State private var email: String = ""
    @State private var licenceIssueDate: Date = Date()
    @State private var licenceNumber: String = ""
    @State private var validRatings: String = ""
    @State private var medicalValidFrom: Date = Date()
    @State private var medicalValidTo: Date = Date()
    @State private var signature: Data? = nil
    
    @State private var showValidationError: Bool = false
    
    var pilot: Pilot? // Optional for editing an existing pilot
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Required Information")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    Toggle("Logbook Owner", isOn: $isLogbookOwner)
                }
                
                Section(header: Text("Optional Information")) {
                    TextField("Address", text: $address)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Postcode", text: $postcode)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                    
                    TextField("Telephone", text: $telephone)
                        .keyboardType(.phonePad)
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Licence Issue Date", selection: $licenceIssueDate, displayedComponents: .date)
                    
                    TextField("Licence Number", text: $licenceNumber)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                    
                    TextField("Valid Ratings", text: $validRatings)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    DatePicker("Medical Valid From", selection: $medicalValidFrom, displayedComponents: .date)
                    
                    DatePicker("Medical Valid To", selection: $medicalValidTo, displayedComponents: .date)
                    
                    Button(action: {
                        // Simulate adding a signature (e.g., from a drawing pad)
                        signature = Data("SampleSignature".utf8)
                    }) {
                        Text("Add Signature")
                    }
                }
            }
            .navigationTitle(pilot == nil ? "Add Pilot" : "Edit Pilot")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        savePilot()
                    }
                }
            }
            .alert("Validation Error", isPresented: $showValidationError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Name is required.")
            }
        }
        .onAppear {
            if let pilot = pilot {
                loadPilotData(pilot)
            }
        }
    }
    
    private func savePilot() {
        guard !name.isEmpty else {
            showValidationError = true
            return
        }
        
        if let pilot = pilot {
            // Update existing pilot
            pilot.name = name
            pilot.isLogbookOwner = isLogbookOwner
            pilot.address = address
            pilot.postcode = postcode
            pilot.telephone = telephone
            pilot.email = email
            pilot.licenceIssueDate = licenceIssueDate
            pilot.licenceNumber = licenceNumber
            pilot.validRatings = validRatings
            pilot.medicalValidFrom = medicalValidFrom
            pilot.medicalValidTo = medicalValidTo
            pilot.signature = signature
        } else {
            // Create new pilot
            let newPilot = Pilot(
                name: name,
                isLogbookOwner: isLogbookOwner,
                address: address.isEmpty ? nil : address,
                postcode: postcode.isEmpty ? nil : postcode,
                telephone: telephone.isEmpty ? nil : telephone,
                email: email.isEmpty ? nil : email,
                licenceIssueDate: licenceIssueDate,
                licenceNumber: licenceNumber.isEmpty ? nil : licenceNumber,
                validRatings: validRatings.isEmpty ? nil : validRatings,
                medicalValidFrom: medicalValidFrom,
                medicalValidTo: medicalValidTo,
                signature: signature
            )
            modelContext.insert(newPilot)
        }
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving pilot: \(error)")
        }
    }
    
    private func loadPilotData(_ pilot: Pilot) {
        name = pilot.name
        isLogbookOwner = pilot.isLogbookOwner
        address = pilot.address ?? ""
        postcode = pilot.postcode ?? ""
        telephone = pilot.telephone ?? ""
        email = pilot.email ?? ""
        licenceIssueDate = pilot.licenceIssueDate ?? Date()
        licenceNumber = pilot.licenceNumber ?? ""
        validRatings = pilot.validRatings ?? ""
        medicalValidFrom = pilot.medicalValidFrom ?? Date()
        medicalValidTo = pilot.medicalValidTo ?? Date()
        signature = pilot.signature
    }
}

#Preview {
    AddPilotView()
}
