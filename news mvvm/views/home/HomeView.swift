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
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
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
    
                ScrollView(.horizontal, showsIndicators: false) {
                    CategoryContentView(viewModel: viewModel)
                }.padding(.top, 24)
                
                Spacer() // memberi jarak toolbar dengan content
                
                ScrollView() {
                    
                    HStack {
                        Text("Top Headline: \(homeViewModel.counterView)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                        
                        Spacer()
                    }
                    
                    HeadlineContentView(viewModel: viewModel)
                    
                }
    
                
            }.onAppear {
                viewModel.getCategory()
                viewModel.getTopHeadlines()
            }
        }.environmentObject(homeViewModel)
    }
    
}


struct CategoryContentView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(viewModel.categoryList.indices, id: \.self) { index in
                let item = viewModel.categoryList[index]
                
                if (index == 0) {
                    Spacer(minLength: 16)
                }
                
                NavigationLink(destination: CategoryView(category: item)) {
                    CategoryItemView(category: item)
                }
                
                Spacer(minLength: 4)
                
                if (index + 1 < viewModel.categoryList.count) {
                    
                    VStack {
                        
                    }
                    .frame(width: 1, height: 10)
                    .background(Color.black)
                    
                    Spacer(minLength: 4)
                } else {
                    Spacer(minLength: 16)
                }
                            
            }
        }
    }
}

struct HeadlineContentView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
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
            
            ScrollView() {
                // using for earch
                ForEach(viewModel.newsList.indices, id: \.self) { index in
                    
                    let item = viewModel.newsList[index]
                    
                    NavigationLink(destination: NewsDetailView(news: item)) {
                        NewsItem(news:item)
                    }
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

struct CategoryItemView: View {
    
    let category : CategoryModel
    
    var body: some View {
 
        Text("\(category.title)")
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        
    }
}

#Preview {
    
    HomeView()
    
}
