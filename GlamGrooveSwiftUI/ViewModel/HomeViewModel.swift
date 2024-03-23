//
//  ProductViewModel.swift
//  ClassTuteFour
//
//  Created by User Account  on 2024-03-22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    static var shared: HomeViewModel = HomeViewModel()
    @Published var selectTab: Int = 0
    @Published var products: [Product] = []
    @Published var hasError = false
    @Published var error: ErrorCases?
    @Published private(set) var isRefreshing = false
    
    func fetchProducts() {
        
        isRefreshing = true
        hasError = false
        let productsUrlString = "https://real-pink-pangolin-vest.cyclic.app/getProductInfo"
        if let url = URL(string: productsUrlString) {
            
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
                               let products = try? decoder.decode([Product].self, from: data) {
                                
                                self?.products = products
                                
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
}
