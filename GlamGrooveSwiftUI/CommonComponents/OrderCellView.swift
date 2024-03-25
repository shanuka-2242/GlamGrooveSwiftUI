//
//  ProductCartCellView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import SwiftUI

struct OrderCellView: View {
    
    @State var orderImage: String = "LSHestonOxfordTShirt" //Order's first item's image
    @State var orderID: String = "Order ID" //Random genarated number
    @State var orderTotalPrice: String = "6000.00" //Order total price
    @State var totalItemsQuantity: String = "2" //Total items in the order

    var body: some View {
        HStack(spacing: 15) {
            Image(orderImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 130)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                .padding(.bottom, 7)
            
            VStack(spacing: 8) {
                Text(orderID)
                    .font(.customfont(.semibold, fontSize: 19))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text("\(totalItemsQuantity)  • Rs. \(orderTotalPrice)")
                    .font(.customfont(.medium, fontSize: 16))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                    .foregroundColor(Color.gray)
                
                Text("View Order")
                    .font(.customfont(.semibold, fontSize: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight:40 )
                    .padding(4)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
            }
            
            VStack {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            .frame(height: 130, alignment: .top)
            
        }
        .frame(width: .infinity)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.gray.opacity(0.7), lineWidth: 1))
    }
}

#Preview {
    OrderCellView()
}
