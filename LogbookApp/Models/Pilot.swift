import Foundation
import SwiftData

@Model
final class Pilot {
    @Attribute(.unique) var id: UUID
    var name: String
    var licenseNumber: String
    var ratings: [String]
    var signature: Data?
    
    init(name: String, licenseNumber: String, ratings: [String] = [], signature: Data? = nil) {
        self.id = UUID()
        self.name = name
        self.licenseNumber = licenseNumber
        self.ratings = ratings
        self.signature = signature
    }
}