//
//  ExploreView.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    var body: some View {
        //Text("Hello from Home VM")
        ZStack{
            ScrollView{
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        TextField("Search here", text: $searchText)
                            .font(.customfont(.medium, fontSize: 15))
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(true)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    }
                    .frame(height: 30)
                    .padding(10)
                    .background(Color(.gray).opacity(0.1))
                    .cornerRadius(12)
                    
                    Image("sale_banner")
                        .resizable()
                        .scaledToFill()
                        .padding(.top)
                    
                    SectionTitleAll(title: "Exclusive Offers", titleAll: "See All"){
                        
                    }
                    .padding(.vertical, 4)
                    
                    SectionTitleAll(title: "Product List", titleAll: "See All"){
                        
                    }
                    .padding(.vertical, 4)
                    
                    ForEach (0...3, id: \.self) { a in
                        HStack {
                            ProductCell()
                            //Text("W")
                            ForEach (0...0, id: \.self) { b in
                                ProductCell()
                                //Text("W")

                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
