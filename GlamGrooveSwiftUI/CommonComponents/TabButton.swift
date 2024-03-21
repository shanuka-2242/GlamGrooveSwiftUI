//
//  TabButton.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "Icon"
    var isSelect: Bool  = false
    var didSelect: (()->())

    var body: some View {
        
        //Tab button
        Button(action: {
            //debugPrint("Tab button tapped")
            didSelect()
        }, label: {
            VStack{
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.customfont(.regular, fontSize: 14))
            }
        })
        .foregroundColor(isSelect ? .black : .gray)
        .frame(minWidth: 0, maxWidth: .infinity)    }
}

#Preview {
    TabButton {
        //print("Test")
    }
}
