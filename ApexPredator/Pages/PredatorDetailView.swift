//
//  PredatorDetailView.swift
//  ApexPredator
//
//  Created by Royx Lu on 2025/6/2.
//

import SwiftUI
import MapKit

struct PredatorDetailView: View {
    
    @State var predator: ApexPredatorStruct
    
    @State var position: MapCameraPosition
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .trailing){
                    // background
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1),
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    // predator
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 35)
                }
                
                VStack(alignment: .leading) {
                    // name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    NavigationLink {
                        PredatorMapView(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 10000, heading: 250, pitch: 80)))
                       
                    } label: {
                        // localtion
                        Map(position: $position){
                            Annotation("地圖", coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                        }
                        .frame(height: 150)
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.bottom)
                        .overlay(alignment: .trailing){
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading){
                            Text("當前位置")
                                .padding(5)
                                .background(.black.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 15))
                                .font(.caption)
                        }
                    }
                    
                    
                    Text("出現在：")
                        .font(.title3)
                    
                    ForEach(predator.movies, id:\.self){ movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    
                    // appear in
                    Text("相關電影：")
                        .font(.title3)
                        .padding(.top, 10)
                    
                    ForEach(predator.movieScenes){ scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // link
                    Text("了解更多：")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        .padding(.bottom)
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
//                .border(.blue, width:5)
            }
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    let predator = ApexPredatorClass().apexPredators[7]
    
    NavigationStack{
        PredatorDetailView(
            predator: predator,
            position: .camera(
                MapCamera(
                    centerCoordinate: predator.location,
                    distance: 30000
                )
            )
        )
        .preferredColorScheme(.dark)
    }
    
}
