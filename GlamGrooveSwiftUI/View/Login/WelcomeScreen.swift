//
//  SplashScreen.swift
//  GlamGrooveSwiftUI
//
//  Created by NIBM-LAB04-PC03 on 2024-03-07.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Image("WelcomeScreenImage")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
