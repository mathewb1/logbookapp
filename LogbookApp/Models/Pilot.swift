//
//  Pilot.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import Foundation
import SwiftData

@Model
final class Pilot {
    // MARK: - Properties
    @Attribute(.unique) var id: UUID
    var name: String
    var address: String?
    var postcode: String?
    var telephone: String?
    var email: String?
    var licenceIssueDate: Date?
    var licenceNumber: String?
    var validRatings: String?
    var medicalValidFrom: Date?
    var medicalValidTo: Date?
    var isLogbookOwner: Bool
    var signature: Data?

    // MARK: - Initializer
    init(
        name: String,
        isLogbookOwner: Bool,
        address: String? = nil,
        postcode: String? = nil,
        telephone: String? = nil,
        email: String? = nil,
        licenceIssueDate: Date? = nil,
        licenceNumber: String? = nil,
        validRatings: String? = nil,
        medicalValidFrom: Date? = nil,
        medicalValidTo: Date? = nil,
        signature: Data? = nil
    ) {
        self.id = UUID()
        self.name = name
        self.isLogbookOwner = isLogbookOwner
        self.address = address
        self.postcode = postcode
        self.telephone = telephone
        self.email = email
        self.licenceIssueDate = licenceIssueDate
        self.licenceNumber = licenceNumber
        self.validRatings = validRatings
        self.medicalValidFrom = medicalValidFrom
        self.medicalValidTo = medicalValidTo
        self.signature = signature
    }
}
