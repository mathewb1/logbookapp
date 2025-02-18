import Foundation
import SwiftData

@Model
final class Aircraft {
    var registration: String
    
    init(registration: String) {
        self.registration = registration
    }
}
