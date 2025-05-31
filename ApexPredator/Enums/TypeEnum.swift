//
//  TypeEnum.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//
import SwiftUI

enum TypeEnum: String, Decodable {
    case land
    case air
    case sea
    
    
    var backgroundColor: Color {
        return switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        }
    }
}
