//
//  TypeEnum.swift
//  ApexPredator
//
//  Created by 呂騰耀 on 2025/5/30.
//
import SwiftUI
import MapKit

enum TypeEnum: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: String {
        rawValue
    }
    
    var backgroundColor: Color {
        return switch self {
        case .all:
            .black
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        }
    }
    
    var name: String {
        switch self {
        case .all:
            "全部"
        case .land:
            "陸地"
        case .air:
            "空中"
        case .sea:
            "海洋"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
