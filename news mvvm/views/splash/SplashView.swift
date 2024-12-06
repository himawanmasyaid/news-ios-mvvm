//
//  SplashView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isNavigateToHome = false
    
    var body: some View {
        
        if isNavigateToHome {
            HomeView()
        } else {
            ZStack {
                Color("PrimaryColor") // Background color
                    .ignoresSafeArea()
                VStack {
                    Image("ic_logo_news_api")
                        .resizable()
                        .frame(width: 200, height: 100)
                }
            }.onAppear {
                // Delay of 2 seconds before navigating
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // navigate to home view
                    isNavigateToHome = true
                }
            }
        }
        
    }
}

#Preview {
    SplashView()
}
