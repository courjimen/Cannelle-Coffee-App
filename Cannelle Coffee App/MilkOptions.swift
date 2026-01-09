//
//  MilkOptions.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/24/25.
//

import Foundation

enum Milk: String, CaseIterable {
    case Almond, Whole, Oat
    
    var basePrice: Double {
        switch self {
        case .Almond:
            return 2
        case .Whole:
            return 3
        case .Oat:
            return 5
        }
    }
}
