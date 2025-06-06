//
//  ContentView.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let apexPredatorData = ApexPredatorClass()
    
    @State var searchText: String = ""
    
    @State var sortByAlphabetically: Bool = false
    
    @State var filterType: TypeEnum = .all
    var body: some View {
        NavigationStack{
            List(apexPredatorData.search(for: searchText, by: sortByAlphabetically, as: filterType)){ predator in
                NavigationLink{
                    PredatorDetailView(predator: predator, position: .camera(
                        MapCamera(
                            centerCoordinate: predator.location,
                            distance: 30000
                        )
                    ))
                } label: {
                    HStack{
                        // imgage
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading){
                            // name
                            Text(predator.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            // type
                            Text(predator.type.name)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .foregroundStyle(.white)
                                .background(predator.type.backgroundColor)
                                .clipShape(.capsule)
                            
                        }
                    }
                }
            }
            .navigationTitle("頂級掠食者")
            .searchable(text: $searchText, prompt: "搜尋")
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        sortByAlphabetically.toggle()
                    } label:{
                    Image(systemName: sortByAlphabetically ? "film" : "textformat")
                            .symbolEffect(.bounce, value: sortByAlphabetically)
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Menu {
                        Picker("過濾", selection: $filterType) {
                            ForEach(TypeEnum.allCases){ type in
                                Label(type.name, systemImage: type.systemImageName).tag(type)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    ContentView()
}
