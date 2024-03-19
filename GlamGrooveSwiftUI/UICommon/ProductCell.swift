//
//  ProductCell.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct ProductCell: View {
    
    var didAddCart: (()->())?
    
    var body: some View {
        VStack{
            Image("Sisi Relaxed Shirt 1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
            
                .padding()
            //Spacer()
            
            Text("Satin Maxi Jeans")
                .font(.customfont(.medium, fontSize: 16))
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            Spacer()
            
            HStack{
                Text("$125.00")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {didAddCart?()}, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                })
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
