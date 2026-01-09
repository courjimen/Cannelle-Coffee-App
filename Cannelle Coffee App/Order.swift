//
//  Order.swift
//  Cannelle Coffee App
//
//  Created by Courey Jimenez on 10/16/25.
//

import SwiftUI

struct OrderView: View {
    @State var coffee: Coffee
    
    var body: some View {
        VStack {
            Text("Order details")
        }
    }
}

#Preview {
    OrderView(coffee: Coffee(name: "Latte", image: "Latte"))
}
