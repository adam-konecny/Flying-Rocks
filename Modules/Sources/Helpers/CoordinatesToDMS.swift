//
//  CoordinatesToDMS.swift
//  Modules
//
//  Created by Adam Konečný on 24.11.2024.
//

import Foundation
import MapKit

// https://stackoverflow.com/a/37893239
public enum CoordinatesToDMS {
    enum CoordinateComponent {
        case latitude
        case longitude
    }
    
    enum CardinalDirection {
        case north
        case south
        case east
        case west
        
        var mark: LocalizedStringResource {
            switch self {
            case .north: "N"
            case .south: "S"
            case .east: "E"
            case .west: "W"
            }
        }
    }
    
    private static func convertToDMS(_ value: Double) -> String {
        let absolute = value.magnitude
        let degress = absolute.rounded(.down)
        let minutesNotTruncated = (absolute - degress) * 60.0
        let minutes = minutesNotTruncated.rounded(.down)
        let seconds = ((minutesNotTruncated - minutes) * 60.0).rounded(.down)
        
        return "\(Int(degress))°\(Int(minutes))'\(Int(seconds))\""
    }
    
    private static func dmsRepresentation(_ value: Double, for component: CoordinateComponent) -> LocalizedStringResource {
        let string = convertToDMS(value)
        let cardinalDirection: CardinalDirection
        
        switch component {
        case .latitude:
            if value >= 0.0 {
                cardinalDirection = .north
            } else {
                cardinalDirection = .south
            }
        case .longitude:
            if value >= 0.0 {
                cardinalDirection = .east
            } else {
                cardinalDirection = .west
            }
        }
        
        return "\(string)\(cardinalDirection.mark)"
    }
    
    public static func readable(from coordinates: CLLocationCoordinate2D) -> LocalizedStringResource {
        "\(dmsRepresentation(coordinates.latitude, for: .latitude)) \(dmsRepresentation(coordinates.longitude, for: .longitude))"
    }
}
