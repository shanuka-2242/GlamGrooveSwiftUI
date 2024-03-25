//
//  OrderModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import Foundation

struct Order: Codable {
    
    let orderId: String
    let totalPrice: String
    let items: [Item]

}
