//
//  DrinkCustomization.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/24/25.
//

import SwiftUI

struct DrinkCustomizationView: View {
    @State var coffee : Coffee
    @State private var value = 0
    @State var smallSize = false
    @State var largeSize = false
    @State var customerName = ""
    @State var allergies = ""
    @State var isShowingSheet = false
    @State var isShowingLocations = false
    @Environment(\.dismiss) var dismiss

    
    
    var body: some View {
       // NavigationStack{
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
           
                VStack(alignment: .leading){
                    
                    Image(coffee.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.leading, 110)
                    Text("Select Size")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .foregroundColor(.cafe)
                    
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.cafe)
                    
                    HStack(spacing: 60) {
                        VStack {
                            Button {
                                largeSize = false
                                smallSize.toggle()
                                coffee.size = .Small
                            } label: {
                                Image(systemName: "cup.and.saucer.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(smallSize ? coffee.size.coffeeSizeIconColor : .cafe)
                            }//logic for imagery of steaming mug
                            Text("Small")
                                .font(.custom("Montserrat-Regular", size: 25))
                            Text("8 oz")
                                .font(.custom("Montserrat-Regular", size: 20))
                        }
                        
                        .padding()
                        
                        VStack{
                            Button {
                                smallSize = false
                                largeSize.toggle()
                                coffee.size = .Large
                                
                            } label: {
                                Image(systemName: "cup.and.saucer.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 75, height: 75)
                                    .foregroundStyle(largeSize ? coffee.size.coffeeSizeIconColor : .cafe)
                            } //logic for steaming mug
                            Text("Large")
                                .font(.custom("Montserrat-Regular", size: 25))
                                .padding(.top, -10)
                            Text("16 oz")
                                .font(.custom("Montserrat-Regular", size: 20))
                                .padding(.bottom, 20)
                        }
                        
                        //.padding()
                    }
                    .padding(.leading, 55)
                    
                    Text("Customizations")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .foregroundColor(.cafe)
                    
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.cafe)
                        .padding(.bottom, 5)
                    
                    Picker("Milk", selection: $coffee.milk){
                        ForEach(Milk.allCases, id: \.self){
                            Text($0.rawValue)
                        }
                    
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, 10)
                    
                    Stepper("Espresso Shot \(coffee.shots)", value: $coffee.shots, in: 0...5)
                    Stepper("Creamers \(coffee.creamer)", value: $coffee.creamer, in: 0...5)
                    
                    Toggle("Want it iced?", isOn: $coffee.iced)
                    
                    TextField("Name", text: $customerName)
                        .font(.custom("PlayfairDisplay-Bold", size: 18))
                        .foregroundColor(.gold)
                    TextField("List allergy accommodations", text: $allergies)
                        .font(.custom("PlayfairDisplay-Bold", size: 18))
                        .foregroundColor(.cafe)
                    
                    Rectangle()
                        .frame( height: 1)
                        .foregroundColor(.gray).opacity(0.3)
                        .padding(.bottom, 20)
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("Check Out")
                            .font(.custom("PlayfairDisplay-Bold", size: 28))
                            .foregroundColor(.white)
                            .background(Color.accentGold)
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.cafe, lineWidth: 1))
                            
                            .padding(.leading, 125)
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        ConfirmationView(coffee: Coffee(name: "LATTES", image: "Latte"), customerName: "Cour")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "bag.fill")
                        .foregroundColor(.gold)
                        .overlay(Text("2")
                            .font(.custom("PlayfairDisplay-Regular", size: 18))
                            .foregroundColor(.white))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(.gold)
                        
                        VStack(alignment: .leading){
                            Text("\(coffee.name) | PRICE: $\(coffee.calculatePrice(), specifier: "%.2f")")
                                .font(.custom("PlayfairDisplay-Bold", size: 18))
                                .foregroundColor(.black)
                            Button {
                                isShowingLocations.toggle()
                            } label : {
                                Text("Select a store")
                                    .font(.custom("Montserrat-Regular", size: 13))
                                    .foregroundColor(.black)
                                    .underline()
                            }
                            .sheet(isPresented: $isShowingLocations) {
                                LocationsView()
                            }
                        }
                    }
                }
            }
        //}
    }
}

#Preview {
    DrinkCustomizationView(coffee: Coffee(name: "LATTES", image: "Latte"), customerName: "")
}
