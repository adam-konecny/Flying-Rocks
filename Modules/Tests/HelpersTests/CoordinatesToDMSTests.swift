//
//  CoordinatesToDMSTests.swift
//  Modules
//
//  Created by Adam Konečný on 24.11.2024.
//

import MapKit
import Testing
@testable import Helpers

@Test(arguments: [
    (CLLocationCoordinate2D(latitude: 49.21265, longitude: 16.5992631), "49°12'45\"N 16°35'57\"E"),
    (CLLocationCoordinate2D(latitude: 67.668622, longitude: -151.883443), "67°40'7\"N 151°53'0\"W"),
    (CLLocationCoordinate2D(latitude: -15.032012, longitude: 168.095781), "15°1'55\"S 168°5'44\"E"),
    (CLLocationCoordinate2D(latitude: -51.781306, longitude: -16.976117), "51°46'52\"S 16°58'34\"W")
])
func testCorrectCoordinatesToDMSConversion(_ coordinate: CLLocationCoordinate2D, result: String) async throws {
    let dms = CoordinatesToDMS.readable(from: coordinate)
    
    #expect(String(localized: dms) == result)
}
