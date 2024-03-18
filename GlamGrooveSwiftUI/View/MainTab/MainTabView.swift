//
//  MainTabView.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel()
    
    var body: some View {
        VStack{
            
            TabView(selection: $homeVM.selectTab){
                                    
                HomeView().tag(0)
                HomeView().tag(1)
                HomeView().tag(2)
                HomeView().tag(3)
            }
//            .onAppear{
//                UIScrollView.appearance().isScrollEnabled = false
//            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .onChange(of: homeVM.selectTab) { newValue in
                debugPrint("Sel Tab : \(newValue)")
            }
            
            HStack {
                
                //Home
                TabButton(title: "Home", icon: "house", isSelect: homeVM.selectTab == 0) {
                    print("Home")
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 0
                        }
                    }
                }
                
                //Explore
                TabButton(title: "Explore", icon: "magnifyingglass", isSelect: homeVM.selectTab == 1) {
                    print("Explore")
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 1
                        }
                    }
                }
                
                //Cart
                TabButton(title: "Cart", icon: "cart", isSelect: homeVM.selectTab == 2) {
                    print("Cart")
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 2
                        }
                    }
                }
                
                //Favourites
                TabButton(title: "Favourites", icon: "heart", isSelect: homeVM.selectTab == 3) {
                    print("Favourites")
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 3
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
