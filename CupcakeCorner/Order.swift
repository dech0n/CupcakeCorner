//
//  Order.swift
//  CupcakeCorner
//
//  Created by Dechon Ryan on 5/24/24.
//

import Foundation

@Observable
class Order {
    // static constant ensures the array & its indices will never change...
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0 // ...so we can use the index of types to define a type
    var quantity = 3
    
    var specialRequestEnabled = false
    var extraFrosting = false
    var addSprinkles = false
}
