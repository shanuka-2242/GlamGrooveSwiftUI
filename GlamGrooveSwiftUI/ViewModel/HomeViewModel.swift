//
//  File.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import Foundation

final class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()
    @Published var selectTab: Int = 0
    @Published var products: [ProductModel]?
    
    func getProducts() async {
        
        do {
            let products = try await WebService.getProductData()
            self.products = products
            //print(products)
        } catch (let error) {
            //print(error.localizedDescription)
        }
    }
    
//    @Published var txtSearch: String = ""
//    @Published var showError = false
//    @Published var errorMessage: String = ""

}

final class WebService {
    
    static func getProductData() async throws -> [ProductModel] {
        
        let urlString = "https://real-pink-pangolin-vest.cyclic.app/getProductInfo"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            
            let decoder = JSONDecoder()
            return try decoder.decode([ProductModel].self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
        
    }
}

enum ErrorCases: LocalizedError {
    
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        
        switch self {
        case .invalidURL:
            return "Invalid URL found."
            
        case .invalidResponse:
            return "Invalid response found"
            
        case .invalidData:
            return "Invalid data found."
            
        }
    }
}
