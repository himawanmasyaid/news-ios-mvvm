//
//  HomeView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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

            List(getNewsList) { news in
                NewsItem(news: news)
            }.listStyle(PlainListStyle())
            
        }
    }
}

struct NewsItem: View {
    
    let news: NewsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if let imageUrl = URL(string: news.urlToImage), !news.urlToImage.isEmpty {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    ProgressView() // Placeholder while loading
                }
            }
            
    
            Text(news.title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(news.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
            
            HStack {
                 if !news.author.isEmpty {
                     Text("By \(news.author)")
                         .font(.caption)
                         .foregroundColor(.secondary)
                 }
                 Spacer()
                 Text("date sample")
                     .font(.caption)
                     .foregroundColor(.secondary)
             }
        
            
        }.padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

let getNewsList = [
    NewsModel(
        author: "Jane Smith",
        content: "Another article content.",
        description: "Short description for the second news.",
        publishedAt: "2024-12-05T10:00:00Z",
        source: NewsModel.Source(id: "2", name: "Another News"),
        title: "Big Announcement Today!",
        url:"",
        urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
    ),
    NewsModel(
        author: "Jane Smith",
        content: "Another article content.",
        description: "Short description for the second news.",
        publishedAt: "2024-12-05T10:00:00Z",
        source: NewsModel.Source(id: "2", name: "Another News"),
        title: "Big Announcement Today!",
        url:"",
        urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
    ),
    getNews,
    getNews,
    getNews,
]

let getNews = NewsModel(
    author: "Jane Smith",
    content: "Another article content.",
    description: "Short description for the second news.",
    publishedAt: "2024-12-05T10:00:00Z",
    source: NewsModel.Source(id: "2", name: "Another News"),
    title: "Big Announcement Today!",
    url:"",
    urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
)


#Preview {
    
    HomeView()
    
//    NewsItem(
//        news: getNews
//    )
}