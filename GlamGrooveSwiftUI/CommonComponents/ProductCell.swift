//
//  ProductCell.swift
//  ClassTuteFour
//
//  Created by User Account  on 2024-03-22.
//

import SwiftUI

struct ProductCell: View {
    
    @State var productImage: String = "SisiRelaxedShirt"
    @State var productName: String = "Sisi Relaxed Shirt"
    @State var productPrice: String = "3000.00"
    
    var body: some View {
        VStack {
            Image(productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 130)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
                .padding(.bottom, 7)
            
            Text(productName)
                .font(.customfont(.regular, fontSize: 15))
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            
            Spacer()
            
            HStack{
                Text("Rs " + productPrice)
                    .font(.customfont(.medium, fontSize: 15))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
            }
        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.gray.opacity(0.7), lineWidth: 1))
    }
}

#Preview {
    ProductCell()
}
