//
//  Settings.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 02/12/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class Settings {
   
   private init(){}
   static let shared = Settings()
   
   //Initial search is all articles
   var searchEndpoint:ArticleEndpoint = .allHeadlines
}
