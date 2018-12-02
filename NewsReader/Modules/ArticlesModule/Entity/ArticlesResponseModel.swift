//
//  ArticlesResponseModel.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

struct ArticlesResponseModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
   
    let source: Source?
    let author: String?
    let title, description, url, urlToImage: String?
    let publishedAt, content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
