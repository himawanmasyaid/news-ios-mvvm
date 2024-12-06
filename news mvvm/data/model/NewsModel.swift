//
//  NewsModel.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation

struct NewsModel: Identifiable, Decodable {
    
    let id = UUID()
    let author: String
    let content: String
    let description: String
    let publishedAt: String
    let source: Source
    let title: String
    let url: String
    let urlToImage: String
    
    
    struct Source: Decodable {
        let id: String
        let name: String        
    }
    
}
