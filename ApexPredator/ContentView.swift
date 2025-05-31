//
//  ContentView.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//

import SwiftUI

struct ContentView: View {
    let apexPredatorData = ApexPredatorClass()
    
    @State var searchText: String = ""
    
    var filteredPredators: [ApexPredatorStruct] {
        let unfilteredPredators = apexPredatorData.apexPredators
        if(searchText == ""){
            return unfilteredPredators
        }
        
        return unfilteredPredators.filter { predator in
            predator.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filteredPredators){ predator in
                NavigationLink{
                    
                }label: {
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
                            Text(predator.type.rawValue)
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
            .preferredColorScheme(.dark)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
    }
}

#Preview {
    ContentView()
}
