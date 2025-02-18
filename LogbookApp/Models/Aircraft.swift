import Foundation
import SwiftData

enum EngineType: String, Codable, CaseIterable {
    case SEP = "Single Engine Piston"
    case MEP = "Multi Engine Piston"
    case SET = "Single Engine Turbine"
    case MET = "Multi Engine Turbine"
    case Jet = "Jet"
}

@Model
final class Aircraft {
    @Attribute(.unique) var id: UUID
    var make: String
    var registration: String
    var engineType: EngineType
    var photo: Data?
    
    init(make: String, model: String, registration: String, engineType: EngineType = .SEP, photo: Data? = nil) {
        self.id = UUID()
        self.make = make
        self.model = model
        self.registration = registration
        self.engineType = engineType
        self.photo = photo
    }
}