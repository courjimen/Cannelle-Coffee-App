//
//  SnackCard.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/23/25.
//

//
//  CoffeeCard.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/16/25.

import SwiftUI

struct SnackCardView: View {
    let snack: Snack
    
    var body: some View  {
        VStack {
            Image(snack.image)
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 125)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .frame(width: 150, height: 150))
                .shadow(
                    color: .gold,
                    radius: 5,
                    x: 5, y: 5)
            
                .padding()
            
            Text(snack.name)
                .font(.custom("PlayfairDisplay-Bold", size: 20))
                .foregroundStyle(.cafe)
        }
        
        .padding()
        .frame(width: 175, height: 200)
        .background(RoundedRectangle(cornerRadius: 30)
            .foregroundStyle(.white))
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.cafe, lineWidth: 2))
    }
}

#Preview {
    SnackCardView(snack: Snack(name: "Pastries", image: "Sandwich"))
}
