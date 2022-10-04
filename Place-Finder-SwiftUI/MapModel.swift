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

class MapAPI: ObservableObject {
    private let BASE_URL = "http://api.positionstack.com/v1/forward"
    private let API_KEY = "22c87b81ed3d8a6d84baef912c71e45f"
    
    @Published var region: MKCoordinateRegion
    @Published var coordinates = []
    @Published var locations: [Location] = []
    
    init() {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.334591, longitude: 18.063240), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
        
        self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 59.334591, longitude: 18.063240)), at: 0)
    }
}
