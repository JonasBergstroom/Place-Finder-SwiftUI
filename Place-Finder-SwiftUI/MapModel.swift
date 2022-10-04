//
//  MapModel.swift
//  Place-Finder-SwiftUI
//
//  Created by Jonas Bergström on 2022-10-04.
//

import Foundation
import MapKit

struct Address: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let latitude: Double
    let longitude: Double
    let name: String?
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
