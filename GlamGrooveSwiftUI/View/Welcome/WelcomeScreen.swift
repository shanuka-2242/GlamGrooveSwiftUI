//
//  SplashScreen.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-07.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        NavigationView(content: {
            ZStack {
                Image("WelcomeScreenImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight)
                
                VStack {
                    Spacer()
                    
                    Text("Welcome to\nGlam Groove")
                        .font(.customfont(.bold, fontSize: 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)
                    
                    Text("Find your elegance")
                        .font(.customfont(.regular, fontSize: 20))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination: MainTabView(), label:{
                        Text("Start Shopping")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 55, maxHeight:55 )
                            .background(Color.gray.opacity(0.9))
                            .cornerRadius(10)
                    })
                    
                    Spacer()
                        .frame(height: 60)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        })
    }
}

#Preview {
    SplashScreen()
}
