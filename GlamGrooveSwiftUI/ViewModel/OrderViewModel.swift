//
//  OrderViewModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published var orders: [Order] = []
    @Published var hasError = false
    @Published var error: ErrorCases?
    @Published private(set) var isRefreshing = false
    
    func fetchOrders() {
        
        isRefreshing = true
        hasError = false
        let ordersUrlString = "http://localhost:5000/getOrderInfo"
        if let url = URL(string: ordersUrlString) {
            
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
                               let orders = try? decoder.decode([Order].self, from: data) {
                                self?.orders = orders
                                
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
        
    func generateOrderID() -> String {
        
        let currentDate = Date()
        let dateTimeFormat = DateFormatter()
        dateTimeFormat.dateFormat = "yyyyMMddHHmmss"
        
        return "GG - \(dateTimeFormat.string(from: currentDate))"
    }
    
    //Func to get order total price
//    func orderTotalPrice(productCategory: String, minPrice: String, maxPrice: String) -> [Product] {
//
//    }
}
