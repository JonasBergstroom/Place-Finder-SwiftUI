//
//  ContentView.swift
//  Place-Finder-SwiftUI
//
//  Created by Jonas Bergström on 2022-10-04.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    
    private func clearTextField() {
        text = ""
    }
    
    var body: some View {
        VStack {
            TextField("Enter town here", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Search Town") {
                mapAPI.getLocation(address: text, delta: 0.5)
                clearTextField()
            }
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) {
                location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
