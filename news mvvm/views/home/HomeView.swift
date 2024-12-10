//
//  HomeView.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

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
                            
                Spacer() // memberi jarak toolbar dengan content

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
                                        
                    ScrollView {
                        // using for earch
                        ForEach(viewModel.newsList.indices, id: \.self) { index in
        
                            let item = viewModel.newsList[index]
                            
                             NavigationLink(destination: NewsDetailView(news: item)) {
                                 NewsItem(news:item)
                             }
                        }
                        
                    }

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
        
            loadImage(urlString: news.urlToImage)
            
            Text(news.title)
                .lineLimit(2)
                .multilineTextAlignment(.leading) // untuk posisi text mulai dari start
                .font(.headline)
                .foregroundColor(.black)
                .truncationMode(.tail)
                .padding(.horizontal, 8)
                .padding(.top, 24)

            
            Text(news.description ?? "-")
                .lineLimit(2) // untuk max line pada text
                .multilineTextAlignment(.leading) // untuk posisi text mulai dari start
                .font(.subheadline) // untuk size text
                .foregroundColor(.gray) // untuk warna text
                .truncationMode(.tail) // untuk titik titk di akhir text
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
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)

    }
}

#Preview {
    
    HomeView()
    
}
