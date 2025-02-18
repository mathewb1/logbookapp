import Foundation
import SwiftData

@Model
final class LogEntry {
    @Attribute(.unique) var id: UUID
    var date: Date
    var departureTime: Date
    var arrivalTime: Date
    var departureLocation: String
    var arrivalLocation: String
    var aircraft: Aircraft?
    var pilotInCommand: Pilot?
    var coPilot: Pilot?
    var flightTime: Double
    var nightTime: Double
    var instrumentTime: Double
    var remarks: String
    
    init(
        date: Date = Date(),
        departureTime: Date,
        arrivalTime: Date,
        departureLocation: String,
        arrivalLocation: String,
        aircraft: Aircraft? = nil,
        pilotInCommand: Pilot? = nil,
        coPilot: Pilot? = nil,
        flightTime: Double = 0.0,
        nightTime: Double = 0.0,
        instrumentTime: Double = 0.0,
        remarks: String = ""
    ) {
        self.id = UUID()
        self.date = date
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.departureLocation = departureLocation
        self.arrivalLocation = arrivalLocation
        self.aircraft = aircraft
        self.pilotInCommand = pilotInCommand
        self.coPilot = coPilot
        self.flightTime = flightTime
        self.nightTime = nightTime
        self.instrumentTime = instrumentTime
        self.remarks = remarks
    }
}
