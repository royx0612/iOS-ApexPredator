//
//  PredatorMapView.swift
//  ApexPredator
//
//  Created by Royx Lu on 2025/6/3.
//

import SwiftUI
import MapKit

struct PredatorMapView: View {
    @State var predatorClass: ApexPredatorClass = ApexPredatorClass()
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    
    var body: some View {
        Map(position: $position){
            ForEach(predatorClass.apexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location){
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .scaleEffect(x: -1)
                        .shadow(color: .white, radius: 3)
                }
            }
        }
        .mapStyle(satellite
                  ? .imagery(elevation: .realistic)
                  : .standard
        )
        .overlay(alignment: .bottomTrailing) {
            Button{
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .background(.ultraThinMaterial)
                    .clipShape(.capsule)
                    .padding(.trailing)
                    .shadow(radius: 3)
            }
        }
    }
}

#Preview {
    let predator = ApexPredatorClass().apexPredators[0]
    PredatorMapView(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 10000, heading: 250, pitch: 80)))
        .preferredColorScheme(.dark)
}
