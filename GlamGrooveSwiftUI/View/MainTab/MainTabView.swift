//
//  MainTabView.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var exploreVM = ExploreViewModel()
    
    var body: some View {
        VStack{
            TabView(selection: $exploreVM.selectTab,
                    content:  {
                ExploreView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)

            })
//            .onAppear{
//                UIScrollView.appearance().isScrollEnabled = false
//            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .onChange(of: exploreVM.selectTab) { newValue in
                debugPrint("Sel Tab : \(newValue)")
            }
            
            HStack {
                
                //Explore
                TabButton(title: "Explore", icon: "magnifyingglass", isSelect: exploreVM.selectTab == 0) {
                    print("Explore")
                    DispatchQueue.main.async {
                        withAnimation{
                            exploreVM.selectTab = 0
                        }
                    }
                }
                
                //Cart
                TabButton(title: "Cart", icon: "cart", isSelect: exploreVM.selectTab == 1) {
                    print("Cart")
                    DispatchQueue.main.async {
                        withAnimation{
                            exploreVM.selectTab = 1
                        }
                    }
                }
                
                //Favourites
                TabButton(title: "Favourites", icon: "heart", isSelect: exploreVM.selectTab == 2) {
                    print("Favourites")
                    DispatchQueue.main.async {
                        withAnimation{
                            exploreVM.selectTab = 2
                        }
                    }
                }
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
