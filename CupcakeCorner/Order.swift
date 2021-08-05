//
//  Order.swift
//  CupcakeCorner
//
//  Created by Daniel Pape on 02/08/2021.
//

import Foundation

class Order : ObservableObject,Codable {
    
    enum codingkeys:CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, postcode
    }
    
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
    
    var cost:Double {
        
        var cost = Double(quantity)*2
        cost += Double(type) / 2
        
        if extraFrosting{
            cost += Double(quantity)
        }
        
        if(addSprinkles){
            cost += Double(quantity)/2
        }
        
        return cost
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingkeys.self)
        
        type = try container.decode(Int.self,forKey: .type)
        quantity = try container.decode(Int.self,forKey: .quantity)
        extraFrosting = try container.decode(Bool.self,forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self,forKey: .addSprinkles)
        name = try container.decode(String.self,forKey: .name)
        streetAddress = try container.decode(String.self,forKey: .streetAddress)
        city = try container.decode(String.self,forKey: .city)
        postcode = try container.decode(String.self,forKey: .postcode)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingkeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(postcode, forKey: .postcode)
    }

}
