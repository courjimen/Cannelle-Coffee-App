//
//  Coffee.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/16/25.
//

import Foundation

struct Coffee: Hashable {
    var name: String
    var image: String
    var customerName: String?
    var allergies: String?
    var shots: Int = 0
    var creamer: Int = 0
    var milk: Milk = .Almond
    var iced: Bool = false
    var size: Size = .Small
    
    mutating func calculatePrice() -> Double {
        var price = milk.basePrice + size.basePrice
        let taxRate: Double = 0.08
        
        
        if iced {
            price += 1.5
        }

        price += Double(shots) * 0.75
        price += Double(creamer) * 0.5
        
        return price * (1 + taxRate)
    }
    
}

struct Snack: Hashable {
    var name: String
    var image: String
}



