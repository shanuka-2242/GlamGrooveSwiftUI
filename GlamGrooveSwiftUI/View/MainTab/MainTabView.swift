//
//  MainTabView.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct MainTabView: View {
    
    //@StateObject var exploreVM = ExploreViewModel()
    
    var body: some View {
        VStack{
            TabView(selection: .constant(1),
                    content:  {
                ExploreView().tag(1)
                ExploreView().tag(1)
                ExploreView().tag(1)

            })
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
//            .onChange(of: Equatable, initial: <#T##Bool#>, <#T##action: () -> Void##() -> Void#>)
            
            HStack {
                
                //Explore
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Explore")
                            .font(.customfont(.regular, fontSize: 14))
                    }
                })
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                //Cart
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Cart")
                            .font(.customfont(.regular, fontSize: 14))
                   }
                })
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity)

                //Favourite
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Favourite")
                            .font(.customfont(.regular, fontSize: 14))
                    }
                })
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity)

            }
            .padding(.top, 15)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 5)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.15), radius: 3, x: 0, y: -2)
        
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
        
}

#Preview {
    MainTabView()
}
