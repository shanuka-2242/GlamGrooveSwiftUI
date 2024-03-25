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
                    VStack {
                        ForEach(cartItemVM.cartItems, id: \.cartItemId) { cartItem in
                            //NavigationLink(destination: ProductDetailsView (product: product)) {
                            
//                            OrderCellView(orderImage: cartItem.cartItemImage,
//                                          orderID: cartItem.cartItemId,
//                                          orderTotalPrice: cartItem.itemsTotalPrice,
//                                          totalItemsQuantity: "4")
                                
                            //}
                        }
                    }
                    .padding(.horizontal, 12)
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
