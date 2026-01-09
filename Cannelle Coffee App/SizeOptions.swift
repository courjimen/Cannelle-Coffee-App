//
//  SizeOptions.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/30/25.
//

import Foundation
import SwiftUI

enum Size: String, CaseIterable {
    case Small, Large
    
    var basePrice: Double {
        switch self {
        case .Small:
            return 5
        case .Large:
            return 8
        }
    }
    var coffeeSizeIconColor: Color {
        switch self {
        case .Small:
            return .gold
        case .Large:
            return .gold
        }
    }
}
