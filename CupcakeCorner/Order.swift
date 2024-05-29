//
//  Order.swift
//  CupcakeCorner
//
//  Created by Dechon Ryan on 5/24/24.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey { // so data is sent to server with correct keys
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    // static & constant ensures the array & its indices will never change...
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = UserDefaults.standard.integer(forKey: "type") { // ...so we can use the index of `types` to define a type
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "type")
        }
    }
    
    var quantity = UserDefaults.standard.integer(forKey: "quantity") {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "quantity")
        }
    }
    
    var specialRequestEnabled = UserDefaults.standard.bool(forKey: "specialRequestEnabled") {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "specialRequestEnabled")
        }
        
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = UserDefaults.standard.bool(forKey: "extraFrosting") {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "extraFrosting")
        }
    }
    
    var addSprinkles = UserDefaults.standard.bool(forKey: "addSprinkles") {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "addSprinkles")
        }
    }
    
    var name = UserDefaults.standard.string(forKey: "name") ?? "" {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "name")
        }
    }
    
    var streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? "" {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "streetAddress")
        }
    }
    
    var city = UserDefaults.standard.string(forKey: "city") ?? "" {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "city")
        }
    }
    
    var zip = UserDefaults.standard.string(forKey: "zip") ?? "" {
        willSet {
            UserDefaults.standard.setValue(newValue, forKey: "zip")
        }
    }
    
    var hasValidAddress: Bool {
        if name.isEmptyOrBlank
            || streetAddress.isEmptyOrBlank
            || city.isEmptyOrBlank
            || zip.isEmptyOrBlank {
            return false
        }
        
        return true
    }
    
    
    var cost: Decimal { // more accurate/safe than Double; great for money
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50 per cake
        if addSprinkles {
            cost += Decimal(quantity) * 0.5
        }
        
        return cost
    }
}
