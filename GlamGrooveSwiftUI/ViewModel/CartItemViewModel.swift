//
//  OrderViewModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import Foundation

final class CartItemViewModel: ObservableObject {
    
    @Published var cartItems: [CartItem] = []
    @Published var hasError = false
    @Published var error: ErrorCases?
    @Published private(set) var isRefreshing = false
    
    //http://localhost:5000/insertCartItem
    
    
    func fetchCartItems() {
        
        isRefreshing = true
        hasError = false
        let cartItemsUrlString = "http://localhost:5000/getCartItemInfo"
        if let url = URL(string: cartItemsUrlString) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            
                            self?.hasError = true
                            self?.error = ErrorCases.custom(error: error)
                            
                        }
                        else {
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            if let data = data,
                               let cartItems = try? decoder.decode([CartItem].self, from: data) {
                                self?.cartItems = cartItems
                                
                            } else {
                                
                                self?.hasError = true
                                self?.error = ErrorCases.failedToDecode
                            }
                        }
                        self?.isRefreshing = false
                    }
                }.resume()
        }
    }
        
    func generateCartItemId() -> String {
        
        let currentDate = Date()
        let dateTimeFormat = DateFormatter()
        dateTimeFormat.dateFormat = "yyyyMMddHHmmss"
        
        return "GG-\(dateTimeFormat.string(from: currentDate))"
    }
    
    //Func to get order total price
//    func orderTotalPrice(productCategory: String, minPrice: String, maxPrice: String) -> [Product] {
//
//    }
}
