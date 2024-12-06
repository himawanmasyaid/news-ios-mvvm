//
//  HomeView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // toolbar
                HStack {
                    Spacer()
                    Image("ic_news")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 60)
                    Spacer()
                    
                }.frame(height: 50)
                 .background(Color.white)
                 .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
                            
                Spacer()

                List(viewModel.newsList) { news in
                    NavigationLink(
                        destination: {
                            NewsDetailView(news: news)
                        }
                    ) {
                        NewsItem(news: news)
                    }.listRowSeparator(.hidden)
                    
                }.listStyle(PlainListStyle())
                    
            }.onAppear {
                viewModel.getNewsDummy()
            }
        }
    }
}

struct NewsItem: View {
    
    let news: NewsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let imageUrl = URL(string: news.urlToImage), !news.urlToImage.isEmpty {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .clipped()
                } placeholder: {
                    ProgressView() // Placeholder while loading
                }
            }
            
            
            Text(news.title)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.top, 24)
            
            Text(news.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 8)
                .padding(.horizontal, 8)
            
            HStack {
                if !news.author.isEmpty {
                    Text("By \(news.author)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(formatDate(news.publishedAt))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 8)
            .padding(.horizontal, 8)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .padding(.trailing, 8) // padding end
        .padding(.leading, 24) // padding start
        .padding(.vertical, 8)
        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
        
    }
}

#Preview {
    
    HomeView()
    
}
