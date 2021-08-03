//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Daniel Pape on 02/08/2021.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack(spacing: 16.0){
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text("Your total is £5")
                        .font(.title)
                    Button("Place Order"){
                        
                    }
                }
            }
        }
        .navigationBarTitle("Order details",displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
