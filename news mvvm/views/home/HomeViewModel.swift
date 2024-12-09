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
    @Published var isLoadingHeadline: Bool = false
    @Published var errorMessageHeadline: String?
    
    private let newsRepository: NewsRepositoryProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
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
//
//    func getNewsDummy() {
//        
//        let getNewsList = [
//            NewsModel(
//                author: "Jane Smith",
//                content: "Another article content.",
//                description: "Short description for the second news.",
//                publishedAt: "2024-12-05T10:00:00Z",
//                source: NewsModel.Source(id: "2", name: "Another News"),
//                title: "Big Announcement Today!",
//                url:"",
//                urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
//            ),
//            NewsModel(
//                author: "Jane Smith",
//                content: "Another article content.",
//                description: "Short description for the second news.",
//                publishedAt: "2024-12-05T10:00:00Z",
//                source: NewsModel.Source(id: "2", name: "Another News"),
//                title: "Big Announcement Today!",
//                url:"",
//                urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
//            ),
//            getNews,
//            getNews,
//            getNews
//        ]
//        
//        self.newsList = getNewsList
//
//        
//    }
//    
//    private let getNews = NewsModel(
//        author: "Jane Smith",
//        content: "Another article content.",
//        description: "Short description for the second news.",
//        publishedAt: "2024-12-05T10:00:00Z",
//        source: NewsModel.Source(id: "2", name: "Another News"),
//        title: "Big Announcement Today!",
//        url:"",
//        urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
//    )

}
