//
//  ProductCartCellView.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-24.
//

import SwiftUI

struct CartItemCellView: View {
    
    @State var cartItemImage: String = "LSHestonOxfordTShirt"
    @State var cartItemName: String = "LS Heston Oxford Shirt"
    @State var cartItemTotalPrice: String = "7000.00"
    @State var itemQuantity: String = "2"
    @State var itemSelectedSize: String = "UK-6"

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
                        .frame(width: 33, height: 33)
                        .foregroundColor(.red)
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
                    
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33, height: 33)
                        .foregroundColor(.blue)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.gray.opacity(0.7), lineWidth: 1))
    }
}

#Preview {
    CartItemCellView()
}
