//
//  SearchViewModel.swift
//  news mvvm
//
//  Created by Himawan on 13/12/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var newsList: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let newsRepository: NewsRepositoryProtocol
        
    init(newsRepository: NewsRepositoryProtocol = NewsRepository()) {
        self.newsRepository = newsRepository
    }
    
    func searchNews(keyword: String) {
        
        newsRepository.fetchSearchKeyword(keyword: keyword) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let newsList):
                    self?.newsList = newsList
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        
        
    }
    
}
