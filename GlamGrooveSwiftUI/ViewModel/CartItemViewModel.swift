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
    
    //Function to delete cart item in cart item id
    func deleteCartItemById(cartItemId: String) {
        
        guard let url = URL(string: "http://localhost:5000/removeCartItem/\(cartItemId)") else {
                    print("Invalid URL")
                    return
                }

                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }

                    guard let httpResponse = response as? HTTPURLResponse else {
                        print("Invalid response")
                        return
                    }

                    if (200...299).contains(httpResponse.statusCode) {
                        print("Cart item deleted successfully")
                        // Handle success response
                    } else {
                        if let data = data,
                           let message = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let errorMessage = message["message"] as? String {
                            print("Error: \(errorMessage)")
                        } else {
                            print("Error: Unable to delete cart item")
                        }
                    }
                }.resume()
    }
    
    //Function to save cart item in DB
    func insertCartItem(cartItem: CartItem) {
        
        guard let url = URL(string: "http://localhost:5000/insertCartItem") else {
            print("Invalid URL")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(cartItem) else {
            print("Error encoding JSON")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print("jsonData")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(responseJSON)
            }
        }.resume()
    }
    
    //Function to get cart items
    func fetchCartItems() {
        
        isRefreshing = true
        hasError = false
        let cartItemsUrlString = "http://localhost:5000/getCartItems"
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
    
    //Func to get added cart items total price
    func orderTotalPrice(productPrice: Double, productQty: Int) -> String {
        
        return String(format: "%.2f", Double(productQty) * Double(productPrice))
    }
}
