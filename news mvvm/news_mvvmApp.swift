//
//  news_mvvmApp.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

@main
struct news_mvvmApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
        }.environmentObject(homeViewModel)
    }
}
