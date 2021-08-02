//
//  Order.swift
//  CupcakeCorner
//
//  Created by Daniel Pape on 02/08/2021.
//

import Foundation

class Order : ObservableObject {
    
    static let types = ["Vanilla","Chocolate","Strawberry","Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var postcode = ""
    
    var disableForm:Bool {
        if(name == "" || streetAddress == "" || city == "" || postcode == ""){
            return true
        } else {
            return false
        }
    }

}
