//
//  NewsRepository.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation
import Combine
import Alamofire


protocol NewsRepositoryProtocol {
    func fetchNews(country: String, completion: @escaping (Result<[Article], Error>) -> Void)
}

final class NewsRepository : NewsRepositoryProtocol {
    
    private let BASE_URL = "https://newsapi.org/v2"
    private let API_KEY = "API_KEY"
    
    
    func fetchNews(country: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = "\(BASE_URL)/top-headlines"
        let parameters: [String: String] = [
            "country": country,
            "apiKey": API_KEY
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: NewsResponse.self) { response in
            print("ini adalah log anjing \(response.result)")
            switch response.result {
            case .success(let newsResponse):
                completion(.success(newsResponse.articles))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        
    }
    
}
