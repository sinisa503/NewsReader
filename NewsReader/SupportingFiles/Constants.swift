//
//  Constants.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

struct Constant {
   
}

struct ApiConstant {
   
   //BASE URL
   static let baseUrl = "https://newsapi.org"
   
   //ENPOINTS
   static let topHeadlinesEndpoint = "v2/top-headlines"
   static let allHeadlines = "v2/everything"
   
   //KEYS
   static let KEY_JSON = "application/json"
   static let KEY_API_KEY = "apiKey"
   static let KEY_COUNTRY = "country"
   static let KEY_Q = "q"
   
   //VALUES
   static let VALUE_JSON = "Accept"
   static let API_KEY = "f0a2b4b522304af1979e02ef520758e9"
   static let VALUE_TECHNOLOGY = "technology"
}
