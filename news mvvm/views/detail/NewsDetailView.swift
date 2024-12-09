//
//  NewsDetailView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI

struct NewsDetailView: View {
    
    let news : Article
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // News Image with guard for nullsafety
                if let guardImage = news.urlToImage, let imageUrl = URL(string: guardImage), ((news.urlToImage?.isEmpty) == nil) {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                    } placeholder: {
                        ProgressView() // Placeholder for missing image
                    }
                }
                
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
        }
        .navigationTitle("News Detail")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

//#Preview {
//    NewsDetailView(
//        news:Article(
//            author: "Jane Smith",
//            content: "Another article content.",
//            description: "Short description for the second news.",
//            publishedAt: "2024-12-05T10:00:00Z",
//            source: Source(id:"2", name: "Another News"),
//            title: "Big Announcement Today!",
//            url:"",
//            urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
//        )
//    )
//}
