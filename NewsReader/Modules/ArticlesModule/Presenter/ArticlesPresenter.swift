//
//  ArticlesPresenter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class ArticlesPresenter {
   
   var articles:[Article]? {
      didSet {
         view?.refreshTableView()
      }
   }
   
   weak var view:ArticlesView?
   var router:ArticlesWireframe?
   var interactor:ArticlesUseCase?
   
}

extension ArticlesPresenter: ArticlesPresentation {
   
   func viewDidLoad() {
      
      refreshArticles()
   }
   
   func refreshArticles() {
      self.interactor?.downloadArticles(completion: { articles in
         self.articles = articles
      })
   }
   
   func showDetails(for article: Article?) {
      guard let article = article else { return }
      router?.showDetails(for: article)
   }
}

extension ArticlesPresenter: ArticlesInteractorOutput {
   func showErrorAlert(with title:String, and message: String) {
      view?.showErrorAlert(with: title, and: message)
   }
}
