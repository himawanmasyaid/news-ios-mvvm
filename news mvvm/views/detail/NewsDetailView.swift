//
//  NewsDetailView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

struct NewsDetailView: View {
    
    let news : Article
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                loadImage(urlString: news.urlToImage, maxHeight: 300)
                
                // News Title
                Text(news.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                // News Description
                Text(news.description ?? "-")
                    .font(.body)
                    .foregroundColor(.gray)
                
                // Author and Published Date
                HStack {
                    
                    Text("By \(news.author ?? "-")")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(formatDate(news.publishedAt))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                // News Content
                Text(news.content ?? "-")
                    .font(.body)
                    .foregroundColor(.black)
            }
            .padding()
        }.environmentObject(homeViewModel).onAppear {
//            homeViewModel.counterView += 1
        }
        .navigationTitle("News Detail")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}
