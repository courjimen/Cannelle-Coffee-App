//
//  SnackOrderView.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/24/25.

import SwiftUI

struct SnackOrderView: View {
    @State var snack: Snack
    
    var body: some View {
        VStack {
            Text("Order details")
        }
    }
}

#Preview {
    SnackOrderView(snack: Snack(name: "Pastries", image: "Sandwich"))
}
