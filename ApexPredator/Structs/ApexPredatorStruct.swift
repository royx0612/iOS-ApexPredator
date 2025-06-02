//
//  apexpredator.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//
import SwiftUI
import MapKit

struct ApexPredatorStruct: Decodable, Identifiable {
    let id: Int
    let name: String
    var type: TypeEnum
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    var image: ImageResource {
        let imageName = name.lowercased().replacingOccurrences(of: " ", with: "")
        return ImageResource(name: imageName, bundle: .main)
        
    }

    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
