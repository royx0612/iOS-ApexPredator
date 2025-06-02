//
//  PredatorDetailView.swift
//  ApexPredator
//
//  Created by Royx Lu on 2025/6/2.
//

import SwiftUI

struct PredatorDetailView: View {
    
    @State var predator: ApexPredatorStruct
    
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
                    
                    // localtion
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
    PredatorDetailView(predator: ApexPredatorClass().apexPredators[7])
        .preferredColorScheme(.dark)
}
