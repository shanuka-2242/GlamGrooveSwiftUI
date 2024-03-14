//
//  SplashScreen.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-07.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
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
                
                RoundButton(tittle: "Start Shopping"){
                    
                }
                
                Spacer()
                    .frame(height: 60)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
