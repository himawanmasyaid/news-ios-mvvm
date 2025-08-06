//
//  HomeViewModel.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    @Published var newsList: [Article] = []
    @Published var categoryList: [CategoryModel] = []
    @Published var isLoadingHeadline: Bool = false
    @Published var errorMessageHeadline: String?
    
    private let newsRepository: NewsRepositoryProtocol
        
    init(newsRepository: NewsRepositoryProtocol = NewsRepository()) {
        self.newsRepository = newsRepository
    }
    
    
    func getTopHeadlines() {
        isLoadingHeadline = true
        errorMessageHeadline = nil

        newsRepository.fetchNews(country: "us") { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoadingHeadline = false
                switch result {
                case .success(let newsList):
                    self?.newsList = newsList
                case .failure(let error):
                    self?.errorMessageHeadline = error.localizedDescription
                }
            }
        }
    }

    func getCategory() {
        
        let categories: [CategoryModel] = [
            CategoryModel(title: "General", code: "general"),
            CategoryModel(title: "Business", code: "business"),
            CategoryModel(title: "Technology", code: "technology"),
            CategoryModel(title: "Health", code: "health"),
            CategoryModel(title: "Sports", code: "sports"),
            CategoryModel(title: "Science", code: "science"),
            CategoryModel(title: "Entertainment", code: "entertainment")
        ]

        
        self.categoryList = categories
        
    }
    
    func getNewsDummy() {
        
        let getNewsList = [
            Article(
                source: Source(id: "2", name: "Another News"),
                author: "Jane Smith",
                title: "Big Announcement Today!",
                description: "Short description for the second news.",
                url:"",
                urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s",
                publishedAt: "2024-12-05T10:00:00Z",
                content: "Another article content."
            ),
            Article(
                source: Source(id: "2", name: "Another News"),
                author: "Jane Smith",
                title: "Big Announcement Today!",
                description: "Short description for the second news.",
                url:"",
                urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s",
                publishedAt: "2024-12-05T10:00:00Z",
                content: "Another article content."
            ),
            getNews,
            getNews,
            getNews
        ]
        
        self.newsList = getNewsList

        
    }
    
    private let getNews = Article(
        source: Source(id: "2", name: "Another News"),
        author: "Jane Smith",
        title: "Big Announcement Today!",
        description: "Short description for the second news.",
        url:"",
        urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s",
        publishedAt: "2024-12-05T10:00:00Z",
        content: "Another article content."
    )

}
