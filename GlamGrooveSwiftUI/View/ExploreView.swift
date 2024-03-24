//
//  ExploreView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var explorerVM = ExploreViewModel()
    
    @State private var isAlertShown = false
    @State private var errorMessage = ""
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    @State var selectedCategory: String = "All"
    @State var minimumPrice: String = ""
    @State var maximumPrice: String = ""
    @State var isPriceAnyRangeSelected: Bool = false
    //@state private var filteredProductList = [Product]()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                if explorerVM.isRefreshing {
                    ProgressView()
                }
                else{
                    VStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                            HStack {
                                Text("Category")
                                    .font(.customfont(.medium, fontSize: 18))
                                
                                Picker(selection: $selectedCategory) {
                                    Text("All").tag("All")
                                    Text("Jeans").tag("Jeans")
                                    Text("Shirts").tag("Shirts")
                                    Text("Shorts").tag("Shorts")
                                    Text("T - Shirts").tag("T - Shirts")
                                } label: {}
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Price Range")
                                    .font(.customfont(.medium, fontSize: 18))
                                
                                Toggle("Any Price Range", isOn: $isPriceAnyRangeSelected)
                                    .font(.customfont(.medium, fontSize: 15))
                                    .onTapGesture {
                                        
                                        if(isPriceAnyRangeSelected) {
                                            minimumPrice = ""
                                            maximumPrice = ""
                                            
                                        }
                                    }
                                
                                TextField("Minimum Price", text: $minimumPrice)
                                    .padding(.all, 12)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                    .font(.customfont(.regular, fontSize: 15))
                                    .disabled(isPriceAnyRangeSelected)
                                
                                TextField("Maximum Price", text: $maximumPrice)
                                    .padding(.all, 12)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                                    .font(.customfont(.regular, fontSize: 15))
                                    .disabled(isPriceAnyRangeSelected)
                                
                                Button(action: {
                                    if(isPriceAnyRangeSelected) {

                                        if(explorerVM.getFilteredProducts(productCetagory: selectedCategory).count > 0) {
                                            
//                                            filteredProductList = explorerVM.getFilteredProducts(productCetagory: selectedCategory)
                                        }
                                        else{
                                            
                                            errorMessage = "Filtered products are unavailable."
                                            isAlertShown.toggle()
                                        }
                                    }
                                    else {
                                        
                                        if( !minimumPrice.isEmpty && !maximumPrice.isEmpty) {
                                            if(minimumPrice.hasSuffix(".00") && maximumPrice.hasSuffix(".00")) {
                                                
                                                //Logic
                                                
                                            } else{
                                                
                                                errorMessage = "Input text format similar to '3000.00'."
                                                isAlertShown.toggle()
                                            }
                                        } else {
                                            errorMessage = "Text fields cannot be empty."
                                            isAlertShown.toggle()
                                        }
                                    }
                                    
                                },label: {
                                    Image(systemName:"line.horizontal.3.decrease.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 23, height: 23)
                                        .foregroundColor(.black)
                                        .padding(.trailing,5)
                                    
                                    Text("Filter Products")
                                        .foregroundColor(.black)
                                        .font(.customfont(.regular, fontSize: 16))
                                    
                                })
                                .padding(.vertical, 15)
                                .alert(isPresented: $isAlertShown) {
                                    Alert(title: Text("Alert"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(explorerVM.getFilteredProducts(productCetagory: selectedCategory), id: \.productId) { product in
                                NavigationLink(destination: ProductDetailsView (product: product)) {
                                    ProductCell(productImage: product.productImage,
                                                productName: product.productName,
                                                productPrice: product.productPrice)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 20)
                }
            }
            .onAppear(perform: {
                explorerVM.fetchProducts()
            })
            .navigationTitle("Explore Products")
        }
    }
}

#Preview {
    ExploreView()
}
