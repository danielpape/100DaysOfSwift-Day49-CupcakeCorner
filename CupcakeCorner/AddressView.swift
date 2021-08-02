//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Daniel Pape on 02/08/2021.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order = Order()

    var body: some View {
        Form{
            Section{
                TextField("Name", text:$order.name)
                TextField("Street Address", text:$order.streetAddress)
                TextField("City", text:$order.city)
                TextField("Postcode", text:$order.postcode)
            }
            NavigationLink(destination: CheckoutView(order: order)){
                Text("Check out")
            }
            .navigationBarTitle("Check out",displayMode: .inline)
            .disabled(order.disableForm)

            
        }
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
