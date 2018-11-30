//
//  ArticlesContract.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

//ViewController
protocol ArticlesView: class {
   func refreshArticles()
}

//Presenter
protocol ArticlesPresentation {
   var articles:[Article]? { get }
   func viewDidLoad()
   func showDetails(for article:Article?)
}

//Presenter -> Interactor
protocol ArticlesUseCase {
   func downloadArticles(completion: @escaping ([Article])->())
}

//Interactor -> Presenter
protocol ArticlesInteractorOutput {
   
}

//Router
protocol ArticlesWireframe {
   func showDetails(for article: Article)
}
