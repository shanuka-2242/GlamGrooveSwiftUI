//
//  ProductCartCellView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import SwiftUI

struct CartItemCellView: View {
    
    @StateObject private var cartItemVM = CartItemViewModel()
    
    //Cart Item Cell Property List
    @State var cartItemId: String = "GG-20240326232007"
    @State var productId: String = "HU"
    @State var cartItemName: String = "Mariana Boyfriend Short"
    @State var cartItemPrice: String = "2000.00"
    @State var cartItemImage: String = "MarianaBoyfriendShort"
    @State var itemQuantity: String = "4"
    @State var itemSelectedSize: String = "UK-6"
    @State var cartItemTotalPrice: String = "8000.00"
    
    @State var isAlertShown: Bool = false
    
    var body: some View {
            HStack(spacing: 15) {
                Image(cartItemImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 110)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                    .padding(.bottom, 7)
                
                VStack(spacing: 8) {
                    HStack {
                        Text(cartItemName)
                            .font(.customfont(.semibold, fontSize: 19))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "trash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.red)
                            .onTapGesture {
                                isAlertShown.toggle()
                            }
                    }
                    
                    Text(itemSelectedSize)
                        .font(.customfont(.semibold, fontSize: 15))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                                        
                    HStack {
                        Text("\(itemQuantity)  • ")
                            .font(.customfont(.medium, fontSize: 16))
                            .padding(.bottom, 5)
                            .foregroundColor(Color.gray)
                        
                        Text("Rs \(cartItemTotalPrice)")
                            .font(.customfont(.medium, fontSize: 16))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .foregroundColor(Color.gray)

                        let defaultProduct = Product(productId: "N/A",
                                        productName: "Product Not Found",
                                        productPrice: "0.00",
                                        productImage: "placeholder_image",
                                        productDescription: "No Description",
                                        availableSizes: "N/A",
                                        ratings: "0",
                                        catagoryName: "N/A",
                                        gender: "N/A")

                        NavigationLink(destination: CartItemEditDetailsView(cartItemId: cartItemId,
                                                                            productId: productId,
                                                                            cartItemImage: cartItemImage,
                                                                            cartItemRating: cartItemVM.getExistingProductById(productId: productId)?.ratings ?? "",
                                                                            cartItemName: cartItemName,
                                                                            cartItemPrice: cartItemPrice,
                                                                            cartItemDescription: cartItemVM.getExistingProductById(productId: productId)?.productDescription ?? "",
                                                                            cartItemSelectedSize: cartItemVM.getProductSelectedSize(existingProduct: cartItemVM.getExistingProductById(productId: productId) ?? defaultProduct, selectedSize: itemSelectedSize),
                                                                            cartItemQuantity: itemQuantity))
                        {
                            Image(systemName: "pencil.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .alert(isPresented: $isAlertShown) {
                    Alert(title: Text("Confirmation"), message: Text("Are you sure about removing the item from the cart?"),
                          primaryButton: .default(Text("Yes"),action: {
                        
                        cartItemVM.deleteCartItemById(cartItemId: cartItemId)
                    }), secondaryButton: .cancel())
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(.gray.opacity(0.7), lineWidth: 1))
            .onAppear(perform: {
                cartItemVM.fetchProducts()
            })
        }
}

#Preview {
    CartItemCellView()
}
