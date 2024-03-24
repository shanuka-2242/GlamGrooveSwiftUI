//
//  OrderModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import Foundation

struct Order: Codable {
    
    let orderId: String
    let productId: String
    let productName: String
    let productPrice: String
    let productImage: String
    let quantity: String
    let selectedSize: String
    
}
