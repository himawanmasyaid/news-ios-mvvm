//
//  HomeViewModel.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation


class HomeViewModel: ObservableObject {

    @Published var newsList: [NewsModel] = []

    func getNewsDummy() {
        
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
            getNews
        ]
        
        self.newsList = getNewsList

        
    }
    
    private let getNews = NewsModel(
        author: "Jane Smith",
        content: "Another article content.",
        description: "Short description for the second news.",
        publishedAt: "2024-12-05T10:00:00Z",
        source: NewsModel.Source(id: "2", name: "Another News"),
        title: "Big Announcement Today!",
        url:"",
        urlToImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcMZAw6lm9s-UNFPFMRXSAe1t4r1dWS4nKkw&s"
    )

}
