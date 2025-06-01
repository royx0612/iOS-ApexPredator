//
//  ApexPredatorclass.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//

import Foundation

class ApexPredatorClass {
    var apexPredators: [ApexPredatorStruct] = []
    
    init(){
        decodeApexPredators()
    }
    
    func decodeApexPredators(){
        guard let fileResource = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") else {
            print( "Error loading JSON file")
            return
        }
        do {
            let jsonData = try Data(contentsOf: fileResource)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            apexPredators = try decoder.decode([ApexPredatorStruct].self, from: jsonData)
        } catch  {
            print("Error loading JSON: \(error)")
        }
        
        // for debug
        print("load success for \(apexPredators.count) dinosaurs")
    }
    
    func search(for searchText: String, by sortByAlphabetically: Bool) -> [ApexPredatorStruct] {
        sort(by: sortByAlphabetically)
        
        if(searchText == ""){
            return apexPredators
        }
        
        return apexPredators.filter { predator in
            predator.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func sort(by sortByAlphabetically: Bool){
        return apexPredators.sort { a, b in
            return sortByAlphabetically ? a.name < b.name : a.id < b.id
        }
    }
}
