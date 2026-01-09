//
//  Confirmation.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/16/25.
//

import SwiftUI

struct ConfirmationView: View {
    let coffee: Coffee
    let customerName: String
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.beige.edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading){
                    VStack {
                        Image(.mkLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            //.padding(.top, -50)
                        Text("Thank you, \(customerName)")
                            .font(.custom("PlayfairDisplay-BoldItalic", size: 30))
                            .foregroundColor(Color.cafe)
                        Rectangle()
                            .frame(width: 200, height: 1)
                            .foregroundColor(.gold)
                    }
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Your order for is placed!")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .foregroundColor(.cafe)
                    
                    //ORDER DETAILS
                    Text("You ordered a \(coffee.size) \(coffee.name), with \(coffee.milk.rawValue) milk, \(coffee.shots) espresso shots and \(coffee.creamer) creamers")
                        .frame(width: 250)
                        .font(.custom("Montserrat-Regular", size: 15))
                        
                    Spacer()
                        .frame(height: 20)
                    Text("Pick up time:")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .foregroundColor(.cafe)
                    Text("8:30AM")
                        .foregroundColor(.cafe)
                    Spacer()
                        .frame(height: 20)
                    Text("Special Requests:")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .foregroundColor(.cafe)
                    if let allergies = coffee.allergies {
                        Text("You requested that you have a \(coffee.allergies) We'll make sure to accomodate you.")
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    Text("Location:")
                        .font(.custom("Montserrat-Bold", size: 18))
                        .foregroundColor(.cafe)
                    Text("45 Grand River Ave")
                        .foregroundColor(.cafe)
                    Text("Detroit, MI")
                        .foregroundColor(.cafe)
                    
                    
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.cafe, lineWidth: 1))
                    .frame(width: 350, height: 500)
                    .shadow(
                        color: .gold,
                        radius: 5,
                        x: 5, y: 5
                    ))
               
            }
        }
        
    }
}

#Preview{
    ConfirmationView(coffee: Coffee(name: "LATTES", image: "Latte"), customerName: "")
}
