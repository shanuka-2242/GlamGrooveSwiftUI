//
//  ItemModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-25.
//

import Foundation

struct CartItem: Codable {
    
    let cartItemId: String
    let productId: String
    let cartItemName: String
    let cartItemPrice: String
    let cartItemImage: String
    let quantity: String
    let cartItemSelectedSize: String
    let itemsTotalPrice: String

}
