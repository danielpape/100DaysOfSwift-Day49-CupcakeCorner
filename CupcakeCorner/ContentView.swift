//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Daniel Pape on 02/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = Order()
        
    var body: some View {
        NavigationView{
                Form{
                    Section{
                        Picker("Type", selection: $order.type){
                            ForEach(0..<Order.types.count){
                                Text(Order.types[$0])
                            }

                        }
                        Stepper(value: $order.quantity, in: 3...20){
                            Text("Number of cakes: \(order.quantity)")
                        }
                    }
                    Section{
                        Toggle(isOn: $order.specialRequestsEnabled.animation()){
                            Text("Any special requests?")
                        }
                        if(order.specialRequestsEnabled){
                            Toggle(isOn: $order.extraFrosting){
                                Text("Add Extra Frosting")
                            }
                            Toggle(isOn: $order.addSprinkles){
                                Text("Add Extra Sprinkles")
                            }
                        }
                    }
                    Section{
                        NavigationLink(destination: AddressView(order: order)){
                            Text("Submit Order")
                        }
                    }
            }
                .navigationTitle("Sign In")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
