//
//  NewsModel.swift
//  news mvvm
//
//  Created by Himawan on 6/12/24.
//

import Foundation


struct Article: Codable, Hashable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}
