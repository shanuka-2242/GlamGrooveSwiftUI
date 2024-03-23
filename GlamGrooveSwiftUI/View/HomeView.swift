//
//  ProductView.swift
//  ClassTuteFour
//
//  Created by User Account  on 2024-03-22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var productsVM = HomeViewModel()
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    @State private var searchTerm = ""
    
    var filteredProducts: [Product] {
        
        guard !searchTerm.isEmpty else {return productsVM.products}
        return productsVM.products.filter {
            $0.productName.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                if productsVM.isRefreshing {
                    ProgressView()
                }
                else {
                    Image("sale_banner")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom)
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        
                        
                        ForEach(filteredProducts, id: \.productId) { product in
                            
                            ProductCell(productImage: product.productImage, productName: product.productName, productPrice: product.productPrice)
                        }
                    }
                    .padding(.horizontal, 8)
                }
                
            }
            .navigationTitle("Products")
            .searchable(text: $searchTerm, prompt: "Search Products")
            .onAppear(perform: {
                productsVM.fetchProducts()
            })
            .alert(isPresented: $productsVM.hasError, error: productsVM.error) {
                Button(action: productsVM.fetchProducts) {
                    Text("Retry")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
