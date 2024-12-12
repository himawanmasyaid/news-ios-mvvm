//
//  CategoryViewModel.swift
//  news mvvm
//
//  Created by Himawan on 12/12/24.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    
    @Published var newsList: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    
    private let newsRepository: NewsRepositoryProtocol

    init(newsRepository: NewsRepositoryProtocol = NewsRepository()) {
        self.newsRepository = newsRepository
    }
    
    func getNewsByCategory(category: String) {
        
        isLoading = true
        errorMessage = nil

        newsRepository.fetchNewsByCategory(category: category) { [weak self] result in
         
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
