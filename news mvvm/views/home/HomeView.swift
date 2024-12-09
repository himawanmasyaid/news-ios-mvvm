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

                // content headline news
                if viewModel.isLoadingHeadline {
                    
                    ProgressView("Loading...")
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                } else if let error = viewModel.errorMessageHeadline {
                    
                    Text("Error: \(error)")
                         .foregroundColor(.red)
                         .padding()
                         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    List(viewModel.newsList.indices, id: \.self) { index in
                        
                        let article = viewModel.newsList[index]
                        
                         NavigationLink(destination: NewsDetailView(news: article)) {
                             NewsDetailView(news: article)
                         }
                         .listRowSeparator(.hidden)
                     }
                     .listStyle(PlainListStyle())
                    
                }
                
            }.onAppear {
                Task {
                    await viewModel.getTopHeadlines()
                }
            }
        }
    }
}

struct NewsItem: View {
    
    let news: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            
//            if let imageUrl = URL(string: news.urlToImage ?? ""), !news.urlToImage.isEmpty {
//                AsyncImage(url: imageUrl) { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(maxWidth: .infinity, maxHeight: 200)
//                        .clipped()
//                } placeholder: {
//                    ProgressView() // Placeholder while loading
//                }
//            }
            
            
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
            
            Text(news.title)
                .font(.headline)
                .lineLimit(2)
                .truncationMode(.tail)
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.top, 24)

            
            Text(news.description ?? "-")
                .font(.subheadline)
                .lineLimit(2)
                .truncationMode(.tail)
                .foregroundColor(.gray)
                .padding(.top, 8)
                .padding(.horizontal, 8)
            
            HStack {
                
                Text("By \(news.author ?? "-")")
                    .font(.caption)
                    .foregroundColor(.black)
                
                Spacer()
                Text(formatDate(news.publishedAt))
                    .font(.caption)
                    .foregroundColor(.black)
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
