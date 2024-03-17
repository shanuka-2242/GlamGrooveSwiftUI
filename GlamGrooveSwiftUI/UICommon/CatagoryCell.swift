//
//  CatagoryCell.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct CatagoryCell: View {
    
    var body: some View {
        
        HStack{
            
            Image("catagory_jeans")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
            
            Text("Jeans")
                .font(.customfont(.medium, fontSize: 23))
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .frame(width: 190, height: 90)
        .background(Color(.gray).opacity(0.4))
        .cornerRadius(15
        )
    }
}

#Preview {
    CatagoryCell()
}
