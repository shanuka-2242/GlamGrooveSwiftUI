//
//  SectionTitleAll.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC02 on 2024-03-18.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = "Title"
    @State var titleAll: String = "View All"

    var didTap : (() -> ())?
    var body: some View {
        
        HStack{
            Text(title)
                .font(.customfont(.bold, fontSize: 20))
                .foregroundColor(.black)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 15))
                .foregroundColor(.gray)
            
        }
        
    }
}

#Preview {
    SectionTitleAll()
        .padding(20)
}
