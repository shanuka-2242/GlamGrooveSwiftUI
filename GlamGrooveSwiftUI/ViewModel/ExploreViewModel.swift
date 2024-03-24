//
//  ExploreViewModel.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var filteredProductList: [Product] = []
    @Published var hasError = false
    @Published var error: ErrorCases?
    @Published private(set) var isRefreshing = false
    
    func fetchProducts() {
        
        isRefreshing = true
        hasError = false
        let productsUrlString = "http://localhost:5000/getProductInfo"
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
    
    // Price range not selected function
    func getFilteredProducts(productCetagory: String) -> [Product]{
        
        var returnedProductArray = [Product]()
        
        if(productCetagory == "All"){
            returnedProductArray = products
        }
        else {
            if(products.count > 0) {
                returnedProductArray = products.filter { $0.catagoryName == productCetagory }
                
            }
            else {
                return returnedProductArray
            }
        }
        return returnedProductArray
    }
    
    //Price range selected function
    func getFilteredProducts(productCategory: String, minPrice: String, maxPrice: String) -> [Product] {
        
        var returnedProductArray = [Product]()
        let dMinPrice = Double(minPrice)
        let dMaxPrice = Double(maxPrice)
        
        if(products.count > 0) {
            
            if(productCategory == "All"){
                
                returnedProductArray = products.filter { product in
                    guard let dProductPrice = Double(product.productPrice) else {
                        return false
                    }
                    return dProductPrice >= dMinPrice ?? 0 &&
                    dProductPrice <= dMaxPrice ?? 0
                }
            }
            else {
                
                returnedProductArray = products.filter { product in
                    guard let dProductPrice = Double(product.productPrice) else {
                        return false
                    }
                    return product.catagoryName == productCategory &&
                    dProductPrice >= dMinPrice ?? 0 &&
                    dProductPrice <= dMaxPrice ?? 0
                }
            }
        }
        else {
            return returnedProductArray
        }
        return returnedProductArray
    }
}
