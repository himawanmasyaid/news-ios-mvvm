//
//  NewsResponse.swift
//  news mvvm
//
//  Created by Himawan on 12/12/24.
//

import Foundation

struct NewsResponse: Codable, Hashable {
    let articles: [Article]
}
