import Foundation
import SwiftData

@Model
final class Record {
    var dateMake: Date
    var registration: String
    var departureLocation: String
    var arrivalLocation: String
    
    init(dateMake: Date = Date(), registration: String = "", departureLocation: String = "", arrivalLocation: String = "") {
        self.dateMake = dateMake
        self.registration = registration
        self.departureLocation = departureLocation
        self.arrivalLocation = arrivalLocation
    }
}
