//
//  ContentView.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    let coffees: [Coffee] = [Coffee(name: "Vanilla Latte", image: "Latte"),
                             Coffee(name:"Coffee", image: "Coffee"),
                             Coffee(name: "Green Tea", image:"tea"),
                             Coffee(name:"Matcha", image: "Matcha")]
    
    let snacks: [Snack] = [Snack(name: "Pastries", image: "Sandwich"),
                            Snack(name:"Sandwiches", image: "Pastries"),
                            Snack(name: "Croissants", image:"Croissant")]

    var body: some View {
        NavigationStack {
            ZStack{
                Color.beige.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(.mkLogo)
                        .resizable()
                        .frame(width: 100, height: 75)
                    Image(.cannelle)
                        .resizable()
                        .frame(width: 125, height: 50)
                        .padding(.top, -15)
                }
               .padding(.bottom, 675)
                
                VStack(alignment: .leading)  {
                    Text("Bonjour, Courey")
                        .font(.custom("PlayfairDisplay-BlackItalic", size: 35))
                        .foregroundColor(.cafe)
                        .padding(.top, 125)
                    
                    Text("What are you craving today?")
                        .font(.custom("Montserrat-Regular", size: 18))
                        .foregroundColor(.cafe)
                        .padding(.bottom, 15)
                    
                    Text("Drinks")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .foregroundColor(.gold)
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.cafe)
                        .padding(.bottom, 5)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(coffees, id: \.self) { coffee in
                                NavigationLink {
                                    DrinkCustomizationView(coffee: coffee)
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    CoffeeCardView(coffee: coffee)
                                }
                            }
                        }
                    }
                    
                    Text("Food")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .foregroundColor(.gold)
                        .padding(.top, 15)
                    
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.cafe)
                        .padding(.bottom, 5)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(snacks, id: \.self) { snack in
                                NavigationLink {
                                    SnackOrderView(snack: snack)
                                } label: {
                                   SnackCardView(snack: snack)
                                }
                            }
                        }
                    }
                }
                
                .padding()
            }
            
            
        }
        
    }
}
#Preview {
    ContentView()
}
