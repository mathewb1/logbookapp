import Foundation
import SwiftData

@Model
final class Aircraft {
    var registration: String
    var make: String
    
    init(registration: String, make: String = "") {
        self.registration = registration
        self.make = make
    }
}