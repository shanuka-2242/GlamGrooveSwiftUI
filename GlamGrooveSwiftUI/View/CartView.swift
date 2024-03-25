//
//  CartView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-23.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var orderVM = OrderViewModel()

    var body: some View {
        
        NavigationView {
            ScrollView {
                
                if orderVM.isRefreshing {
                    ProgressView()
                }
                else {
                    VStack {
                        ForEach(orderVM.orders, id: \.orderId) { order in
                            //NavigationLink(destination: ProductDetailsView (product: product)) {
                            
                            OrderCellView(orderImage: order.items.first?.itemImage ?? "notFound",
                                          orderID: order.orderId,
                                          orderTotalPrice: order.totalPrice, 
                                          totalItemsQuantity: "4")
                                
                            //}
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
            .navigationTitle("Your Cart")
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear(perform: {
                orderVM.fetchOrders()
            })
        }
    }
}

#Preview {
    CartView()
}
