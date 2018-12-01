//
//  ArticlesContract.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

protocol ArticlesView: class {
   func refreshTableView()
   func showErrorAlert(with title:String, and message: String)
}

protocol ArticlesPresentation {
   var articles:[Article]? { get }
   func viewDidLoad()
   func showDetails(for article:Article?)
   func refreshArticles()
}

protocol ArticlesUseCase {
   func downloadArticles(for country:Country, completion: @escaping ([Article])->())
}

protocol ArticlesInteractorOutput {
   func showErrorAlert(with title:String, and message: String)
}

protocol ArticlesWireframe {
   func showDetails(for article: Article)
}
