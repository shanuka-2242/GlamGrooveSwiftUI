//
//  RoundButton.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-14.
//

import SwiftUI

struct RoundButton: View {
    @State var tittle: String = ""
    var didTap: (()->())?
    
    var body: some View {
        Button(action: {
            didTap?()
        }, label: {
            Text(tittle)
                .font(.customfont(.semibold, fontSize: 22))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight:60 )
        .background(Color.secondaryText)
        .cornerRadius(7)    }
}

#Preview {
    RoundButton()
        .padding(20)
}
