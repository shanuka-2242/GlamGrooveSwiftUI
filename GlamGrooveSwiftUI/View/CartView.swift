//
//  CartView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var cartItemVM = CartItemViewModel()

    var body: some View {
        
        NavigationView {
            ScrollView {
                
                if cartItemVM.isRefreshing {
                    ProgressView()
                }
                else {
                    VStack(spacing: 16) {
                        ForEach(cartItemVM.cartItems, id: \.cartItemId) { cartItem in
                            CartItemCellView(cartItemImage: cartItem.cartItemImage,
                                             cartItemName: cartItem.cartItemName,
                                             cartItemTotalPrice: cartItem.cartItemPrice,
                                             itemQuantity: cartItem.quantity,
                                             itemSelectedSize: cartItem.cartItemSelectedSize)
                                
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("Your Cart")
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear(perform: {
                cartItemVM.fetchCartItems()
            })
        }
    }
}

#Preview {
    CartView()
}
